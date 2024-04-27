SELECT
  a.advertiser_id,
  a.advertiser_name,
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
  a.advertiser_name
ORDER BY
  total_spend_usd DESC
LIMIT
  10;
