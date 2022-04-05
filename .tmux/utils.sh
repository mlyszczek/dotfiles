#!/bin/sh

notify_phone()
{
	sendxmpp -t -n lm-notif@kurwinet.pl
}


value_changed()
{
	db=${HOME}/.cache/notif-cache

	key=$1
	val=$2

	cur_val=$(cat ${db}/${key} 2>/dev/null)

	if [ "${val}" = "${cur_val}" ]; then
		# no change, return false
		return 1
	fi

	# value changed, return true and update value
	echo "${val}" > ${db}/${key}
	return 0
}

value_increased()
{
	db=${HOME}/.cache/notif-cache

	key=$1
	val=$2

	cur_val=$(cat ${db}/${key} 2>/dev/null)
	# update value
	echo "${val}" > ${db}/${key}

	if [ $val -le $cur_val ]; then
		# no change, or no increase in value return false
		return 1
	fi

	# value changed, return true
	return 0
}

has_time_passed()
{
	index=$1
	time=$2

	last_run_file=/tmp/$index
	last_run=$(cat $last_run_file)
	now=$(date +%s)

	diff=$((now - last_run))
	if test $diff -lt $time >/dev/null 2>/dev/null; then
		# time has not yet passed, return error
		return 1
	fi

	# time passed, save last run time and return ok
	echo $now > $last_run_file
	return 0
}
