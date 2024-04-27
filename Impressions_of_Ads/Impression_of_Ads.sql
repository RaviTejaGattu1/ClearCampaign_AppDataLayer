-- Query to get which ad_type is getting more impressions
SELECT ad_id, ad_type, impressions FROM bigquery-public-data.google_political_ads.creative_stats where impressions = 
                                  (select max(impressions) from bigquery-public-data.google_political_ads.creative_stats); -- video and image are the most impactful ad_types