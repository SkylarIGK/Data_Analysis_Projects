-- These are my sql queries that I have used in data combination, data exploration and cleaning processes. At the end, I mentioned the changes that I made in excel. 

-- Dailyactivity- I deleted TrackerDistance, LoggedActivitiesDistance, VeryActiveDistance, ModeratelyActiveDistance, LightActiveDistance, SedentaryActiveDistance columns. 

-- creating new table without the columns that I mention above
CREATE TABLE bellabeat-casestudy2-441602.bellabeat.activity AS
SELECT
    Id,
    ActivityDate,
    TotalSteps,
    TotalDistance,
    VeryActiveMinutes,
    FairlyActiveMinutes,
    LightlyActiveMinutes,
    SedentaryMinutes,
    Calories
FROM
    bellabeat-casestudy2-441602.bellabeat.Activity;

-- Check how many distinct user exist in all tables (activity, Calories, Heartrate, Intensities, MinuteMETsNarrow, Steps,  sleep, weight)
-- Result – 35
SELECT COUNT(DISTINCT Id) AS distinct_user_count
FROM (
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.activity
    UNION ALL
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.Calories
    UNION ALL
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.Heartrate
    UNION ALL
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.Intensities
    UNION ALL
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.MinuteMETsNarrow
    UNION ALL
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.Steps
    UNION ALL
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.sleep
    UNION ALL
    SELECT Id FROM bellabeat-casestudy2-441602.bellabeat.weight
) AS combined_users;

-- Check how much activities are user performing on average for only 5 columns.
SELECT DISTINCT Id, 
    AVG(TotalSteps) AS avg_steps, 
    AVG(TotalDistance) AS avg_distance,
    AVG(VeryActiveMinutes) AS avg_activeMinutes,
    AVG(SedentaryMinutes) AS avg_sedentary,
    AVG(Calories) AS avg_calories
FROM bellabeat-casestudy2-441602.bellabeat.activity
GROUP BY id;

-- Check average of sleep table and change minutes to hour
SELECT DISTINCT Id, 
    AVG(TotalSleepRecords) AS avg_record, 
    AVG(TotalMinutesAsleep/60) AS avg_asleephr,
    AVG(TotalTimeInBed/60) AS avg_timeInBedhr,
FROM bellabeat-casestudy2-441602.bellabeat.sleep
GROUP BY id;

-- Check whether there is an activity trend?
SELECT DISTINCT ActivityDate,
 COUNT(Id) AS Id,
 AVG(TotalSteps) AS avg_steps,
 AVG(TotalDistance) AS avg_total_distance, 
 AVG(VeryActiveMinutes) AS avg_very_act_min,
 AVG(FairlyActiveMinutes) AS avg_fairly_act_min,
 AVG(LightlyActiveMinutes) AS avg_light_min,
 AVG(SedentaryMinutes) AS avg_sedentary_min,
 AVG(Calories) AS avg_calories_burned
FROM bellabeat-casestudy2-441602.bellabeat.activity
GROUP BY ActivityDate 
ORDER BY ActivityDate

-- Check sleep trend over time
SELECT DISTINCT SleepDay,
 COUNT(Id) AS Id_count,
 AVG(TotalMinutesAsleep/60) AS avg_sleep_hr,
 AVG(TotalTimeInBed/60) AS avg_time_inbed,
FROM bellabeat-casestudy2-441602.bellabeat.sleep
GROUP BY SleepDay 
ORDER BY SleepDay

-- Average weight per user and their time of log
SELECT DISTINCT Id, 
    COUNT(Id) AS total_log,
    AVG(WeightPounds) AS avg_weightlb, 
    AVG(BMI) AS avg_bmi,
FROM bellabeat-casestudy2-441602.bellabeat.weight
GROUP BY Id
ORDER BY Id

/* Then I combine all the average file (Average_activity, Average_heartrate_logcount, Average_sleep, Average_weight_logcount)

I didn’t combine two trend excel data (Activity_trendbydate, Sleep_trendbydate) because id in one columns doesn’t have in other columns and if I combine it will be a mess.

Now, I change decimal in all_average file. Change decimal place to 0 in avg_steps, 2 in avg_distance, 2 in avg_activeminute to, 2 in avg_sedentary, 2 in avg_calories, 0 in avg_heartrate, 1 in avg_sleephr, 1 in avg_timeinbed, 0 in avg_weightlb, 1 in avg_bmi.

I change decimal in activity_trend file. Change decimal place to 0 in avg_steps, 2 in avg_total_distance, 2 in avg_very_active_min, 2 in avg_fairly_active_min & avg_light_min & avg_sedentary_min, 2 in avg_calories_burned. 

In sleep_trend table, I change sleepday column date into only date. I deleted time. Change decimal 1 in both avg_sleephr and avg_time_inbed.
  
In weight log excel file, I changed weightkg column decimal into 2, weight pound decimal into 3 and BMI into 1. */








