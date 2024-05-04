---------------------------------------------------------------------
--Demographics_Targetted_and_Impact_by_Top10_USPoliticalAdSpends_2024
---------------------------------------------------------------------
---------------------------------------------------------------------
-- BEFORE OPTIMIZATION
---------------------------------------------------------------------

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
  100;

---------------------------------------------------------------------
-- AFTER OPTIMIZATION
---------------------------------------------------------------------
WITH FilteredCreativeStats AS (
  SELECT
    advertiser_id,
    EXTRACT(YEAR FROM last_served_timestamp) AS year,
    spend_range_max_usd,
    impressions,
    ad_type,
    age_targeting,
    gender_targeting,
    geo_targeting_included,
    EXTRACT(YEAR FROM date_range_start) AS start_year
  FROM
    `bigquery-public-data.google_political_ads.creative_stats`
  WHERE
    age_targeting IS NOT NULL AND
    EXTRACT(YEAR FROM date_range_start) = 2024
),
FilteredAdvertiserStats AS (
  SELECT
    advertiser_id,
    regions,
    advertiser_name,
    spend_usd
  FROM
    `bigquery-public-data.google_political_ads.advertiser_stats`
  WHERE
    regions = 'US' AND
    spend_usd <> 0
)

SELECT
  a.regions,
  c.year,
  a.advertiser_name,
  SUM(c.spend_range_max_usd) AS Spending,
  c.impressions,
  c.ad_type,
  c.age_targeting,
  c.gender_targeting,
  c.geo_targeting_included
FROM
  FilteredCreativeStats c
JOIN
  FilteredAdvertiserStats a ON c.advertiser_id = a.advertiser_id
GROUP BY
  a.regions,
  c.year,
  a.advertiser_name,
  c.ad_type,
  c.impressions,
  c.age_targeting,
  c.gender_targeting,
  c.geo_targeting_included
ORDER BY
  Spending DESC
LIMIT
  100;



-----





APPENDIX : 
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
