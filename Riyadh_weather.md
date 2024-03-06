<div  align='left'><img src='https://s3.amazonaws.com/weclouddata/images/logos/wcd_logo_new_2.png' width='15%'></div >

<p style="font-size:30px;text-align:left"><b>Mini Project--Riyadh Climate Data</b></p>
<p style="font-size:20px;text-align:left"><b><font color='#F39A54'>Data Engineering Diploma</font></b></p>
<p style="font-size:15px;text-align:left">Content developed by: WeCloudData Academy</p>

<br>

# 1. Simulated Business Scenario 

You've been asked to obtain daily weather updates for Riyadh. 

Typically, you would write a script to access the weather api, and then schedule a daily call to the api to obtain the data you need.

In our case, since we dont want to wait every day for you to learn the skills for this project, we will instead obtain the past 10 days.  
Then every minute, we will us cron to run our script, getting the next day.

This will represent making the call every day via cron.

# 2. Requirements to accomplish task

- First you will download the data for the day, which will be returned to you in a json format.  This should be saved in a file called **weather_data.json**.
- You will then use the provided **process_data.py** file to get each day's json, concatenate it, and output it to a file, called **combined_weather_data.json**. This is the output of the lab. 

## Download necessary files here

# 3. Deliverables

You need to submit **process_data.py**, **run_exercise.sh** and **combined_weather_data.json** to the github repository you created for the lab. 
- **run_exercise.sh**: You will use the shell script to control every operation, including data downloading, log setting,  python script running. 
- **process_data.py**: While the Python script is used to concatenate all the data into one file. 
- **combined_weather_data.json**: This is the output file you concatenate all the downloads.

# 4. Program Procedure
1. **download data** with shell command
2. **concatenate data** to one file with the python script
3. **save output file** in the python script
4. print out **SUCCESS** with shell command.
5. create a repository in github, and upload your file to the repo with **git**.

The Shell script will call the Python Script to finish the Python work. 


# 5. Specification Detail
We have provided you with quite a bit of guidance on the shell script. The **run_exercise.sh** script includes some code which we pre-wrote since it is specifically
meant to simulate daily api calls.  Along with this code we have provided 9 exercises right in the script to guide you on what to write to make it complete.
1. You will first need to create environment variables in your shell script.
2. Be sure to include logging in a logs folder that you must create
3. Complete the api call.  Most of it is provided, but we would like you to complete it so that it works according to the instructions.
4. Write the python script to concatenate the json files
5. Output the final file to the appropriate directory.
6. Run a cron job so that the script is run every minute as a simulation.

# 6. Technical Instruction
**1. How to download data?**

You can use one of two command line tools to call the api to download the json data.
* wget
* curl

They might not be installed on your system so you should first check.  You can do this by using:
**wget --version** or **curl --version**

If you get a *command not found* error, that means its not installed and you need to install it.

If you are running Ubuntu, which most or all of you are, you can use the apt package manager to install either.

Use the *man* page for the tool you choose to learn more about its use and some of its flags, which we ask you to use in the script.

Note, for the purpose of this script, both of these tools operate almost identically so either one is fine.

Here is an example of the api you need to call.  
* You need to choose one of the two tools, and use it, along with some flags that are mentioned in the exercise.  
* You also need to replace *Riyadh Latitude* and *Riyadh Longitude* with variables defined in the script.
* Last, you need to output the returned data to a file called **weather_data.json**
```
"https://archive-api.open-meteo.com/v1/era5?latitude=<Riyadh Latitude>&longitude=<Riyadh Longitude>&start_date=$NEXT_DATE&end_date=$NEXT_DATE&daily=temperature_2m_max,temperature_2m_min,temperature_2m_mean,precipitation_sum,wind_speed_10m_max,wind_direction_10m_dominant"

```


**2. How to compose the shell script?**
The shell needs to include the following specifications:
1. Must be run in bash or zsh shell (not sh, not dash)
2. Must define the various directories. 
3. Must define environment variables
3. Must generate logs.
4. Can print error when there is a programming error. The errors should go to both standin and to the log file.
5. Must have a mechanism to exit the program safely. 

In the **run_exercise.sh**, you will find detailed guidance in the form of exercises in order to complete the script.

In case you cannot run the script, look at the error and try to figure out what is causing it.  *Hint:* we left something on the script that will cause you an error, but it shouldn't be too hard for you to fix.

**3. How to concatenate data into one file with python?**

**NOTE** A completed python script will be provided called **process_data_completed.py**.  If you wish to challenge yourself, we also included a file called **process_data.py**, which included notes for guidance, but leaves the actual coding for you to try if you wish.
If you do choose to try this on your own, follow some of the guidance below.

1. First make sure to create a virtual environment.
2. You can choose to use or not use Pandas.  If you don't then use JSON, which is part of the standard library.
3. Be careful about UTF-8 encoding.  Some of the data in the returned json includes special characters such as "°C", then you need to let the program know you want to do so.

In JSON, special characters are often encoded using Unicode escape sequences. The "°" symbol is represented as "\u00b0" in Unicode. When you read and write JSON data, these escape sequences are automatically used to ensure that the data is correctly encoded and can be read universally.

If you wish to see the characters displayed normally (e.g., "°C" instead of "\u00b0C") when viewing the JSON data, you need to specify an encoding that supports these characters (like UTF-8) and ensure that the software you're using to view the file can interpret these characters correctly.

In the python script, when you are opening a file, be sure to use *encoding='uft-8*.
Then when saving or dumping the final json output file, be sure to use *force_ascii=False*

**3. Run the script using the cron program**
See the *cron_scheduling.md* that you have from here.
Here is a quick tutorial:
1. Open the crontab by typing **crontab -e**
2. Press a number to select which text editor you want to use.
3. At the bottom of the script, enter your cronjob command.  The command for this exercise is    '__* * * * * command /path/to/file/to/run__'
4. The __* * * * *__ means run the command every minute.
5. The command is the type of command you want to run. In this case, what kind of command are we going to run?  Think about the name of the terminal.
6. Save and close the crontab.  You should see immediate results.
7. After you have completed 10 successful runs of the cron job, shut it down.  Otherwise it will keep going forever. On Ubuntu you can start, restart, stop, and check the status of your running cron jobs with the following:

**sudo service cron start/stop/restart/status*** 

Just select which one you want to do, not all of them as written above in the example of course.

In summary, 

# 7. HELP
Please use tools such as *man*, *tldr* and the internet to work on finishing the project.  Use chatgpt only for explanations and help.  
**Do not** use chatgpt to write the code for you.  Chatgpt is a wonderful tool, but going through the struggle on your own at first will help you learn better.

In case you really cant figure out the project, you can obtain the completed project from here for your review.
