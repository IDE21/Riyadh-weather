#!/usr/bin python3

# Note that the instructions below are only for guidance.
# If you think of another method then please feel free to do however works for you.

# import packages
import json
import os

# File and directory paths
json_file = 'weather.json'
output_dir = 'output'
output_file = 'combined_weather_data.json'

# Create the output directory if it doesn't exist
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Load new data
with open(json_file, 'r', encoding='utf-8') as file:
    new_data = json.load(file)

# Output path for the combined data
output_path = os.path.join(output_dir, output_file)

# Check if the output file already exists
if os.path.exists(output_path):
    # Load existing data into a list
    with open(output_path, 'r', encoding='utf-8') as file:
        try:
            existing_data = json.load(file)
        except json.JSONDecodeError:
            existing_data = []
else:
    existing_data = []

# Append new data to the existing data list
existing_data.append(new_data)

# Save the updated data to a JSON file
with open(output_path, 'w', encoding='utf-8') as file:
    json.dump(existing_data, file, indent=4, ensure_ascii=False)

