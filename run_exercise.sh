#!/bin/bash
# This script is a starting point for you to complete.
# Notes will be provided to explain existing code.
# Some of the code will be incomplete and your goal is to complete it so that it is a fully working script.

# You should use the API documentation found at https://open-meteo.com/ to help you if necessary.
# Additional instructions are also provided in the Riyadh_weather.md file with this project.
# There are 10 exercises for you to complete in this script.  Use the internet and 'man' command to complete the exercises.
# Try not to just get your answers from chatgpt.  You will learn best by searching on your own, and struggling, a little bit.


##############################################
# 1. In this section you set your variables


# 2. Set logging rules. Hint: Send logs to both stdout and to files in the logs folder


# 3. Let the user know that the weather download is going to begin.


##############################################
# This code is specifically used to simulate running a daily call to the API.
# Because we dont want to wait 1 day for an updated call using CRON, this code instead 
# writes the date 10 days ago, which we will pretend is today, and writes that date to a 
# file. Each time the cron job runs this script, it will check the date file, increment the date by one day,
# and then download the data for the next day.

# DO NOT CHANGE THIS CODE.
if [ -f $DATE_FILE ]; then
    LAST_DATE=$(cat $DATE_FILE)
else
    LAST_DATE=$(date -d "10 days ago" +"%Y-%m-%d")
fi

NEXT_DATE=$(date -I -d "$LAST_DATE + 1 day")

# 4. Set the variable 'DATE_FILE' to a text file called last_date.txt.  Do this above in the variables section

# 5. The next line is an incomplete call to the API.  There are two possible commands that you can use to make the request.

"https://archive-api.open-meteo.com/v1/era5?latitude=<Riyadh Latitude>&longitude=<Riyadh Longitude>&start_date=$NEXT_DATE&end_date=$NEXT_DATE&daily=temperature_2m_max,temperature_2m_min,temperature_2m_mean,precipitation_sum,wind_speed_10m_max,wind_direction_10m_dominant"


# 5a. Select one of two commands to download the data.  See the Riyadh_weather.md for further information if you need.
# 5b. If possible, use the silent flag so that there is not too much logging in the terminal (stdout)
# 5c. Create variables for 'Riyadh Latitude' and `Riyadh Longitude` in the variables section above.  The latitude is 22.76 and the longitude is 46.21
# 5d. Use the variables you just created and enter them in the proper location of the command above.
# 5e. Output the returned JSON to a file called weather_data.json. This file will be read by the python script.

# DO NOT CHANGE THIS CODE.
echo $NEXT_DATE > $DATE_FILE

################################################

# 6. Call the python script, process_data.py.


# 7. Below, create a variable to represent the return code of the last command executed.  In this case the python script.
# set this variable equal to the exit status. 
# Hint: There is a special variable in shell scripting which holds the numerical value of the exit status.  Use this special variable.
# HINT: You should use the internet to search for information about return codes in shell scripting.

# 8. Write a conditional statement (ex. if-else) to check the value of the return code variable you just created.
# If it fails, notify the user in stdout that the python script failed and print the return code with the error message.
# If it succeeds let the user know in stdout that the code succeeded.

# 9. Write the statement below letting the system know that the shell script has executed successfully and can end the script.

# 10. In order for Cron to recognize the path of your script, you need to either set the path in the cron variables or, an easier way is to
# cd into the current working directory of this script.
# 10a. Just under the shebang (#!/bin/bash) write a line that changes the directory into the directory where this script is.