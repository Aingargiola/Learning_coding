loop=y

while [ $loop = y ]
    do
        echo Enter file to check:
        read file
            if cat $file
            then
                echo File exists.
            else
                touch $file
                echo File did not exist, so I made one
            fi

        echo Do you want to check another? Type "y" for yes, any other to quit.
        read loop
    done