clear
while [ 1 ]
do
        echo "1.Create\n2.Display\n3.Insert\n4.Search\n5.Modify\n6.Delete\n7.Exit\n"
        echo "Enter choice=\c"
        read choice

        case $choice in

                1)
                        echo -n "Enter file name : "
                        read fname

                        if [ -e $fname ]
                        then
                                echo File exists already        
                        else
                                >> $fname
                        echo File Created Successfully
                        fi
                ;;
                2)
                        echo -n "Enter File Name : "
                        read fname

                        if [ -e $fname ]
                        then
                                echo "Contents of file are : \n"
                                sort -n $fname
                        else
                                echo "File Does not Exist"
                        fi
                ;;
                3)
                        echo -n "Enter File Name : "
                        read fname

                        if [ -e $fname ]
                        then
                                echo -n "Enter Roll Number : "
                                read roll
                                grep -w "$roll" $fname
                                ans=$?
                                echo answer=$ans
                                if [ $ans -eq 0 ]
                                then
                                        echo "Record Already Present"
                                else
                                        echo -n "Enter Name : "
                                        read name
                                        echo $roll $name >> $fname
                                        echo "Record INserted Successfully"
                                fi
                                else
                                        echo "File Not Exists"
                        fi
                ;;
                4)
                        echo -n "Enter file name : "
                        read fname
                        if [ -e $fname ]
                        then
                                echo -n "Enter Roll No : "
                                read roll
                                grep -w "$roll" $fname
                                ans=$?
                                if [ $ans -eq 0 ]
                                then
                                        echo "Record Found"
                                else
                                        echo "Record not found"
                                fi
                        else
                                echo "File not Exists"
                        fi
                ;;
                5)
                        echo -n "Enter file name : "
                        read fname
                        if [ -e $fname ]
                        then
                                echo -n "Enter Roll no : "
                                read roll
                                grep -w "$roll" $fname
                                ans=$?
                                if [ $ans -eq 0 ]
                                then
                                        echo -n "Enter new roll and new name : "
                                        read newRoll newName
                                        grep -w "$newRoll" $fname
                                        ans=$?
                                        if [ $ans -eq 0 ]
                                        then
                                                echo "Record already present try another roll no : "
                                        else
                                                grep -v "$roll" $fname >> temp
                                                echo "$newRoll $newName" >> temp
                                                rm $fname
                                                cp temp $fname
                                                rm temp
                                                echo "Record Modified Successfully"
                                fi
                        else
                                echo "Record not present"
                        fi
                else
                        echo "File not exists"
                        fi
                ;;
                6)
                        echo -n "Enter file name : "
                        read $fname
                        if [ -e $fname ]
                        then
                                echo -n "Enter roll no : "
                                read roll
                                grep -w "$roll" $fname
                                ans=$?
                                if [ $ans -eq 0 ]
                                then
                                        grep -v "$roll" $fname >> temp
                                        rm $fname
                                        cp temp $fname
                                        rm temp
                                        echo "Record Successfully Deleted"
                                else
                                        echo "Record doesnt exist"
                        fi
                        else
                                echo "File not exists"
                        fi
                ;;

                7)
                        exit
                ;;
                *)
                        echo "Invalid Choice"
                ;;
        esac

done
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   43,3-24       Bot
