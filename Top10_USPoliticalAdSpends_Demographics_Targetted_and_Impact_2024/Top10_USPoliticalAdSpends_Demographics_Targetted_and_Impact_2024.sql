SELECT
  a.regions,
  EXTRACT(YEAR
  FROM
    c.last_served_timestamp) AS year,
  a.advertiser_name,
  SUM(c.spend_range_max_usd) AS Spending,
  c.impressions,
  c.ad_type,
  c.age_targeting,
  c.gender_targeting,
  c.geo_targeting_included
FROM
  `bigquery-public-data.google_political_ads.creative_stats` AS c
JOIN
  `bigquery-public-data.google_political_ads.advertiser_stats` AS a
ON
  c.advertiser_id = a.advertiser_id
WHERE
  a.regions='US'
  AND a.spend_usd<>0
  AND c.age_targeting IS NOT NULL
  AND c.age_targeting IS NOT NULL
  AND EXTRACT(YEAR
  FROM
    date_range_start)=2024
GROUP BY
  a.regions,
  year,
  a.advertiser_name,
  c.ad_type,
  c.impressions,
  c.age_targeting,
  c.gender_targeting,
  c.geo_targeting_included
ORDER BY
  Spending DESC
LIMIT
  10;
