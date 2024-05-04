SELECT
  gs.country_subdivision_primary AS state,
  ad.advertiser_name,
  SUM(gs.spend_usd) AS total_spend_usd
FROM
  `bigquery-public-data.google_political_ads.advertiser_geo_spend` gs
JOIN
  `bigquery-public-data.google_political_ads.advertiser_stats` ad
ON
  gs.advertiser_id = ad.advertiser_id
WHERE
  gs.country = 'US'
GROUP BY
  state,
  ad.advertiser_name
ORDER BY
  total_spend_usd DESC

