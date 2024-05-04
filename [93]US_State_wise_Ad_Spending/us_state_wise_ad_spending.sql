SELECT
  'US' AS country,
  country_subdivision_primary AS state,
  SUM(spend_usd) AS total_usd
FROM
  bigquery-public-data.google_political_ads.advertiser_geo_spend
WHERE
  country='US'
GROUP BY
  country_subdivision_primary
HAVING
  total_usd > 0
ORDER BY
  total_usd DESC;