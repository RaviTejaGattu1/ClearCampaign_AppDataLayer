SELECT
  ast.advertiser_name,
  ast.*,
  ads.*
FROM
  `bigquery-public-data.google_political_ads.advertiser_stats` AS ast
INNER JOIN
  `bigquery-public-data.google_political_ads.advertiser_declared_stats` AS ads
ON
  ads.advertiser_id = ast.advertiser_id
WHERE
  regions IS NOT NULL
LIMIT
  50;