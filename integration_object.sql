create or replace storage integration s3_int
  type = external_stage
  storage_provider = s3
  storage_aws_role_arn = 'arn:aws:iam::541750254318:role/databridgepr28-databridge-SnowflakeIntegrationRole-P5VX50O0OCUK'
  enabled = true
  storage_allowed_locations = ('*');
  
use CORE_DWH;
use schema LANDING;
CREATE OR REPLACE FILE FORMAT my_CSV TYPE = CSV;




-- drop stage my_s3_stage
create or replace stage my_s3_stage
storage_integration = s3_int
url = 's3://databridgepr28-databridg-eventbuss3bucketdirector-yikzegayotjg'
file_format = my_CSV;



list @my_s3_stage;

desc stage my_s3_stage;
