#!/bin/bash
cd /home/pfaso/Projects/SDAMaterials/cron-mini

filenametime1=$(date +"%m%d%Y%H%M%S")

export BASE_FOLDER=$PWD
export OUTPUT_FOLDER=$BASE_FOLDER/output
export DATE_FILE=$BASE_FOLDER/last_date.txt
export LOGDIR=$BASE_FOLDER/logs
export LOG_FILE=${LOGDIR}/${SHELL_SCRIPT_NAME}_${filenametime1}.log
export LAT="22.76"
export LONG="46.21"

exec > >(tee ${LOG_FILE}) 2>&1

echo "Getting the next day's weather"


if [ -f $DATE_FILE ]; then
    LAST_DATE=$(cat $DATE_FILE)
else
    LAST_DATE=$(date -d "10 days ago" +"%Y-%m-%d")

fi

NEXT_DATE=$(date -I -d "$LAST_DATE + 1 day")


curl -s "https://archive-api.open-meteo.com/v1/era5?latitude=$LAT&longitude=$LONG&start_date=$NEXT_DATE&end_date=$NEXT_DATE&daily=temperature_2m_max,temperature_2m_min,temperature_2m_mean,precipitation_sum,wind_speed_10m_max,wind_direction_10m_dominant" > weather_data.json

echo $NEXT_DATE > $DATE_FILE

python3 process_data.py
RC1=$?
if [ ${RC1} != 0 ]; then
	echo "PYTHON SCRIPT FAILED"
	echo "[ERROR:] RETURN CODE:  ${RC1}"
	echo "[ERROR:] SEE LOGS FOR CAUSE OF ERROR."
	exit 1
fi

echo "PYTHON SCRIPT SUCCEEDED"

exit 0 