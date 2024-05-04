--California_2024_Weekly_PoliticalAdSpends
SELECT
  g.country_subdivision_primary,
  w.week_start_date,
  w.advertiser_name,
  SUM(w.spend_usd) AS total_weekly_spend_usd
FROM
  `bigquery-public-data.google_political_ads.advertiser_weekly_spend` AS w
JOIN
  `bigquery-public-data.google_political_ads.advertiser_geo_spend` AS g
ON
  w.advertiser_id = g.advertiser_id
WHERE
  g.country = 'US'AND g.country_subdivision_primary='CA'
GROUP BY
  g.country_subdivision_primary,
  w.week_start_date,
  w.advertiser_name
ORDER BY
  g.country_subdivision_primary,
  w.week_start_date DESC
LIMIT
  100;
