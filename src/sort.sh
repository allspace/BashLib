#MergeSort algrithm
#@Param arr 
#			global array, the elements to be sorted
#@return the elements in "arr" are sorted in place
merge_sort()
{
    declare -a tmp;
	local start=$1;
	local end=$2;
	
	if((end-start<=0)); then
	    return;
	fi
	
	local start1=$start;
	local end1=$((start + (end-start)/2));
	local start2=$((end1+1));
	local end2=$end;
	merge_sort $start1 $end1
	merge_sort $start2 $end2
	
	local k=$start1;
	local i=0;
	while ((start1<=end1 && start2<=end2))
	do
	    if((arr[$start1] < arr[$start2])); then
			tmp[$i]=${arr[$start1]};
			((start1++));
		else
			tmp[$i]=${arr[$start2]};
			((start2++));
		fi
		((i++));
	done;
	
	while ((start1 <= end1))
	do
	    tmp[$i]=${arr[$start1]};
		((i++));
		((start1++));
	done;
	
	while ((start2 <= end2))
	do
	    tmp[$i]=${arr[$start2]};
		((i++));
		((start2++));
	done;
	
	i=0;
	while((k<=end2))
	do
	    arr[$k]=${tmp[$i]};
		((k++));
		((i++));
	done;
}

#QuickSort algrithm
#@Param arr 
#			global array, the elements to be sorted
#@return the elements in "arr" are sorted in place
quick_sort()
{
    local start=$1;
	local end=$2;
	local si=$start;
	local ei=$end;
	
	local k=${arr[$si]};

	((si>=ei)) && {  return; }
	
	((si++));
	while ((si<ei))
	do
		while((arr[$ei] > k && si<ei))
		do
			((ei--));
		done;
		while((arr[$si] <=k && si<ei))
		do
			((si++));
		done;
		if((si<ei)); then
		    tmp=${arr[$ei]};
			arr[$ei]=${arr[si]};
			arr[$si]=$tmp;
		fi
	done;
	#echo $si $ei;
	if((arr[$si] < k)); then
	    arr[$start]=${arr[$si]};
		arr[$si]=$k;
	fi

	#echo ${arr[@]};
	quick_sort $start $((si-1));
	quick_sort $((si+1)) $end;
	
}
