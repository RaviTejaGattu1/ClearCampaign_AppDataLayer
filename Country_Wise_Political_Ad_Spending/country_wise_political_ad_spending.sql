(
  SELECT
    country,
    SUM(spend_usd) AS Political_Ad_Spending
  FROM
    `bigquery-public-data.google_political_ads.advertiser_geo_spend`
  WHERE
    country='US'
  GROUP BY
    country
)
UNION ALL 
(
  SELECT
    country,
    SUM(spend_gbp) AS Political_Ad_Spending
  FROM
    `bigquery-public-data.google_political_ads.advertiser_geo_spend`
  WHERE
    country='GB'
  GROUP BY
    country
)
UNION ALL
(
SELECT
  country,SUM(spend_ils) AS Political_Ad_Spending
FROM
  `bigquery-public-data.google_political_ads.advertiser_geo_spend`
WHERE
    country='IL'
GROUP BY
  country
LIMIT
  100
)
