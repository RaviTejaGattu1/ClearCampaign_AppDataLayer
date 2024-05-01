/*
Dataset : bigquery-public-data.google_political_ads
Table : advertiser_geo_spend
*/

SELECT
  column_name,
  data_type,
  is_nullable,
  column_default
FROM
  `bigquery-public-data.google_political_ads.INFORMATION_SCHEMA.COLUMNS`
WHERE
  table_name = 'advertiser_geo_spend';

/*
somehow this worked for me, not the other one
SELECT
  column_name,
  data_type
FROM
  bigquery-public-data.google_political_ads.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS
WHERE
  table_name = "advertiser_geo_spend"
*/


/*
Results JSON: 
[{
  "column_name": "advertiser_id",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "advertiser_name",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "country",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "country_subdivision_primary",
  "data_type": "STRING",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_usd",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_eur",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_inr",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_bgn",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_hrk",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_czk",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_dkk",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_huf",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_pln",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_ron",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_sek",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_gbp",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_nzd",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_ils",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_aud",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_twd",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_brl",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_ars",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_zar",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}, {
  "column_name": "spend_clp",
  "data_type": "INT64",
  "is_nullable": "YES",
  "column_default": "NULL"
}]

*/
