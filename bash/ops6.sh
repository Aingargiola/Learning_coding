# loop=y

# while [ $loop = y ]
#     do
#         echo Enter file to check:
#         read file
#             if cat $file
#             then
#                 echo File exists.
#             else
#                 touch $file
#                 echo File did not exist, so I made one
#             fi

#         echo Do you want to check another? Type "y" for yes, any other to quit.
#         read loop
#     done



x=1
while [ $x = 1 ]
do
    echo "Welcome"
    (( x++ ))
done


c=1
until [ $c -gt 5 ]
do
	echo "Welcome $c times"
	(( c++ ))
done


for i in {1..5}
do
   echo "Welcome $i home"
done