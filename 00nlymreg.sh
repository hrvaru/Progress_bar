g26='\033[42m'
g27='\033[40m'
g32='\033[0m'
if [ -d Merged ]; then
   rm -rf Merged
fi
clear
echo "\t#########################################################################################################################################\n"
echo "\t\t\t\t\t\t\tMerge the files into One file\n" 
echo "\t#########################################################################################################################################\n"
echo "\n\tInstruction to run the script: \n"
echo "\t1.Only the script and the files which we are going to merge should be in folder."
echo "\t2.After merging all files together, You will be asked to rename the output merged file. "
echo "\t3.New directory named 'Merged' is created in which your output file will be kept."
echo "\n"  
echo "\t#########################################################################################################################################\n"
count=`ls|tail -n+2|wc -l|tr -s ' '|cut -d ' ' -f2` 
echo "\n\tTotal no. of files to merge are : $count\n"
echo "\n"  
read -p "        Press Enter to Continue : " f 

c1=1
ls|tail -n+2|sort > ../tmp.csv 
   echo "\n\tPlease wait while your files being merged...\n"
   mkdir Merged
a=" "
a2=`expr $count \* 3`
a2=`expr $a2 - 4`
while read l
 do
echo "\n"  
    awk 'FNR==1{print ""}1' $l >> merged_out
    p=`echo "scale=2;($c1/$count)*100" | bc`
    p12=`echo "$p"|sed 's/.00//'|sed 's/.00/100/'`
    p1=`printf '%03i' $p12`
    c1=`expr $c1 + 1`
    a3=`echo "$a"|grep -o ' '|wc -l`
    diff=`expr $a2 - $a3`
    a4=`printf '%*s' $diff ' '`
    if [ $p1 -eq 100 ]; then
        clear
             echo "\t##############################################################################################################################\n"
             echo "\t\t\t\t\t\t\tMerge the files into One file\n" 
             echo "\t##############################################################################################################################\n"
             echo "\n"  
             echo "\tProgress Bar:"
             echo "\t${g26} $a> ${g32} $(printf '%*s' 1 ' ') $p1% Completed"
             sleep 2
             echo "\n\tFile $l has been merged. "
             sleep .5
             a=`echo "   $a"`
       
    
    else
        clear
             echo "\t##############################################################################################################################\n"
             echo "\t\t\t\t\t\t\tMerge the files into One file\n" 
             echo "\t##############################################################################################################################\n"
             echo "\n"  
             echo "\tProgress Bar:"
             echo "\t${g26} $a> ${g27} $a4 ${g32} $(printf '%*s' 1 ' ') $p1% Completed"
             sleep .05
             echo "\n\tFile $l has been merged. "
             sleep .5
             a=`echo "   $a"`
     fi
done < ../tmp.csv
clear
             echo "\t##############################################################################################################################\n"
             echo "\t\t\t\t\t\t\tMerge the files into One file\n" 
             echo "\t##############################################################################################################################\n"
echo "\n"  
read -p "        Please enter the merged file output name : " userin
mv merged_out Merged/$userin
rm -rf ../tmp.csv
echo "\n\tYour files are merged together in '$userin' successfully. \n"
echo "\n\tExiting bye ..."
echo "\n\n"















