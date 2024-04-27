--US_State_wise_Total_Spending_by_Advertiser
SELECT
  a.advertiser_id,
  a.advertiser_name,
  g.country_subdivision_primary,
  SUM(g.spend_usd) AS total_spend_usd
FROM
  `bigquery-public-data.google_political_ads.advertiser_stats` AS a
JOIN
  `bigquery-public-data.google_political_ads.advertiser_geo_spend` AS g
ON
  a.advertiser_id = g.advertiser_id
WHERE
  g.country = 'US'
GROUP BY
  a.advertiser_id,
  a.advertiser_name,
  g.country_subdivision_primary
LIMIT
  100;
