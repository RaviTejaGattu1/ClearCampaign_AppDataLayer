SELECT
  cs.gender_targeting, COUNT(*) as gender_count, SUM(ags.spend_usd) AS total_usd
FROM
  bigquery-public-data.google_political_ads.creative_stats AS cs
JOIN
  bigquery-public-data.google_political_ads.advertiser_geo_spend AS ags
ON
  cs.advertiser_id = ags.advertiser_id
GROUP BY
  cs.gender_targeting
LIMIT
  100;