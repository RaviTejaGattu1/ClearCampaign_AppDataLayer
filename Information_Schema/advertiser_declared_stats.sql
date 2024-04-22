/*
Dataset : bigquery-public-data.google_political_ads
Table : advertiser_declared_stats
*/

SELECT
  column_name,
  data_type,
  is_nullable,
  column_default
FROM
  `bigquery-public-data.google_political_ads.INFORMATION_SCHEMA.COLUMNS`
WHERE
  table_name = 'advertiser_declared_stats';

/*
Results JSON : 
[{
  "column_name": "advertiser_id",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "region",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "advertiser_declared_name",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "advertiser_declared_regulatory_id",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "advertiser_declared_scope",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "advertiser_declared_promoter_name",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "advertiser_declared_promoter_address",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}]
*/
