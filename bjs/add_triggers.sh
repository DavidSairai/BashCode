#!/bin/sh
cluster_name="absolution-prod-bjs.c4tppvwffn07.us-east-1.rds.amazonaws.com"
set_session_sql_mode="SET SESSION SQL_MODE=\"\";"

#ABUSE_CASES->ABUSE_CASE_AUDIT
show_trigger="SHOW TRIGGERS like 'ABUSE_CASES%';";
delete_trigger="DROP TRIGGER IF EXISTS TRG_ABUSE_CASES_UPDATE;";
create_trigger_for_update="
DELIMITER ;;
CREATE DEFINER='root'@'%' TRIGGER TRG_ABUSE_CASES_UPDATE 
BEFORE UPDATE ON ABUSE_CASES 
FOR EACH ROW 
    BEGIN 
        SET NEW.RECORD_VERSION_NUMBER = OLD.RECORD_VERSION_NUMBER + 1, NEW.LAST_UPDATED = NOW(); 
        INSERT INTO ABUSE_CASE_AUDIT(
            ABUSE_CASE_ID, 
            REPLACEMENT_OF, 
            CATEGORY, 
            TYPE,
            IMPLICATED_SERVICE, 
            ABUSE_TYPE,
            ABUSE_SUBTYPE,
            CUSTOMER_EMAIL,
            REPORTER_EMAIL, 
            REPORT_TIME_START, 
            REPORT_TIME_END,
            ABUSE_TIME_START, 
            ABUSE_TIME_END, 
            JBPM_PROCESS_KEY, 
            JBPM_PROCESS_VERSION,
            JBPM_PROCESS_INSTANCE_ID, 
            JBPM_STATE, 
            CAN_ADD_REPORT, 
            NUMBER_OF_REPORTS, 
            AWS_ID,
            VALIDITY,
            RESOLVER, 
            ROLE, 
            LOCK_TIME, 
            LOCKED_BY, 
            STATUS, 
            ACTION_TAKEN,
            RESOURCE,
            RATIONALE,
            RESOLVE_CATEGORY,
            CREATION_DATE,
            CREATED_BY) 
        VALUES (
            OLD.ABUSE_CASE_ID, 
            OLD.REPLACEMENT_OF,
            OLD.CATEGORY, 
            OLD.TYPE, 
            OLD.IMPLICATED_SERVICE, 
            OLD.ABUSE_TYPE, 
            OLD.ABUSE_SUBTYPE, 
            OLD.CUSTOMER_EMAIL, 
            OLD.REPORTER_EMAIL,
            OLD.REPORT_TIME_START, 
            OLD.REPORT_TIME_END, 
            OLD.ABUSE_TIME_START,
            OLD.ABUSE_TIME_END, 
            OLD.JBPM_PROCESS_KEY, 
            OLD.JBPM_PROCESS_VERSION,
            OLD.JBPM_PROCESS_INSTANCE_ID, 
            OLD.JBPM_STATE, 
            OLD.CAN_ADD_REPORT,
            OLD.NUMBER_OF_REPORTS, 
            OLD.AWS_ID, 
            OLD.VALIDITY, 
            OLD.RESOLVER, 
            OLD.ROLE,
            OLD.LOCK_TIME, 
            OLD.LOCKED_BY, 
            OLD.STATUS, 
            OLD.ACTION_TAKEN, 
            OLD.RESOURCE,
            OLD.RATIONALE, 
            OLD.RESOLVE_CATEGORY, 
            NOW(),
            OLD.LAST_UPDATED_BY);
        END;;
        DELIMITER ;";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$set_session_sql_mode$delete_trigger$create_trigger_for_update"
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$show_trigger"

#REPORT->REPORT_AUDIT
show_trigger="show triggers like 'REPORTS%'";
delete_trigger="DROP TRIGGER IF EXISTS TRG_REPORTS_UPDATE;";
create_trigger_for_update="
DELIMITER ;;
CREATE DEFINER='root'@'%' TRIGGER TRG_REPORTS_UPDATE
BEFORE UPDATE ON REPORTS 
FOR EACH ROW 
    BEGIN 
        SET NEW.RECORD_VERSION_NUMBER = OLD.RECORD_VERSION_NUMBER + 1, NEW.LAST_UPDATED = NOW();
        INSERT INTO REPORT_AUDIT(
            REPORT_ID, 
            ABUSE_CASE_ID, 
            INDEX_IN_CASE, 
            AWS_ID, 
            REPORTER_ID,
            REPORTER_CASE_ID,
            REPLACEMENT_OF,
            CATEGORY,
            TYPE,
            IMPLICATED_SERVICE,
            ABUSE_TYPE,
            ABUSE_SUBTYPE,
            DO_NOT_REPLY,
            REPORT_TIME,
            ABUSE_TIME, 
            ABUSE_TIME_END, 
            ABUSE_TIME_ZONE, 
            ABUSE_DURATION, 
            REPORTER_IP, 
            EC2_INSTANCE_IDS,
            EC2_IPS,
            EC2_PORTS,
            EC2_URLS,
            EC2_AMI_IDS,
            REMOTE_IPS,
            REMOTE_PORTS,
            REMOTE_URLS, 
            NTP_SYNCHED, 
            VALIDITY, 
            STATUS, 
            RESOLVER, 
            CREATION_DATE, 
            CREATED_BY)
        VALUES (
            OLD.REPORT_ID, 
            OLD.ABUSE_CASE_ID, 
            OLD.INDEX_IN_CASE, 
            OLD.AWS_ID,
            OLD.REPORTER_ID, 
            OLD.REPORTER_CASE_ID, 
            OLD.REPLACEMENT_OF,
            OLD.CATEGORY, 
            OLD.TYPE,
            OLD.IMPLICATED_SERVICE, 
            OLD.ABUSE_TYPE, 
            OLD.ABUSE_SUBTYPE,
            OLD.DO_NOT_REPLY, 
            OLD.REPORT_TIME, 
            OLD.ABUSE_TIME, 
            OLD.ABUSE_TIME_END, 
            OLD.ABUSE_TIME_ZONE,
            OLD.ABUSE_DURATION, 
            OLD.REPORTER_IP, 
            OLD.EC2_INSTANCE_IDS, 
            OLD.EC2_IPS,
            OLD.EC2_PORTS, 
            OLD.EC2_URLS, 
            OLD.EC2_AMI_IDS, 
            OLD.REMOTE_IPS, 
            OLD.REMOTE_PORTS,
            OLD.REMOTE_URLS, 
            OLD.NTP_SYNCHED, 
            OLD.VALIDITY, 
            OLD.STATUS, 
            OLD.RESOLVER, 
            NOW(),
            OLD.LAST_UPDATED_BY);
    END;;
DELIMITER ;";
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$set_session_sql_mode$delete_trigger$create_trigger_for_update$show_trigger"
mysql -u root -p -h $cluster_name -D absolution --port 3306 --execute="$show_trigger"
