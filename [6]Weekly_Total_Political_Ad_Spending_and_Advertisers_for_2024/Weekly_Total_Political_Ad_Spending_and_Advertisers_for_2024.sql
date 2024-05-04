-- YEAR, WEEK wise political ad spending & no of advertisers data (in US)
-- The Story Data Tells Us 
-- Interesting Find : February had a surge in spending 
-- Potential Reason : Election dates closing in for states : South Carolina, Nevada, Caucus Virgin Islands, Michigan etc
-- Reference : https://www.270towin.com/2024-presidential-election-calendar/

SELECT
  EXTRACT(YEAR FROM week_start_date) as YEAR,
  week_start_date as WEEK,
  COUNT(DISTINCT advertiser_id) as No_of_Advertisers,
  SUM(spend_usd) as Total_Political_Ad_Spending
FROM
  `bigquery-public-data.google_political_ads.advertiser_weekly_spend`
WHERE
  EXTRACT(YEAR FROM week_start_date)=2024
GROUP BY 
YEAR,
week_start_date
ORDER BY
YEAR, week_start_date
LIMIT
  50;
