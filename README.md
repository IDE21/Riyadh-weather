# Linux-project

**Simulated Business Scenario**

As part of a simulated business scenario, the task involved obtaining daily weather updates for Riyadh. Instead of waiting every day for skill development, the approach was to obtain data for the past 10 days and simulate a daily call using cron.

**Requirements to Accomplish the Task:**

1. Download the data for the day using a shell command.
2. Concatenate the data into one file using a Python script.
3. Save the output file in the Python script.
4. Print out "SUCCESS" using a shell command.
5. Create a GitHub repository and upload the files using Git.

**Deliverables:**

- process_data.py: Python script to concatenate data.
- run_exercise.sh: Shell script controlling operations.
- combined_weather_data.json: Output file with concatenated downloads.

**Program Procedure:**

1. Download data with a shell command.
2. Concatenate data into one file with the Python script.
3. Save the output file in the Python script.
4. Print out "SUCCESS" with a shell command.
5. Create a repository on GitHub and upload files with Git.

**Specification Detail:**

1. **How to download data?**
    - Use either wget or curl command line tools to call the API.
    - Check if the tools are installed using wget --version or curl --version.
    - Install the tools if not present (e.g., using apt on Ubuntu).
    - Replace Riyadh Latitude and Longitude with variables in the script.
    - Output returned data to a file called "weather_data.json".

2. **How to compose the shell script?**
    - Must run in bash or zsh shell.
    - Define various directories.
    - Define environment variables.
    - Generate logs in a created "logs" folder.
    - Print errors to both standard input and the log file.
    - Have a mechanism to exit the program safely.

3. **How to concatenate data into one file with Python?**
    - Use the provided process_data_completed.py or try the challenge with process_data.py.
    - Create a virtual environment.
    - Choose to use Pandas or JSON from the standard library.
    - Be cautious about UTF-8 encoding.
    - When opening a file in the Python script, use encoding='utf-8'.
    - When saving or dumping the final JSON output file, use force_ascii=False.

4. **Run the script using the cron program:**
    - Open crontab with crontab -e.
    - Enter the cronjob command at the bottom of the script.
    - Use '* * * * *' to run the command every minute.
    - The command is the type of command to run (think about the name of the terminal).
    - Save and close crontab.
    - After completing 10 successful runs, shut down the cron job.

**Task Summary:**

In this simulated scenario, we successfully obtained daily weather updates for Riyadh over the past 10 days, simulating a daily call using cron. The data was downloaded, concatenated, and stored in a structured manner. The project was version-controlled on GitHub for future reference. The script and processes were designed to handle errors gracefully and ensure safe program termination.
