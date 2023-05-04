loop=y

while [ $loop = y ]
    do
        echo Enter file to check:
        read file
            if cat $file
            then
                echo "File exists."
            else
                touch $file
                echo "File did not exist, so I made one"
            fi

        echo "Do you want to check another? Type "y" for yes, any other to quit."
        read loop
    done



x=y
while [ $x = y ]
do
    echo "Welcome to class today we are learning about loops"
    echo "Are you ready to learn more enter y or n"
    read x 
done


c=1
until [ $c -gt 5 ]
do
	echo "Welcome $c times"
	(( c++ ))
done


for i in {0..25..5}
do
   echo "Welcome $i home"
done