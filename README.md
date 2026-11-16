# Riyadh Weather: Automated Daily Data Pipeline (Bash + Python + cron)

A small data-engineering exercise. A Bash script downloads daily weather for Riyadh from the free [Open-Meteo API](https://open-meteo.com/), Python merges the daily files into one JSON, and **cron** runs everything on a schedule.

To avoid waiting for real days to pass, the script starts 10 days in the past and moves the date forward by one day on each run.

## Pipeline

```
cron ──► run_completed.sh ──► curl/wget Open-Meteo ──► weather_data.json (per day)
                                    │
                                    └──► process_data_completed.py ──► combined_weather_data.json ──► "SUCCESS"
```

## Files

| File | Purpose |
|---|---|
| `run_completed.sh` | Finished pipeline script: variables, logging to `logs/`, download, error handling, safe exit |
| `process_data_completed.py` | Merges the daily JSON files (UTF-8 safe) |
| `run_exercise.sh`, `process_data.py` | The original exercise templates |
| `Riyadh_weather.md` | Full exercise brief |

## Run it

```bash
chmod +x run_completed.sh
./run_completed.sh
```

To schedule it, open `crontab -e` and add this line (it runs every minute for the simulation):

```
* * * * * /full/path/to/run_completed.sh
```

## License

[MIT](LICENSE)
