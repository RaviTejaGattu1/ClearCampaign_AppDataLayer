-California_2024_Weekly_PoliticalAdSpends
---------------
---UNOPTIMIZED
---------------
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


---------------
---OPTIMIZED
---------------

-- Pre-filtering to reduce join and aggregation data size
WITH FilteredGeoSpend AS (
  SELECT
    advertiser_id,
    country_subdivision_primary
  FROM
    `bigquery-public-data.google_political_ads.advertiser_geo_spend`
  WHERE
    country = 'US' AND
    country_subdivision_primary = 'CA'
)

SELECT
  g.country_subdivision_primary,
  w.week_start_date,
  w.advertiser_name,
  SUM(w.spend_usd) AS total_weekly_spend_usd
FROM
  `bigquery-public-data.google_political_ads.advertiser_weekly_spend` AS w
JOIN
  FilteredGeoSpend AS g
ON
  w.advertiser_id = g.advertiser_id
GROUP BY
  1, 2, 3
ORDER BY
  1, 2 DESC
LIMIT
  100;





APPENDIX 
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
