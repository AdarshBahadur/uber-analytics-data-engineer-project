 CREATE OR REPLACE TABLE `scenic-handler-427712-n7.uber_data_engineering.tbl_analysis_report` AS (
 SELECT
   f.VendorID,
   dd.tpep_pickup_datetime,
   dd.tpep_dropoff_datetime,
   p.passenger_count,
   td.trip_distance,
   rc.RatecodeID,
   rc.rate_code_name,
   f.store_and_fwd_flag,
   pl.pickup_latitude,
   pl.pickup_longitude,
   dl.dropoff_latitude,
   dl.dropoff_longitude,
   pt.payment_type,
   pt.payment_type_name,
   f.fare_amount,
   f.extra,
   f.mta_tax,
   f.tip_amount,
   f.tolls_amount,
   f.improvement_surcharge,
   f.total_amount
 FROM
   `scenic-handler-427712-n7.uber_data_engineering.fact_table` f
   JOIN `scenic-handler-427712-n7.uber_data_engineering.passenger_count_dim` p ON f.passenger_count_id = p.passenger_count_id
   JOIN `scenic-handler-427712-n7.uber_data_engineering.trip_distance_dim` td ON f.trip_distance_id = td.trip_distance_id
   JOIN `scenic-handler-427712-n7.uber_data_engineering.rate_code_dim` rc ON f.rate_code_id = rc.rate_code_id
   JOIN `scenic-handler-427712-n7.uber_data_engineering.pickup_location_dim` pl ON f.pickup_location_id = pl.pickup_location_id
   JOIN `scenic-handler-427712-n7.uber_data_engineering.dropoff_location_dim` dl ON f.dropoff_location_id = dl.dropoff_location_id
   JOIN `scenic-handler-427712-n7.uber_data_engineering.payment_type_dim` pt ON f.payment_type_id = pt.payment_type_id
   JOIN `scenic-handler-427712-n7.uber_data_engineering.datetime_dim` dd ON f.datetime_id = dd.datetime_id);

   SELECT * FROM `scenic-handler-427712-n7.uber_data_engineering.tbl_analysis_report`
