#. ~/.bash_profile
#. ~/.bashrc
# ==============================================================================================================
# Script. . . . . . : cleanup_sql_dir.sh
# Author. . . . . . : Robert H. Reddert / Clear Measures
# Date. . . . . . . : 13May2014
# Purpose . . . . . : Clean up log files from the SQL Jobs
# Parameters. . . . : environment - prd, qas, or dev
# Returns . . . . . : Exits with 0 if successful
# . . . . . . . . . : Exits with 1 for any error
# Example . . . . . : ./cleanup_sql_dir dev 90
# ==============================================================================================================
sql_base_dir_prd=/cvg-cdwnz-prd/prd/ext_interfaces/SQL_Jobs
sql_base_dir_qas=/cvg-cdwnz-wrk/qas/ext_interfaces/SQL_Jobs
sql_base_dir_dev=/cvg-cdwnz-wrk/dev/ext_interfaces/SQL_Jobs
#
# validate the first parameter
if [ -z "$1" ]; 	then 
	echo "The first parameter is required. Must be prd, qas, or dev." 
	exit 1
else
	case "$1" in 
		"prd")
			sql_base_dir=${sql_base_dir_prd}
			;;
		"qas")
			sql_base_dir=${sql_base_dir_qas}
			;;
		"dev")
			sql_base_dir=${sql_base_dir_dev}
			;;
		*)
			echo "The first parameter must be prd, qas, or dev." 
			exit 1
			;;
	esac
	sql_env="$1"
fi
#
# Validate the second parameter
if [ -z "$2" ]; 	then 
	echo "The second parameter is required. Must the number of days to retain log files." 
	exit 1
else
	days_to_retain="$2"
fi
# =================
#  Main Processing 
# =================
#
# Delete the files older than $2
find ${sql_base_dir} -maxdepth 1 -name '*.log' -mtime +${days_to_retain} -type f -delete
exit 0