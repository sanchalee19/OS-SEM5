clear
while [ 1 ]
do
        echo 1.Create 2.Display 3.Insert 4.Search 5.Modify 6. Delete 7.Exit
        echo Enter choice=\c
        read choice
        case $choice in
                1)
                        echo Enter file name :
                        read fname
                        if [ -e $fname ]
                        then
                                echo File already exists
                        else
                                >> $fname
                                echo File created successfully
                        fi
                        ;;
                2)
                        echo Enter file name : 
                        read fname
                        if [ -e $fname ]
                        then
                                echo The content of the file:
                                sort -n $fname
                        else
                                echo File does not exist
                        fi
                        ;;
                3)
                        echo Enter the file name 
                        read fname
                        if [ -e $fname ]
                        then
                                echo Enter the roll no:
                                read roll
                                grep -w "roll" $fname
                                ans=$?
                                echo answer=$ans
                                if [ $ans -eq 0 ]
                                then
                                        echo Record already present
                                else
                                        echo -n Enter name:
                                        read name
                                        echo $roll $name >> $fname
                                        echo Record inserted successfully
                                fi
                        else
                                echo File does not exists
                        fi
                        ;;
                4) echo -n "enter file name:"
                        read fname
                        if [ -e $fname ]
                        then
                                echo -n "enter roll no:"
                                read roll
                                grep -w "$roll" $fname
                                ans=$?
                                if [ $ans -eq 0 ]
                                then
                                        echo "record found"
                                else
                                        echo "record not found"
                                fi
                        else
                                echo"file not exists"
                        fi
                        ;;
                5)
                        echo -n "enter file name:"
                        read fname
                        if [ -e $fname ]
                        then
                                echo -n "enter roll no:"
                                read roll
                                grep -w "$roll" $fname
                                ans=$?
                                if [ $ans -eq 0 ]
                                then
                                        echo -n "Enter new roll and new name:"
                                        read newRoll newName
                                        grep -w "$newRoll" $fname
                                        ans=$?
                                        if [ $ans -eq 0 ]
                                        then
                                                echo "record already present try another roll no"
                                        else
                                                grep -v "$roll" $fname >> temp
                                               echo "$newRoll $newName" >> temp
                                       rm $fname
                        cp temp $fname
         rm temp
echo "Record modified successfully"
                                        fi
                                else
                                        echo "record not present"
                                fi
                        else
                                echo "file not exists"
                        fi
                        ;;

6) echo -n "enter file name:"
read $fname
if [ -e $fname ]
then
        echo -n "enter roll no"
read roll
grep -w "$roll" $fname
ans=$?
if [ $ans -eq 0 ]
then
        grep -v "$roll" $fname >> temp
        rm $fname
        cp temp $fname
        rm temp
        echo "record successfully deleted"
else
        echo "record dosent exist"
fi
else
        echo "file not exists"
fi
;;
7)exit
        ;;



                *) echo Choice incorrect 
                        ;;
        esac
done
