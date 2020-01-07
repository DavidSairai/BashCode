#!/bin/sh
cluster_name="absolution-prod.cluster-c4tppvwffn07.us-east-1.rds.amazonaws.com"
show_tables="show tables;"

#REPORT_INCIDENT_MAP table
describe_table="desc REPORT_INCIDENT_MAP;"
create_table="CREATE TABLE REPORT_INCIDENT_MAP (REPORT_INCIDENT_MAP_ID
bigint(20) unsigned NOT NULL auto_increment, REPORT_ID bigint(20)
unsigned NOT NULL, SOURCE_IP varchar(64) default NULL, SOURCE_PORT smallint(5)
unsigned default NULL, REMOTE_IP varchar(64) default NULL, REMOTE_PORT
smallint(5) unsigned default NULL, PROTOCOL varchar(8) default NULL, SOURCE_URL
varchar(512) default NULL, REMOTE_URL varchar(512) default NULL,
IMPLICATED_RESOURCE_ARN varchar(512) default NULL,PRIMARY KEY
(REPORT_INCIDENT_MAP_ID),KEY KEY_REPORT_ID
(REPORT_ID), KEY KEY_SOURCE_IP(SOURCE_IP), KEY KEY_REMOTE_IP(REMOTE_IP)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 ROW_FORMAT=DYNAMIC;"
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$show_tables$create_table$describe_table"

#IDEMPOTENCY_TABLE table
describe_table="desc IDEMPOTENCY_TOKENS;"
create_table="CREATE TABLE IDEMPOTENCY_TOKENS (IDEMPOTENCY_TOKENS_ID
bigint(20) unsigned NOT NULL auto_increment, TOKEN varchar(64) not NULL,
CLIENT_IDENTIFIER varchar(128) default NULL, API
varchar(64) default NULL, REPORT_ID bigint(20)
unsigned NOT NULL, CASE_ID bigint(20) not NULL, CREATION_DATE datetime not NULL, PRIMARY KEY
(IDEMPOTENCY_TOKENS_ID),KEY KEY_TOKEN(TOKEN), KEY KEY_REPORT_ID
(REPORT_ID), KEY KEY_CASE_ID(CASE_ID)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 ROW_FORMAT=DYNAMIC;"
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$show_tables$create_table$describe_table"
