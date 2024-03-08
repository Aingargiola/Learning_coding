-- EVAL SCAN BURNIN --> WITH THRESHOLDS (ADDED BY ALEX SO NEEDS QC)

WITH date_ref_table AS (
SELECT DAY_ID 
FROM DATE_REF
WHERE EXCLUSION_FLAG IS NULL 
AND DAY_OF_WEEK > 1
AND DAY_ID BETWEEN '09-SEP-22' AND '08-SEP-23'
)
,
--burn AS (
-- SELECT *
-- from(
-- select zip_code AS burn_zip_code, route_id AS burn_route_id, effective_date, rank() over(PARTITION BY zip_code, route_id ORDER BY effective_date DESC) AS rnk 
-- from eval_scan_burnin 
-- WHERE effective_date between '09-SEP-22' AND '08-SEP-23')
-- WHERE rnk = 1 
--)

downstream AS (
SELECT ZIP_CODE AS zip_code_eval_ptr, ROUTE_ID AS route_id_eval_ptr, 
DELIVERY_DATE AS delivery_date_eval_ptr, 
UNSCANNABLE_PARCEL_DOOR, 
CASE 
WHEN UNSCANNABLE_PARCEL_DOOR< 0 THEN NULL
WHEN UNSCANNABLE_PARCEL_DOOR> 99999999 THEN NULL
ELSE UNSCANNABLE_PARCEL_DOOR
END AS UNSCANNABLE_PARCEL_DOOR_FINAL
,
UNSCANNABLE_PARCEL_BOX, 
CASE 
WHEN UNSCANNABLE_PARCEL_BOX < 0 THEN NULL
WHEN UNSCANNABLE_PARCEL_BOX > 99999999 THEN NULL
ELSE UNSCANNABLE_PARCEL_BOX
END AS UNSCANNABLE_PARCEL_BOX_FINAL
,
UNSCANNABLE_PARCEL_LOCKER, 
CASE 
WHEN UNSCANNABLE_PARCEL_LOCKER< 0 THEN NULL
WHEN UNSCANNABLE_PARCEL_LOCKER> 99999999 THEN NULL
ELSE UNSCANNABLE_PARCEL_LOCKER
END AS UNSCANNABLE_PARCEL_LOCKER_FINAL
,
CUSTOMS_DUE,
CASE 
WHEN CUSTOMS_DUE< 0 THEN NULL
WHEN CUSTOMS_DUE> 999999 THEN NULL
ELSE CUSTOMS_DUE
END AS CUSTOMS_DUE_FINAL
,
POSTAGE_DUE, 
CASE 
WHEN POSTAGE_DUE< 0 THEN NULL
WHEN POSTAGE_DUE> 999999 THEN NULL
ELSE POSTAGE_DUE
END AS POSTAGE_DUE_FINAL
,
CARRIER_PICKUP_EVENTS, 
CASE 
WHEN CARRIER_PICKUP_EVENTS < 0 THEN NULL
WHEN CARRIER_PICKUP_EVENTS > 999999 THEN NULL
ELSE CARRIER_PICKUP_EVENTS
END AS CARRIER_PICKUP_EVENTS_FINAL
,
CARRIER_PICKUP_ITEMS, 
CASE 
WHEN CARRIER_PICKUP_ITEMS < 0 THEN NULL
WHEN CARRIER_PICKUP_ITEMS > 999999 THEN NULL
ELSE CARRIER_PICKUP_ITEMS
END AS CARRIER_PICKUP_ITEMS_FINAL
,
LOAD_VEHICLE_DURATION,
CASE 
WHEN LOAD_VEHICLE_DURATION < 3 THEN NULL
WHEN LOAD_VEHICLE_DURATION > 45 THEN NULL
ELSE LOAD_VEHICLE_DURATION
END AS LOAD_VEHICLE_DURATION_FINAL
,
DEVIATION_COUNT, 
CASE 
WHEN DEVIATION_COUNT < 0 THEN NULL
WHEN DEVIATION_COUNT > 999999 THEN NULL
ELSE DEVIATION_COUNT
END AS DEVIATION_COUNT_FINAL
,
DEVIATION_DURATION,
CASE 
WHEN DEVIATION_DURATION > 60 THEN NULL
WHEN DEVIATION_DURATION < 0 THEN NULL
ELSE DEVIATION_DURATION
END AS DEVIATION_DURATION_FINAL
,
RURAL_REACH, 
CASE 
WHEN RURAL_REACH > 99 THEN NULL
WHEN RURAL_REACH < 0 THEN NULL
ELSE RURAL_REACH
END AS RURAL_REACH_FINAL
,
STAMP_STOCK, 
CASE 
WHEN STAMP_STOCK> 99 THEN NULL
WHEN STAMP_STOCK< 0 THEN NULL
ELSE STAMP_STOCK
END AS STAMP_STOCK_FINAL
,
OFFICE_TIME_PM_DURATION,
CASE 
WHEN OFFICE_TIME_PM_DURATION > 60 THEN NULL
WHEN OFFICE_TIME_PM_DURATION < 3 THEN NULL
ELSE OFFICE_TIME_PM_DURATION
END AS OFFICE_TIME_PM_DURATION_FINAL,
NUM_DOOR_DELIVERIES
, 
CASE
WHEN NUM_DOOR_DELIVERIES > 1500 THEN NULL
WHEN NUM_DOOR_DELIVERIES < 0 THEN NULL
ELSE NUM_DOOR_DELIVERIES 
END AS NUM_DOOR_DELIVERIES_FINAL
,
MISCELLANEOUS_DOOR_DELIVERIES
,
CASE
WHEN MISCELLANEOUS_DOOR_DELIVERIES> 99999999 THEN NULL
WHEN MISCELLANEOUS_DOOR_DELIVERIES< 0 THEN NULL
ELSE MISCELLANEOUS_DOOR_DELIVERIES
END AS MISCELLANEOUS_DOOR_DELIVERIES_FINAL

From (
Select *
FROM eval_ptr
WHERE DELIVERY_DATE between '09-SEP-22' AND '08-SEP-23'
))

-- Number of Deviations has a lower threshold of 0
-- Upper Threshold of 999,999

-- T37 Upper Threshold of 60
-- Lower Threshold of 0

-- T43 Upper Threshold is 60
-- Lower Threshold is 3

,
comp_vol AS (
SELECT zip_code AS zip_code_comp_vol, route_id AS route_id_comp_vol, T15A as t15a_value_comp_vol,
T16A as t16a_value_comp_vol, T17A AS t17a_value_comp_vol, T19 as t19_value_comp_vol,
T21 as t21_value_comp_vol,T22 as t22_value_comp_vol, T23 as t23_value_comp_vol, T26 as t26_value_comp_vol,
T36 AS t36_value_comp_vol, T37 AS t37_value_comp_vol, T41 AS t41_value_comp_vol, T42 AS t42_value_comp_vol,
T43 AS t43_value_comp_vol, T64 AS t64_value_comp_vol, T65 AS t65_value_comp_vol
FROM COMP_VOL_FXTR_TVAL cvft 
WHERE trunc(LAST_UPDT_DATE) >= '20-SEP-23'
and comp_vol_fxtr_tval_seq > '3476326'
AND zip_code IS NOT null
)
,
external_rmss_table AS (
SELECT zip_code AS zip_code_ext, ams_route_id AS route_id_ext, T15A as t15a_value_external_rmss,
T16A as t16a_value_external_rmss, T17A AS t17a_value_external_rmss, T19 as t19_value_external_rmss,
T21 as t21_value_external_rmss, T22 as t22_value_external_rmss, T23 as t23_value_external_rmss, ROUND(T26,1) as t26_value_external_rmss,
ROUND(T36,1) AS t36_value_external_rmss, ROUND(T37,1) AS t37_value_external_rmss, T41 AS t41_value_external_rmss, ROUND(T42,1) AS t42_value_external_rmss,
T43 AS t43_value_external_rmss, T64 AS t64_value_external_rmss, T65 AS t65_value_external_rmss
FROM internal_Rmss er 
where creation_date >= '20-SEP-23'
and zip_code is not null
)
,
eval_ptr_avg AS (
SELECT zip_code_eval_ptr || route_id_eval_ptr AS zip_route, zip_code_eval_ptr, route_id_eval_ptr,
round(avg(UNSCANNABLE_PARCEL_DOOR_FINAL),3) AS AVG_UNSCANNABLE_PARCEL_DOOR,
round(avg(UNSCANNABLE_PARCEL_BOX_FINAL),3) AS AVG_UNSCANNABLE_PARCEL_BOX,
round(avg(UNSCANNABLE_PARCEL_LOCKER_FINAL),3) AS AVG_UNSCANNABLE_PARCEL_LOCKER,
round(avg(CUSTOMS_DUE_FINAL),3) AS AVG_CUSTOMS_DUE,
round(avg(POSTAGE_DUE_FINAL),3) AS AVG_POSTAGE_DUE,
round(avg(CARRIER_PICKUP_EVENTS_FINAL),3) AS AVG_CARRIER_PICKUP_EVENTS,
round(avg(CARRIER_PICKUP_ITEMS_FINAL),3) AS AVG_CARRIER_PICKUP_ITEMS,
round(avg(LOAD_VEHICLE_DURATION_FINAL),1) AS AVG_LOAD_VEHICLE_DURATION,
round(avg(DEVIATION_COUNT_FINAL),1) AS AVG_DEVIATION_COUNT,
round(avg(DEVIATION_DURATION_FINAL),1) AS AVG_DEVIATION_DURATION,
round(avg(RURAL_REACH_FINAL),3) AS AVG_RURAL_REACH,
round(avg(STAMP_STOCK_FINAL),1) AS AVG_STAMP_STOCK,
round(avg(OFFICE_TIME_PM_DURATION_FINAL),3) AS AVG_OFFICE_TIME_PM_DURATION,
round(avg(NUM_DOOR_DELIVERIES_FINAL),3) AS AVG_NUM_DOOR_DELIVERIES,
round(avg(MISCELLANEOUS_DOOR_DELIVERIES_FINAL),3) AS AVG_MISCELLANEOUS_DOOR_DELIVERIES
FROM (
SELECT *
FROM downstream d
INNER JOIN date_ref_table dr
ON d.delivery_date_eval_ptr = dr.day_id
)
GROUP BY zip_code_eval_ptr || route_id_eval_ptr, zip_code_eval_ptr, route_id_eval_ptr
)
---byv AS (
---SELECT zip_code AS zip_code_byv, route_id AS route_id_byv,
----from_date AS from_date_byv, to_date AS to_date_byv
------FROM BYV_BLACKOUT bb
----)
-----------,
---------cross_walk AS (
--------SELECT to_zip_code AS zip_code_crosswalk, to_route_id AS route_id_crosswalk
-------FROM AMS_ROUTE_CROSSWALK_RANGE arcr



SELECT zip_code_eval_ptr || route_id_eval_ptr AS zip_route, zip_code_eval_ptr , route_id_eval_ptr,
AVG_UNSCANNABLE_PARCEL_DOOR, t15a_value_comp_vol, t15a_value_external_rmss,
t15a_value_external_rmss - AVG_UNSCANNABLE_PARCEL_DOOR AS T15A_DIFF,
CASE 
WHEN abs(AVG_UNSCANNABLE_PARCEL_DOOR- t15a_value_external_rmss) <= 0.005 
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_UNSCANNABLE_PARCEL_DOOR_EQUAL_CHECK,
AVG_UNSCANNABLE_PARCEL_BOX,t16a_value_comp_vol,t16a_value_external_rmss,
t16a_value_external_rmss - AVG_UNSCANNABLE_PARCEL_BOX AS T16A_DIFF,
CASE 
WHEN abs(AVG_UNSCANNABLE_PARCEL_BOX-t16a_value_external_rmss) <= 0.005 
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_UNSCANNABLE_PARCEL_BOX_EQUAL_CHECK,
AVG_UNSCANNABLE_PARCEL_LOCKER,t17a_value_comp_vol,t17a_value_external_rmss,
t17a_value_external_rmss - AVG_UNSCANNABLE_PARCEL_LOCKER AS T17A_DIFF,
CASE 
WHEN abs(AVG_UNSCANNABLE_PARCEL_LOCKER-t17a_value_external_rmss) <= 0.005 
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_UNSCANNABLE_PARCEL_LOCKER_EQUAL_CHECK,
AVG_CUSTOMS_DUE,t19_value_comp_vol,t19_value_external_rmss,
t19_value_external_rmss - AVG_CUSTOMS_DUE AS T19_DIFF, 
CASE
WHEN abs(AVG_CUSTOMS_DUE-t19_value_external_rmss) <= 0.005 
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_CUSTOMS_DUE_EQUAL_CHECK,
AVG_POSTAGE_DUE, t21_value_comp_vol, t21_value_external_rmss,
t21_value_external_rmss - AVG_POSTAGE_DUE AS T21_DIFF,
CASE 
WHEN abs(AVG_POSTAGE_DUE- t21_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_POSTAGE_DUE_EQUAL_CHECK,
AVG_CARRIER_PICKUP_EVENTS,t22_value_comp_vol,t22_value_external_rmss,
t22_value_external_rmss - AVG_CARRIER_PICKUP_EVENTS AS T22_DIFF,
CASE 
WHEN abs(AVG_CARRIER_PICKUP_EVENTS-t22_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_CARRIER_PICKUP_EVENTS_EQUAL_CHECK,
AVG_CARRIER_PICKUP_ITEMS,t23_value_comp_vol,t23_value_external_rmss,
t23_value_external_rmss - AVG_CARRIER_PICKUP_ITEMS AS T23_DIFF,
CASE 
WHEN abs(AVG_CARRIER_PICKUP_ITEMS-t23_value_external_rmss) <= 0.005 
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_CARRIER_PICKUP_ITEMS_EQUAL_CHECK,
AVG_LOAD_VEHICLE_DURATION,t26_value_comp_vol,t26_value_external_rmss,
t26_value_external_rmss - AVG_LOAD_VEHICLE_DURATION AS T26_DIFF,
CASE 
WHEN abs(AVG_LOAD_VEHICLE_DURATION-t26_value_external_rmss) <= 0.005 
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS Avg_LOAD_VEHICLE_DURATION_EQUAL_CHECK,
AVG_DEVIATION_COUNT,t36_value_comp_vol,t36_value_external_rmss,
t36_value_external_rmss - AVG_DEVIATION_COUNT AS T36_DIFF,
CASE 
WHEN abs(AVG_DEVIATION_COUNT-t36_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS AVG_DEVIATION_COUNT_EQUAL_CHECK,
AVG_DEVIATION_DURATION,t37_value_comp_vol,t37_value_external_rmss,
t37_value_external_rmss - AVG_DEVIATION_DURATION AS T37_DIFF,
CASE 
WHEN abs(AVG_DEVIATION_DURATION-t37_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS AVG_DEVIATION_DURATION_EQUAL_CHECK,
AVG_RURAL_REACH,t41_value_comp_vol,t41_value_external_rmss,
t41_value_external_rmss - AVG_RURAL_REACH AS T41_DIFF,
CASE 
WHEN abs(AVG_RURAL_REACH-t41_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS AVG_RURAL_REACH_EQUAL_CHECK,
AVG_STAMP_STOCK,t42_value_comp_vol,t42_value_external_rmss,
t42_value_external_rmss - AVG_STAMP_STOCK AS T42_DIFF,
CASE 
WHEN abs(AVG_STAMP_STOCK-t42_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS AVG_STAMP_STOCK_EQUAL_CHECK,
AVG_OFFICE_TIME_PM_DURATION,t43_value_comp_vol,t43_value_external_rmss,
t43_value_external_rmss - AVG_OFFICE_TIME_PM_DURATION AS T43_DIFF,
CASE 
WHEN abs(AVG_OFFICE_TIME_PM_DURATION-t43_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS AVG_OFFICE_TIME_PM_DURATION_EQUAL_CHECK,
AVG_NUM_DOOR_DELIVERIES,t64_value_comp_vol,t64_value_external_rmss,
t64_value_external_rmss - AVG_NUM_DOOR_DELIVERIES AS T64_DIFF,
CASE 
WHEN abs(AVG_NUM_DOOR_DELIVERIES-t64_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS AVG_NUM_DOOR_DELIVERIES_EQUAL_CHECK,
AVG_MISCELLANEOUS_DOOR_DELIVERIES,t65_value_comp_vol,t65_value_external_rmss,
t65_value_external_rmss - AVG_MISCELLANEOUS_DOOR_DELIVERIES AS T65_DIFF,
CASE 
WHEN abs(AVG_MISCELLANEOUS_DOOR_DELIVERIES-t65_value_external_rmss) <= 0.005
THEN 'Equal'
ELSE 'NOT EQUAL'
END AS AVG_MISCELLANEOUS_DOOR_DELIVERIES_EQUAL_CHECK
FROM (
SELECT *
FROM eval_ptr_avg ptr
INNER JOIN comp_vol comp
ON ptr.zip_code_eval_ptr = comp.zip_code_comp_vol and ptr.route_id_eval_ptr = comp.route_id_comp_vol
INNER JOIN external_rmss_table ext
ON ptr.zip_code_eval_ptr = ext.zip_code_ext and ptr.route_id_eval_ptr = ext.route_id_ext
--- LEFT JOIN byv
---ON ptr.zip_code_eval_ptr = byv.zip_code_byv and ptr.route_id_eval_ptr = byv.route_id_byv
---LEFT JOIN cross_walk cw
--- ON ptr.zip_code_eval_ptr = cw.zip_code_crosswalk and ptr.route_id_eval_ptr = cw.route_id_crosswalk
);



--RMSS Query

-- RMSS VALIDATION QUERY AVG COMPARISON FOR ALL T-VALUES
WITH 
downstream AS (
SELECT zip_code AS zip_code_eval_ident, alt_route_id AS route_id_eval_ident, withdraw_mail_ind, MAJ_DPS_LETTERS_CASED, VEHICLE_TYPE, OFFICE_WALK_DIST, LHD_GOV_VEHICLE
FROM EVAL_IDENTIFIERS
WHERE delivery_date = (SELECT max(DELIVERY_DATE) FROM EVAL_IDENTIFIERS WHERE DELIVERY_DATE <= '08-SEP-23')
)
,
comp_vol AS (
SELECT zip_code AS zip_code_comp_vol, route_id AS route_id_comp_vol, t01 AS t01_comp_vol, t02 AS t02_comp_vol, t03 AS t03_comp_vol, t04 AS t04_comp_vol, t05 AS t05_comp_vol,
t58 AS t058_comp_vol
FROM COMP_VOL_FXTR_TVAL cvft 
WHERE trunc(LAST_UPDT_DATE) >= '22-SEP-23'
AND zip_code != 'null'
and comp_vol_fxtr_tval_seq > '3476326'
)
,
external_rmss_table AS (
SELECT zip_code AS zip_code_ext, ams_route_id AS route_id_ext, t01 AS t01_external_rmss, t02 AS t02_external_rmss, t03 AS t03_external_rmss, t04 AS t04_external_rmss, 
t05 AS t05_external_rmss, t58 AS t058_external_rmss
FROM internal_RMSS er 
where creation_date >= '22-SEP-23'
and zip_code is not null
)

SELECT FINAL_TABLE.*,
CASE 
WHEN T04_EQUALS_CHECK = 'Equal' THEN 'T04 Validated'
WHEN T05_EQUALS_CHECK = 'Equal' THEN 'T05 Validated'
ELSE 'No'
END AS "T04 / T05 Validated?"
FROM (
SELECT zip_code_eval_ident || route_id_eval_ident AS zip_route, withdraw_mail_ind,
t01_comp_vol, t01_external_rmss,
CASE 
WHEN withdraw_mail_ind = 'true' AND t01_comp_vol = 1 AND t01_external_rmss = 1 THEN 'Equal'
WHEN withdraw_mail_ind = 'false' AND t01_comp_vol = 0 AND t01_external_rmss = 0 THEN 'Equal'
ELSE 'Not Equal'
END AS T01_EQUALS_CHECK,
MAJ_DPS_LETTERS_CASED, t02_comp_vol, t02_external_rmss,
CASE 
WHEN MAJ_DPS_LETTERS_CASED = 't' AND t02_comp_vol = 1 AND t02_external_rmss = 1 THEN 'Equal'
WHEN MAJ_DPS_LETTERS_CASED = 'f' AND t02_comp_vol = 0 AND t02_external_rmss = 0 THEN 'Equal'
ELSE 'Not Equal'
END AS T02_EQUALS_CHECK,
VEHICLE_TYPE ,t03_comp_vol, t03_external_rmss,
CASE 
WHEN VEHICLE_TYPE = 'G' AND t03_comp_vol = 1 AND t03_external_rmss = 1 THEN 'Equal'
WHEN VEHICLE_TYPE = 'E' AND t03_comp_vol = 0 AND t03_external_rmss = 0 THEN 'Equal'
ELSE 'Not Equal'
END AS T03_EQUALS_CHECK,
OFFICE_WALK_DIST AS OFFICE_WALK_DIST_T04 ,t04_comp_vol, t04_external_rmss,
CASE 
WHEN withdraw_mail_ind = 'true' AND t01_comp_vol = 1 AND t01_external_rmss = 1 AND OFFICE_WALK_DIST = t04_external_rmss THEN 'Equal'
ELSE 'Not Equal'
END AS T04_EQUALS_CHECK,
OFFICE_WALK_DIST AS OFFICE_WALK_DIST_T05, t05_comp_vol, t05_external_rmss,
CASE 
WHEN withdraw_mail_ind = 'false' AND t01_comp_vol = 0 AND t01_external_rmss = 0 AND OFFICE_WALK_DIST = t05_external_rmss THEN 'Equal'
ELSE 'Not Equal'
END AS T05_EQUALS_CHECK,
LHD_GOV_VEHICLE ,t058_comp_vol, t058_external_rmss,
CASE 
WHEN LHD_GOV_VEHICLE = 'true' AND t058_comp_vol = 1 AND t058_external_rmss = 1 THEN 'Equal'
WHEN LHD_GOV_VEHICLE = 'false' AND t058_comp_vol = 0 AND t058_external_rmss = 0 THEN 'Equal'
ELSE 'Not Equal'
END AS T58_EQUALS_CHECK
FROM (
SELECT *
FROM downstream down
INNER JOIN comp_vol comp
ON down.zip_code_eval_ident = comp.zip_code_comp_vol and down.route_id_eval_ident = comp.route_id_comp_vol
INNER JOIN EXTERNAL_RMSS_TABLE ext
ON down.zip_code_eval_ident = ext.zip_code_ext and down.route_id_eval_ident = ext.route_id_ext
)
)FINAL_TABLE;



-- Mini Mail Survey T-Values:
-- T25 = PARS Label and T59 = Misc Time
-- Mini Mail Survey T-Values:
-- T25 = PARS Label and T59 = Misc Time
WITH mini_mail AS (
SELECT AMS_ZIP, AMS_ROUTE, PARS_LABEL_CNT, MISC_TIME, case_safety_service_dist, DPSL_DISTO_RACK 
FROM MINI_MAIL_SURVEY mms 
WHERE trunc(EFFECTIVE_DATE) >= '15-JUL-23'
AND ams_zip IS NOT null
)
,
ext_table AS (
SELECT ZIP_CODE AS zip_code_ext, ams_route_id AS route_id_ext,
t25 AS t25_ext, t59 AS t59_ext, t60 as t60_ext, t62 as t62_ext
FROM internal_rmss er 
WHERE creation_date >= '20-SEP-23' --IN (SELECT max(creation_date) FROM EXTERNAL_RMSS)
AND zip_code IS NOT null
)
,
comp_vol AS (
SELECT zip_code_comp_vol, route_id_comp_vol, t25_comp_vol
FROM (
SELECT zip_code AS zip_code_comp_vol, route_id AS route_id_comp_vol,
t25 AS t25_comp_vol
, 
-- t59 AS t59_comp_vol, t60 AS t60_comp_vol, t62 AS t62_comp_vol,
rank() over(PARTITION BY zip_code, route_id ORDER BY COMP_VOL_FXTR_TVAL_SEQ desc) AS rnk
FROM COMP_VOL_FXTR_TVAL cvft
)
WHERE rnk = 1
)
,
comp_route AS (
SELECT zip_code_comp_route, route_id_comp_route, t59_comp_route, t60_comp_route, t62_comp_route
FROM (
SELECT zip_code AS zip_code_comp_route, route_id AS route_id_comp_route,
-- t25 AS t25_comp_vol, 
t59 AS t59_comp_route, t60 AS t60_comp_route, t62 AS t62_comp_route,
rank() over(PARTITION BY zip_code, route_id ORDER BY COMP_ROUTE_FXTR_TVAL_SEQ desc) AS rnk1
FROM COMP_ROUTE_FXTR_TVAL crft
)
WHERE rnk1 = 1
)
SELECT ams_zip AS zip_code, ams_route AS route_id,
pars_label_cnt, t25_comp_vol, t25_ext,
CASE
WHEN abs(pars_label_cnt - t25_ext) < 0.005
THEN 'Equal'
ELSE 'Not Equal'
END AS "Pars Label Count Equal Check"
,
misc_time, t59_comp_route, t59_ext,
CASE
WHEN abs(misc_time - t59_ext) <0.005
THEN 'Equal'
ELSE 'Not Equal'
END AS "Misc Time Equal Check"
,
case_safety_service_dist, t60_comp_route, t60_ext,
CASE
WHEN abs(case_safety_service_dist - t60_ext) <0.005
THEN 'Equal'
ELSE 'Not Equal'
END AS "One-way distance - case to safety service"
,
DPSL_DISTO_RACK, t62_comp_route, t62_ext,
CASE
WHEN abs(DPSL_DISTO_RACK - t62_ext) <0.005
THEN 'Equal'
ELSE 'Not Equal'
END AS "Round Trip Walk Distance - Case/DPSL Storage"
FROM (
SELECT *
FROM mini_mail mini
INNER JOIN ext_table ext
ON mini.ams_zip || mini.ams_route = ext.zip_code_ext || ext.route_id_ext
INNER JOIN comp_vol comp
ON mini.ams_zip || mini.ams_route = comp.zip_code_comp_vol || comp.route_id_comp_vol
INNER JOIN comp_route compr
ON mini.ams_zip || mini.ams_route = compr.zip_code_comp_route || compr.route_id_comp_route
);


--T6,T7,T9 query


with rm_eor as (
SELECT distinct AMS_ZIP, AMS_NUMBER, RECEIVED_DATE, eor.delivery_date, dps_letters, cased_letters, cased_flats
FROM RMSS_ROUTE_MASTER rrm
left join 
(select * from eval_eor
where delivery_date between '09-SEP-22' AND '08-SEP-23') eor
on rrm.ams_zip = eor.zip_code and rrm.ams_number = eor.route_id
WHERE RECEIVED_DATE IN (SELECT max(RECEIVED_DATE) FROM RMSS_ROUTE_MASTER rrm2 where received_date <= '09-SEP-23')
--and ams_zip||ams_number =:zip_route
and ams_zip||ams_number is not null
)
,
rm_iv as (
SELECT distinct AMS_ZIP, AMS_NUMBER, RECEIVED_DATE, iv.delivery_date, (PIECE_CNT_DPS1 + PIECE_CNT_DPS2) iv_dps_letters, iv.PIECE_CNT_CR_LTR_OPS, iv.PIECE_CNT_CR_FLT_OPS
FROM RMSS_ROUTE_MASTER rrm
left join 
(select * from iv_mail_volume
where delivery_date between '09-SEP-22' AND '08-SEP-23'
and (zip_code, route_id, delivery_date, iv_mail_volume_seq) in 
(select zip_code, route_id, delivery_date, max(iv_mail_volume_seq) from iv_mail_volume where delivery_date between '09-SEP-22' AND '08-SEP-23' group by zip_code, route_id, delivery_date)) iv
on rrm.ams_zip = iv.zip_code and rrm.ams_number = iv.route_id
WHERE RECEIVED_DATE IN (SELECT max(RECEIVED_DATE) FROM RMSS_ROUTE_MASTER rrm2 where received_date <= '09-SEP-23')
--and ams_zip||ams_number =:zip_route
and ams_zip||ams_number is not null
)
,
day_ref as(
select day_id, day_of_week, holiday_ind, exclusion_flag
from date_ref
where day_id between '09-SEP-22' AND '08-SEP-23'
)
,
rm as (
select ams_zip, ams_number, received_date 
from rmss_route_master
WHERE RECEIVED_DATE IN (SELECT max(RECEIVED_DATE) FROM RMSS_ROUTE_MASTER rrm2 where received_date <= '09-SEP-23')
--and ams_zip||ams_number =:zip_route
and ams_zip||ams_number is not null
)
,
t_values AS (
SELECT internal_RMSS_SEQ, FINANCE_NUMBER, ZIP_CODE AS TV_ZIP_CODE, ROUTE_ID AS TV_ROUTE_ID, AMS_ROUTE_ID, ROUTE_EFFECTIVE_DATE, vol_period_end, CREATION_DATE, t06, t07, t09
FROM internal_rmss er 
WHERE CREATION_DATE IN (SELECT max(CREATION_DATE) FROM internal_rmss er2 where vol_period_end <= '08-SEP-23' and creation_date >= '20-SEP-23')
and zip_code is not null
) 
SELECT ams_zip, ams_number, distinct_day_count, null_eor_days, t09, avg_eor_dps_let,
avg_rep_dps_let, avg_rep_dps_let - t09 AS t09_diff, 
CASE 
WHEN abs(t09-avg_rep_dps_let) > 0.001
THEN 'Not Equal'
ELSE 'Equal'
END AS T09_Equals_Check
,
dps_let_days_replaced,
t06, random_letters, avg_eor_cased_let, avg_rep_cased_let, avg_rep_cased_let - t06 AS t06_diff, 
CASE 
WHEN abs(t06-avg_rep_cased_let) > 0.001
THEN 'Not Equal'
ELSE 'Equal'
END AS T06_Equals_Check
,
cased_let_days_replaced,
t07, random_flats, avg_eor_cased_flat, avg_rep_cased_flats, avg_rep_cased_flats - t07 AS t07_diff, 
CASE 
WHEN abs(t07-avg_rep_cased_flats) > 0.001
THEN 'Not Equal'
ELSE 'Equal'
END AS T07_Equals_Check
,
cased_flats_days_replaced
FROM 
(
select ams_zip, ams_number, count(distinct day_id) AS distinct_day_count, sum(case when dps_letters is null then 1 else 0 end) null_eor_Days,
min(t09) t09,
round(avg(dps_letters),3) avg_eor_dps_let, round(avg(dps_letters_rep_value),3) avg_rep_dps_let, sum(dps_letters_rep_ind) dps_let_days_replaced,
min(t06) t06, min(random_letters) random_letters,
round((avg(cased_letters)+min(random_letters)),3) avg_eor_cased_let, round(avg(cased_letters_rep_value)+min(random_letters),3) avg_rep_cased_let, sum(cased_letters_rep_ind) cased_let_days_replaced,
min(t07) t07, min(random_flats_addn) random_flats,
round(avg(cased_flats)+min(random_flats_addn),3) avg_eor_cased_flat, round(avg(cased_flats_rep_value)+min(random_flats_addn),3) avg_rep_cased_flats, sum(cased_flats_rep_ind) cased_flats_days_replaced
from ( 
select day_ref.*,
rm.ams_zip, rm.ams_number,
iv_dps_letters, dps_letters, (case when ((dps_letters is null or dps_letters = 0) and iv_dps_letters >= 0) then 1 else 0 end) dps_letters_rep_ind,
(case when ((dps_letters is null or dps_letters = 0) and iv_dps_letters >= 0) then iv_dps_letters else dps_letters end) dps_letters_rep_value,
PIECE_CNT_CR_LTR_OPS, cased_letters, (case when ((cased_letters is null or cased_letters = 0) and PIECE_CNT_CR_LTR_OPS >= 0) then 1 else 0 end) cased_letters_rep_ind,
(case when ((cased_letters is null or cased_letters = 0) and PIECE_CNT_CR_LTR_OPS >= 0) then PIECE_CNT_CR_LTR_OPS else cased_letters end) cased_letters_rep_value,
PIECE_CNT_CR_FLT_OPS, cased_flats, (case when ((cased_flats is null or cased_flats = 0) and PIECE_CNT_CR_FLT_OPS >= 0) then 1 else 0 end) cased_flats_rep_ind,
(case when ((cased_flats is null or cased_flats = 0) and PIECE_CNT_CR_FLT_OPS >= 0) then PIECE_CNT_CR_FLT_OPS else cased_flats end) cased_flats_rep_value
from rm
cross join day_ref
left join rm_eor
on rm_eor.delivery_date = day_id and rm_eor.ams_zip = rm.ams_zip and rm_eor.ams_number = rm.ams_number
left join rm_iv
on rm_iv.delivery_date = day_id and rm_iv.ams_zip = rm.ams_zip and rm_iv.ams_number = rm.ams_number
where /*(
((dps_letters is null or dps_letters = 0) and iv_dps_letters > 0)
or
((cased_letters is null or cased_letters = 0) and PIECE_CNT_CR_LTR_OPS > 0)
or
((cased_flats is null or cased_flats = 0) and PIECE_CNT_CR_FLT_OPS > 0)
) */
day_of_week > 1 and holiday_ind is null --and (day_id not between '10-DEC-22' and '23-DEC-22')
order by rm.ams_zip, rm.ams_number, day_id
)
left join t_values
on ams_zip = t_values.tv_zip_code and ams_number = t_values.ams_route_id
left join (select ams_zip as mms_zip, ams_route, effective_date, random_letters, random_flats_addn from mini_mail_survey 
where (ams_zip, ams_route, effective_date) in (select ams_zip, ams_route, max(effective_date) from mini_mail_survey where effective_date = '15-JUL-23' group by ams_zip, ams_route)
) mms
on ams_zip = mms.mms_zip and ams_number = mms.ams_route
group by ams_zip, ams_number
order by ams_zip, ams_number
)
;
