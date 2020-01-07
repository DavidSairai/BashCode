#!/bin/sh
cluster_name="absolution-prod.cluster-c4tppvwffn07.us-east-1.rds.amazonaws.com"

#ABUSE_CASES table
describe_table="desc ABUSE_CASES;";
add_column_prefix="alter table ABUSE_CASES add column ";
add_column_category="$add_column_prefix CATEGORY varchar(64) default NULL
after REPLACEMENT_OF, add index (CATEGORY);";
add_column_type="$add_column_prefix TYPE varchar(64) default NULL after
CATEGORY, add index (TYPE);";
add_column_implicated_service="$add_column_prefix IMPLICATED_SERVICE
varchar(64) default NULL after TYPE, add index (IMPLICATED_SERVICE);";
add_column_resource="$add_column_prefix RESOURCE varchar(64) default NULL
after ACTION_TAKEN_TIME, add index(RESOURCE);";
add_column_rationale="$add_column_prefix RATIONALE varchar(64) default NULL
after RESOURCE, add index(RATIONALE);";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$describe_table$add_column_category$add_column_type$add_column_implicated_service$add_column_resource$add_column_rationale$describe_table"

#ABUSE_CASE_AUDIT table
describe_table="desc ABUSE_CASE_AUDIT;";
add_column_prefix="alter table ABUSE_CASE_AUDIT add column ";
add_column_category="$add_column_prefix CATEGORY varchar(64) default NULL
after REPLACEMENT_OF, add index (CATEGORY);";
add_column_type="$add_column_prefix TYPE varchar(64) default NULL after
CATEGORY, add index (TYPE);";
add_column_implicated_service="$add_column_prefix IMPLICATED_SERVICE
varchar(64) default NULL after TYPE, add index (IMPLICATED_SERVICE);";
add_column_action_taken="$add_column_prefix ACTION_TAKEN varchar(64) default NULL
after ROLE, add index(ACTION_TAKEN);";
add_column_resource="$add_column_prefix RESOURCE varchar(64) default NULL
after ACTION_TAKEN, add index(RESOURCE);";
add_column_rationale="$add_column_prefix RATIONALE varchar(64) default NULL
after RESOURCE, add index(RATIONALE);";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$describe_table$add_column_category$add_column_type$add_column_implicated_service$add_column_action_takenadd_column_resource$add_column_rationale$describe_table"

#REPORTS table
describe_table="desc REPORTS;";
add_column_prefix="alter table REPORTS add column ";
add_column_replacement_of="$add_column_prefix REPLACEMENT_OF bigint(20)
unsigned default NULL after INDEX_IN_CASE, add index (REPLACEMENT_OF);";
add_column_category="$add_column_prefix CATEGORY varchar(64) default NULL
after REPLACEMENT_OF, add index (CATEGORY);";
add_column_type="$add_column_prefix TYPE varchar(64) default NULL after
CATEGORY, add index (TYPE);";
add_column_implicated_service="$add_column_prefix IMPLICATED_SERVICE
varchar(64) default NULL after TYPE, add index (IMPLICATED_SERVICE);";
add_column_abuse_time_end="$add_column_prefix ABUSE_TIME_END datetime default
NULL after ABUSE_TIME;";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$describe_table$add_column_replacement_of$add_column_category$add_column_type$add_column_implicated_service$add_column_abuse_time_end$describe_table"


#REPORT_AUDIT table
describe_table="desc REPORT_AUDIT;";
add_column_prefix="alter table REPORT_AUDIT add column ";
add_column_replacement_of="$add_column_prefix REPLACEMENT_OF bigint(20)
unsigned default NULL after INDEX_IN_CASE, add index (REPLACEMENT_OF);";
add_column_category="$add_column_prefix CATEGORY varchar(64) default NULL
after REPLACEMENT_OF, add index (CATEGORY);";
add_column_type="$add_column_prefix TYPE varchar(64) default NULL after
CATEGORY, add index (TYPE);";
add_column_implicated_service="$add_column_prefix IMPLICATED_SERVICE
varchar(64) default NULL after TYPE, add index (IMPLICATED_SERVICE);";
add_column_abuse_time_end="$add_column_prefix ABUSE_TIME_END datetime default
NULL after ABUSE_TIME;";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$describe_table$add_column_replacement_of$add_column_category$add_column_type$add_column_implicated_service$add_column_abuse_time_end$describe_table"

#CASE_RESOURE_MAP
describe_table="desc CASE_RESOURCE_MAP;";
add_column_prefix="alter table CASE_RESOURCE_MAP add column ";
add_column_cause_id="$add_column_prefix CAUSE_ID bigint(20) unsigned default
NULL after REGION, add index (CAUSE_ID);";
add_column_parent_id="$add_column_prefix PARENT_ID bigint(20) unsigned default
NULL after CAUSE_ID, add index (PARENT_ID);";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$describe_table$add_column_cause_id$add_column_parent_id$describe_table"

#ABUSE_CASE_RESOLVE_HISTORY
describe_table="desc ABUSE_CASE_RESOLVE_HISTORY;";
add_column_prefix="alter table ABUSE_CASE_RESOLVE_HISTORY add column ";
add_column_resource="$add_column_prefix RESOURCE varchar(64) default NULL
after ACTION_TAKEN, add index(RESOURCE);";
add_column_rationale="$add_column_prefix RATIONALE varchar(64) default NULL
after RESOURCE, add index(RATIONALE);";
alter_resolve_category_column="alter table ABUSE_CASE_RESOLVE_HISTORY modify column RESOLVE_CATEGORY VARCHAR(16) NULL;";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$describe_table$add_column_resource$add_column_rationale$alter_resolve_category_column$describe_table"
