--BEFORE OPTIMIZATION
WITH
  FilteredAdvertiserStats AS (
  SELECT
    advertiser_id,
    advertiser_name
  FROM
    `bigquery-public-data.google_political_ads.advertiser_stats` ),
  FilteredGeoSpend AS (
  SELECT
    advertiser_id,
    country_subdivision_primary,
    spend_usd
  FROM
    `bigquery-public-data.google_political_ads.advertiser_geo_spend`
  WHERE
    country = 'US' )
SELECT
  a.advertiser_id,
  a.advertiser_name,
  g.country_subdivision_primary,
  SUM(g.spend_usd) AS total_spend_usd
FROM
  FilteredAdvertiserStats a
JOIN
  FilteredGeoSpend g
ON
  a.advertiser_id = g.advertiser_id
GROUP BY
  1,
  2,
  3
LIMIT
  100;


--AFTER OPTIMIZATION
SELECT
  t1.advertiser_name,
  t2.country_subdivision_primary,
  SUM(t2.spend_usd) AS total_spending
FROM
  `bigquery-public-data.google_political_ads.advertiser_stats` AS t1
INNER JOIN
  `bigquery-public-data.google_political_ads.advertiser_geo_spend` AS t2
ON
  t1.advertiser_id = t2.advertiser_id
WHERE
  t2.country = 'US'
GROUP BY
  1,
  2
LIMIT 100;



--Appendix :
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
