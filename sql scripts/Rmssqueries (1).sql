with ExRmssCOMP as 
(
select 
t1.*,
t1.SEQ_TOTAL_TIME as SEQ_TOTAL_TIME1,
t2.SEQ_TOTAL_TIME SEQ_TOTAL_TIME2
from
(select * from external_rmss where creation_date = '11-May-2023' and route_period_end = '11-Mar-2023' and vol_period_start = '11-Mar-2022' and finance_number is not null)t1
join
(select * from external_rmss where creation_date = '30-Mar-2023' and route_period_end = '11-Mar-2023' and finance_number is not null) t2
on t1.finance_number = t2.finance_number and t1.zip_code = t2.zip_code and t1.route_id = t2.route_id and t1.ams_route_id = t2.ams_route_id
)
select * from ExRmssCOMP
order by finance_number, zip_code, route_id, ams_route_id;



SELECT * FROM 
(SELECT zip_code, ams_route_id, route_id, creation_date, t27 FROM EXTERNAL_RMSS WHERE creation_date = '11-May-23') rank1
JOIN
(SELECT zip_code, ams_route_id, route_id, creation_date, t27 FROM EXTERNAL_RMSS WHERE creation_date = '27-Apr-23') rank2
ON rank1.t27 != rank2.t27  AND rank1.zip_code = rank2.zip_code AND rank1.ams_route_id = rank2.ams_route_id;


with updatedRoutes as (SELECT AVAILABLE_RSD_SEQ, ZIP_CODE, ROUTE_ID, RSD_DATE, IS_VALID FROM ( SELECT * FROM ( SELECT AVAILABLE_RSD_SEQ, ZIP_CODE, ROUTE_ID, RSD_DATE, IS_VALID, rank() OVER(PARTITION BY ZIP_CODE, ROUTE_ID ORDER BY RSD_DATE desc) AS rnk FROM available_rsd WHERE rsd_date >= '27-APR-23' AND IS_VALID = 'Y' AND effective_date < '10-MAR-23' ORDER BY RSD_DATE DESC ) WHERE rnk = 1 ))
select t27_comp.* from
(SELECT rank1.*, rank2.t27 as t27b FROM
(SELECT zip_code, ams_route_id, route_id, creation_date, t27 FROM EXTERNAL_RMSS WHERE creation_date = '11-May-23') rank1
JOIN
(SELECT zip_code, ams_route_id, route_id, creation_date, t27 FROM EXTERNAL_RMSS WHERE creation_date = '27-Apr-23') rank2
ON rank1.t27 != rank2.t27  AND rank1.zip_code = rank2.zip_code AND rank1.ams_route_id = rank2.ams_route_id
) t27_comp
left join (select * from updatedRoutes) rsdUp
on t27_comp.zip_code = rsdUp.ZIP_CODE and t27_comp.ams_route_id = rsdUp.route_id
where rsdUp.ZIP_CODE is null;


with updatedRoutes as (SELECT AVAILABLE_RSD_SEQ, ZIP_CODE, ROUTE_ID, RSD_DATE, IS_VALID FROM ( SELECT * FROM ( SELECT AVAILABLE_RSD_SEQ, ZIP_CODE, ROUTE_ID, RSD_DATE, IS_VALID, rank() OVER(PARTITION BY ZIP_CODE, ROUTE_ID ORDER BY RSD_DATE desc) AS rnk FROM available_rsd WHERE rsd_date > '27-APR-23' AND IS_VALID = 'Y' AND effective_date < '10-MAR-23' ORDER BY RSD_DATE DESC ) WHERE rnk = 1 ))
select t29_comp.* from
(SELECT rank1.*, rank2.t29 as t29b FROM
(SELECT zip_code, ams_route_id, route_id, creation_date, t29 FROM EXTERNAL_RMSS WHERE creation_date = '11-May-23') rank1
JOIN
(SELECT zip_code, ams_route_id, route_id, creation_date, t29 FROM EXTERNAL_RMSS WHERE creation_date = '27-Apr-23') rank2
ON rank1.t29 != rank2.t29  AND rank1.zip_code = rank2.zip_code AND rank1.ams_route_id = rank2.ams_route_id
) t29_comp
left join (select * from updatedRoutes) rsdUp
on t29_comp.zip_code = rsdUp.ZIP_CODE and t29_comp.ams_route_id = rsdUp.route_id
where rsdUp.ZIP_CODE is null;

with updatedRoutes as (SELECT AVAILABLE_RSD_SEQ, ZIP_CODE, ROUTE_ID, RSD_DATE, IS_VALID FROM ( SELECT * FROM ( SELECT AVAILABLE_RSD_SEQ, ZIP_CODE, ROUTE_ID, RSD_DATE, IS_VALID, rank() OVER(PARTITION BY ZIP_CODE, ROUTE_ID ORDER BY RSD_DATE desc) AS rnk FROM available_rsd WHERE rsd_date >= '30-MAR-23' AND IS_VALID = 'Y' AND effective_date < '10-MAR-23' ORDER BY RSD_DATE DESC ) WHERE rnk = 1 ))
select t31a2_comp.*, rsd_date from
(SELECT rank1.*, rank2.t31a as t31a2, rank2.t632 FROM
(SELECT zip_code, ams_route_id, route_id, creation_date, t31a, t63 as t631 FROM EXTERNAL_RMSS WHERE creation_date = '11-May-23') rank1
JOIN
(SELECT zip_code, ams_route_id, route_id, creation_date, t31a, t63 as t632 FROM EXTERNAL_RMSS WHERE creation_date = '30-Mar-23') rank2
ON rank1.t31a != rank2.t31a  AND rank1.zip_code = rank2.zip_code AND rank1.ams_route_id = rank2.ams_route_id
) t31a2_comp
left join (select * from updatedRoutes) rsdUp
on t31a2_comp.zip_code = rsdUp.ZIP_CODE and t31a2_comp.ams_route_id = rsdUp.route_id
where rsdUp.ZIP_CODE is null;

select * from eval_ptr where delivery_date >= '08-Sep-22' and zip_code||route_id = '78599R009';

select delivery_date, count(*) from eval_iv where delivery_date between '09-Sep-22' and '08-Sep-23' and last_updt_date > '09-sep-23' group by delivery_date;

select t03, count(*) from comp_route_fxtr_Tval where last_updt_date >= '24-Sep-23' group by t03;




--- Merges all of the coverage day across the process and outputs it either at the delivery day level or summarized to the route depending on what you comment out
define zr = "'37043R090'"; 			--spread throughout the temp tables are commented out ZR references. Helpful for running small tests or investigating
define min_date = "'11-MAR-22'";  	--alter the date range to be smaller if you want to just test that it runs or if you're looking for specific delivery days
define max_date = "'10-MAR-23'";
define vol_end = "'10-MAR-23'";
define create_date = "'06-SEP-23'"; --this will vary the most depending on what output you want. Make sure to change line 19 to fetch the BYV result associated with the RMSS create date you want

WITH t_values AS (
    SELECT INTERNAL_RMSS_SEQ, FINANCE_NUMBER, ZIP_CODE AS TV_ZIP_CODE, ROUTE_ID AS TV_ROUTE_ID, AMS_ROUTE_ID, ROUTE_EFFECTIVE_DATE, vol_period_end, CREATION_DATE, T63
    FROM internal_Rmss er 
    WHERE CREATION_DATE IN (SELECT max(CREATION_DATE) FROM internal_rmss er2 where vol_period_end = '08-SEP-23' and creation_date >= '19-SEP-23')
--    and zip_code||AMS_ROUTE_ID = &zr
)
,
byv as (
    select zip_code, route_id, later_delivery_date, t63R, t63C from comp_vol_fxtr_tval
    where later_delivery_date = '08-SEP-23'
    and last_updt_date >= '20-SEP-23'
    and comp_vol_fxtr_tval_seq > '3476326'
    ),
mail_volume_records AS (
SELECT t2.*,
sum(bc_record_cnt) over(PARTITION BY zip_code, route_id) AS bc_days,
round(sum(bc_record_cnt) over(PARTITION BY zip_code, route_id) / ziproute_count,2) AS bc_percentage
FROM (
    SELECT cov_eval_route_day_seq, zip_code, route_id, delivery_date, reg_bc_coverage_pct, reg_mv_coverage_pct,  
    reg_final_coverage_pct, cent_final_coverage_pct,
    cbu_coverage_pct AS COV_EVAL_CBU_COVERAGE_PCT, cent_coverage_pct AS COV_EVAL_CENT_COVERAGE_PCT, final_daily_coverage_pct AS COV_EVAL_FINAL_DAILY_COVERAGE_PCT, last_updt_date as cov_eval_updt_date,
        CASE WHEN (reg_bc_coverage_pct = reg_final_coverage_pct) THEN 1 ELSE 0 END AS bc_record_cnt,
        DELIVERY_DATE AS COV_EVAL_DELIVERY_DATE,
        count(*) OVER (PARTITION BY zip_code, route_id) AS ziproute_count
        FROM (
            SELECT cov_eval_route_day_seq, zip_code, route_id, delivery_date, reg_bc_coverage_pct, reg_mv_coverage_pct, reg_final_coverage_pct, cbu_coverage_pct,
            cent_coverage_pct, final_daily_coverage_pct, last_updt_date, cent_final_coverage_pct,
            rank() over(PARTITION BY ZIP_CODE, ROUTE_ID, delivery_date ORDER BY LAST_UPDT_DATE desc) AS rnk
            FROM COV_EVAL_ROUTE_DAY cerd 
            where delivery_date between '09-SEP-22' AND '08-SEP-23'
            and trunc(last_updt_date) <= '08-SEP-23'
--            and zip_code||route_id = &zr
            ORDER BY delivery_date, zip_code
        )t1
        where rnk = 1
    )t2
)
,
iv_mail_table AS (
    SELECT *
    FROM (
        SELECT imvc.*,
        rank() over(PARTITION BY ZIP_CODE, ROUTE_ID, delivery_date ORDER BY LAST_UPDT_DATE desc) AS rnk,
        (total_reg_boxes + total_cbu_boxes + total_cent_boxes) AS total_box_count,
        (total_reg_boxes / (total_reg_boxes + total_cbu_boxes + total_cent_boxes)) AS reg_box_percentage,
        (total_cbu_boxes / (total_reg_boxes + total_cbu_boxes + total_cent_boxes)) AS cbu_box_percentage,
        (total_cent_boxes / (total_reg_boxes + total_cbu_boxes + total_cent_boxes)) AS cent_box_percentage,
        (case when (total_cbu_boxes + total_cent_boxes) = 0 then 0 else (total_cbu_boxes / (total_cbu_boxes + total_cent_boxes)) end) AS cbu_box_perc_of_cent,
        (case when (total_cbu_boxes + total_cent_boxes) = 0 then 0 else (total_cent_boxes / (total_cbu_boxes + total_cent_boxes)) end) AS cent_box_perc_of_cent
        FROM IV_MAIL_VOLUME_COVERAGE imvc
        WHERE delivery_date between '09-SEP-22' AND '08-SEP-23'
--        and zip_code||route_id = &zr
    )
    WHERE rnk = 1
)
,
rmss_updated AS (
    SELECT distinct AMS_ZIP, AMS_NUMBER, RECEIVED_DATE
    FROM RMSS_ROUTE_MASTER rrm
    WHERE RECEIVED_DATE IN (SELECT max(RECEIVED_DATE) FROM RMSS_ROUTE_MASTER rrm2 where received_date <= '08-SEP-23')
--    and ams_zip||ams_number =&zr
    and ams_zip||ams_number is not null
),
day_ref as(
    select * from date_ref
    where day_id between '09-SEP-22' AND '08-SEP-23'
), 
act_agg as (
    select zip_code, route_id, scan_event_date, (residence_flat_scans + residence_letter_scans + all_flat_scans +all_letter_scans +  bh_residence_flat_scans + bh_residence_letter_scans + bh_all_flat_scans + bh_all_letter_scans) saturation_count
    from activity_aggregate
    where (zip_code, route_id, scan_event_date, last_updt_date) in 
        (select zip_code, route_id, scan_event_date, max(last_updt_date) from activity_aggregate
        where scan_event_date between '09-SEP-22' AND '08-SEP-23'
--        and zip_code||route_id = &zr
        group by zip_code, route_id, scan_event_date)
)
----------------------- Comment out the next 5 lines (through the from ( )and last 2 if you want to get the delivery day level info ------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
select tv_zip_code AS ZIP_CODE, TV_ROUTE_ID AS ROUTE_ID,
AVG(T63) AS T63, ROUND(AVG(COV_EVAL_FINAL_DAILY_COVERAGE_PCT),3) AS avg_system_T63, ROUND(AVG(final_combined_calculated),3) AS avg_calculated_t63,
AVG(T63R) AS T63R, ROUND(AVG(reg_final_coverage_pct),5) AS avg_system_T63R, 
AVG(T63C) AS T63C, ROUND(AVG(cent_final_coverage_pct),5) AS avg_system_T63C, ROUND(AVG(final_cent_calculated),5) AS avg_calculated_T63C
from (

	SELECT TV_ZIP_CODE, TV_ROUTE_ID, day_id, COV_EVAL_DELIVERY_DATE, day_of_week, holiday_ind,
	T63, round(T63R,5) T63R, Round(t63C,5) T63C,
	TOTAL_BOX_COUNT, reg_BOX_PERCENTAGE, CBU_BOX_PERCENTAGE, CENT_BOX_PERCENTAGE, 	--box type weights when considering all three box types
	cbu_box_perc_of_cent, cent_box_perc_of_cent,   									--Box type weights when only considering the CBU + Cent boxes
	saturation_count,
	reg_bc_coverage_pct, reg_mv_coverage_pct,
	reg_final_coverage_pct,															--The rules for choosing between BC vs. MV regular have been heavily tested and this also accounts for Saturation. So just trusting it
	COV_EVAL_CBU_COVERAGE_PCT, COV_EVAL_CENT_COVERAGE_PCT,
	(case when cbu_box_perc_of_cent+cent_box_perc_of_cent = 0 then null 
		when COV_EVAL_CBU_COVERAGE_PCT is null and COV_EVAL_CENT_COVERAGE_PCT is null then null
		else round(((cbu_box_perc_of_cent * coalesce(COV_EVAL_CBU_COVERAGE_PCT,0))+(coalesce(COV_EVAL_CENT_COVERAGE_PCT,0) * cent_box_perc_of_cent)),5) 
		end) weighted_cent_calculated,										--Centralized coverage calculation before taking into account saturation. If saturated, this is not outputted anywhere
	(case when saturation_count > 0 and cbu_box_perc_of_cent is not null and cent_box_perc_of_cent is not null and (cbu_box_perc_of_cent+cent_box_perc_of_cent) > 0 then 1 
		when cbu_box_perc_of_cent+cent_box_perc_of_cent = 0 then null 
		when COV_EVAL_CBU_COVERAGE_PCT is null and COV_EVAL_CENT_COVERAGE_PCT is null then null
		else round(((cbu_box_perc_of_cent * coalesce(COV_EVAL_CBU_COVERAGE_PCT,0))+(coalesce(COV_EVAL_CENT_COVERAGE_PCT,0) * cent_box_perc_of_cent)),5) 
		end) final_cent_calculated,									--Weighted centralized coverage that takes into account saturation
	round(cent_final_coverage_pct,5) cent_final_coverage_pct,																														--Centralized coverage output by the system
	(case when reg_final_coverage_pct is null and COV_EVAL_CBU_COVERAGE_PCT is null and COV_EVAL_CENT_COVERAGE_PCT is null then null 
		else round(((coalesce(reg_BOX_PERCENTAGE,1) * coalesce(reg_final_coverage_pct,0))+coalesce((CBU_BOX_PERCENTAGE * coalesce(COV_EVAL_CBU_COVERAGE_PCT,0)),0)+coalesce((CENT_BOX_PERCENTAGE * coalesce(COV_EVAL_CENT_COVERAGE_PCT,0)),0)),5) 
		end) weighted_combined_calculated,	--Combined coverage without accounting for saturation
	(case when saturation_count > 0 and ((reg_BOX_PERCENTAGE is not null and cbu_box_perc_of_cent is not null and cent_box_perc_of_cent is not null) or reg_final_coverage_pct is not null) then 1 
		when reg_final_coverage_pct is null and COV_EVAL_CBU_COVERAGE_PCT is null and COV_EVAL_CENT_COVERAGE_PCT is null then null 
		else round(((coalesce(reg_BOX_PERCENTAGE,1) * coalesce(reg_final_coverage_pct,0))+coalesce((CBU_BOX_PERCENTAGE * coalesce(COV_EVAL_CBU_COVERAGE_PCT,0)),0)+coalesce((CENT_BOX_PERCENTAGE * coalesce(COV_EVAL_CENT_COVERAGE_PCT,0)),0)),5) 
		end) final_combined_calculated,	--Combined coverage with saturation. When saturated, Reg, cent, and final coverage should = 1 unless all inputs are null
	round(COV_EVAL_FINAL_DAILY_COVERAGE_PCT,5) COV_EVAL_FINAL_DAILY_COVERAGE_PCT,
	cov_eval_updt_date
	FROM (
		SELECT * from day_ref
		LEFT JOIN mail_volume_records mv
			ON mv.DELIVERY_DATE = day_id
		left join t_values tv
			ON TV_ZIP_CODE = mv.zip_code and mv.route_id = TV_ROUTE_ID
		left join byv
			on byv.zip_code = tv.tv_zip_code and byv.route_id = tv.Tv_route_id and byv.later_delivery_date = tv.vol_period_end
		LEFT JOIN iv_mail_table iv
			on MV.zip_code = iv.zip_code and mv.route_id = iv.route_id AND mv.DELIVERY_DATE = iv.DELIVERY_DATE
		LEFT JOIN rmss_updated rmss
			ON TV_ZIP_CODE||TV_ROUTE_ID = rmss.ams_zip||rmss.ams_number
		left join act_agg aa
			ON MV.zip_code = aa.zip_code and mv.route_id = aa.route_id AND mv.DELIVERY_DATE = aa.scan_event_date
		ORDER BY tv_zip_code, tv_route_id
	)
	where day_of_week > 1 and holiday_ind is null ---and (day_id not between '10-DEC-22' and '23-DEC-22')
	and tv_zip_code is not null and day_id is not null
	--reg_bc_coverage_pct = 1 and (cov_eval_cbu_coverage_pct > 0 or cov_eval_cent_coverage_pct >0 )
	--(reg_mv_coverage_pct > 1 or cbu_coverage_pct > 1 or cent_coverage_pct > 1)
	--cbu_box_perc_of_cent = 0 and  cent_box_perc_of_cent = 0
	--and cov_eval_updt_date > '01-SEP-23'
	ORDER BY day_id, TV_ZIP_CODE, TV_ROUTE_ID, COV_EVAL_DELIVERY_DATE asc
)
group by tv_zip_code, TV_ROUTE_ID order by tv_zip_code, TV_ROUTE_ID
;


select * from comp_route_fxtr_tval where zip_code||Route_id = '12094R001' order by last_updt_date desc;

select delivery_date, count(*) from eval_iv where delivery_date >= '09-Sep-22' and delivery_date <= '08-Sep-23' group by delivery_date;



select Finance_number||er.route_id FinanceRoute, er.zip_code||ams_route_id ZIPRoute, Finance_Number, er.Zip_Code, er.Route_ID, Ams_route_id, ROUTE_PERIOD_START, ROUTE_PERIOD_END, VOL_PERIOD_START, VOL_PERIOD_END,
ROUTE_EFFECTIVE_DATE, CREATION_DATE, PAY_PERIOD_YEAR, PAY_PERIOD_NUMBER, VF_PER_ADDRESS, ROUTE_CERTIFIED_DATE, SEQ001, SEQ002, SEQ003,
SEQ004, SEQ005, SEQ006, SEQ007, SEQ008, SEQ009, SEQ010, SEQ011, SEQ012, SEQ013, SEQ014, SEQ015, SEQ016, SEQ017A, SEQ017B1, SEQ017B2,
SEQ017C, SEQ018, SEQ019, SEQ020, SEQ021, SEQ022, SEQ023, SEQ024, SEQ025, SEQ026, SEQ027, SEQ029, SEQ030, SEQ031, SEQ032, SEQ033, SEQ034,
SEQ035, SEQ036A, SEQ036B, SEQ036C, SEQ037, SEQ038, SEQ039, SEQ040, SEQ041, SEQ042, SEQ043, SEQ044, SEQ045, SEQ046, SEQ047, SEQ048,
SEQ049, SEQ050, SEQ051, SEQ052, SEQ053, SEQ054, SEQ055, SEQ056, SEQ057, SEQ058, SEQ059, SEQ060, SEQ061, SEQ062, SEQ063, SEQ064,
SEQ065, SEQ072, SEQ082A, SEQ082B, SEQ082, SEQ083, SEQ084, SEQ085, SEQ086, SEQ087, SEQDE10,
T01, T02, T03, T04, T05, T06, T07, T08, T09, T10,
T11, T12, T13, T14, T15, T15A, T16, T16A, T17, T17A, T18, T19, T20, T21, T22, T23, T25, T26, T27, T28B, T28R, T29, T30, T31A, T31B,
T31C, T31_ADDTL_TIME, T31_S100, T31_S101, T31_S102, T31_S103, T31_S103A, T31_S104, T31_S105, T31_S106, T31_S107, T31_S107A, T31_S108,
T31_S109, T31_S110, T31_S111, T31_S111A, T31_S112, T31_S113, T31_S114, T31_S115, T31_S116, T31_S117, T31_S117A, T31_S118, T31_S119,
T31_S120, T31_S121, T31_S122, T31_S143, T32, T33, T34, T35, T36, T37, T38, T39, T40, T41, T42, T43, T49, T50, T51, T51_S134, T51_S135, T51_S136, T51_S137,
T51_S138, T51_S140, T52, T53, T54,
T55, T56, T57, T58, T59, T60, T61, T62, T63, T63R, T63C, T64, T65, MAPPED_INDICATOR, SEQ_OFFICE_TIME, SEQ_STREET_TIME, SEQ_TOTAL_TIME
from internal_rmss er
inner join (
    select zip_code, route_id, later_delivery_date, t63R, t63C from comp_vol_fxtr_tval
    where later_delivery_date = '08-Sep-23'
    and last_updt_date >= '17-Oct-23'
    
    ) byv
    on byv.zip_code = er.zip_code and byv.route_id = er.ams_route_id
where er.creation_date >= '17-Oct-23' 
and er.route_period_end = '09-Sep-23' 
and er.zip_code is not null
order by er.zip_code asc;


select * from internal_rmss where creation_date >= '17-Oct-23' and zip_code is not null;


select * from eval_eor order by last_updt_date desc;

SELECT ZIP_CODE, ROUTE_ID, ROUTE_PERIOD_END, t55, t56, t22, SEQ082A, SEQ082B, seq082, CREATION_DATE  FROM internal_Rmss WHERE seq082A > 0 AND CREATION_DATE = '29-sep-23' AND seq082B > 0;

select * from
(Select zip_code, route_id, t32 from internal_rmss where creation_date > '25-sep-23' and zip_code is not null) rnk1
left join
(select zip_code, route_id, t32 from internal_rmss where creation_date = '22-Sep-23' and zip_code is not null) rnk2
on
rnk1.zip_code = rnk2.zip_code and rnk1.route_id = rnk2.route_id;

select * from comp_route_fxtr_tval where last_updt_date > '27-Sep-23';

select * from date_ref where day_id > '10-Dec-22' and day_id < '31-Dec-22';

select delivery_date, count(*) from eval_iv where delivery_date >= '29-Sep-23' group by delivery_date;

select * from iv_mail_volume_coverage where last_updt_date > sysdate -1;

select * from tran_rmss;

select * from eval_iv;


