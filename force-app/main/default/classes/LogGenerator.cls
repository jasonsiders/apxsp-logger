public class LogGenerator {
	List<Log_Event__e> events;

	public LogGenerator(List<Log_Event__e> events) { 
		this.events = events;
	}

	public void createLogRecords() {
		List<Log__c> logs = new List<Log__c>();
		for (Log_Event__e event : this.events) {
			Log__c log = new Log__c(
				Aggregate_Queries_Limit__c = event?.Aggregate_Queries_Limit__c,
				Callouts_Limit__c = event?.Callouts_Limit__c,
				Context__c = event?.Context__c,
				CPU_Time__c = event?.CPU_Time__c,
				CPU_Time_Limit__c = event?.CPU_Time_Limit__c,
				DML_Rows_Limit__c = event?.DML_Rows_Limit__c,
				DML_Statements_Limit__c = event?.DML_Statements_Limit__c,
				Email_Invocations_Limit__c = event?.Email_Invocations_Limit__c,
				Future_Calls_Limit__c = event?.Future_Calls_Limit__c,
				Heap_Size__c = event?.Heap_Size__c,
				Heap_Size_Limit__c = event?.Heap_Size_Limit__c,
				Immediate_Platform_Event_Publish_Limit__c = event?.Immediate_Platform_Event_Publish_Limit__c,
				Include_Limits_Data__c = event?.Include_Limits_Data__c,
				Level__c = event?.Level__c,
				Logged_At__c = event?.Logged_At__c,
				Message__c = event?.Message__c,
				Num_Aggregate_Queries__c = event?.Num_Aggregate_Queries__c,
				Num_Callouts__c = event?.Num_Callouts__c,
				Num_DML_Rows__c = event?.Num_DML_Rows__c,
				Num_DML_Statements__c = event?.Num_DML_Statements__c,
				Num_Email_Invocations__c = event?.Num_Email_Invocations__c,
				Num_Future_Calls__c = event?.Num_Future_Calls__c,
				Num_Immediate_Platform_Event_Publish__c = event?.Num_Immediate_Platform_Event_Publish__c,
				Num_Push_Notifications__c = event?.Num_Push_Notifications__c,
				Num_QueryLocator_Rows__c = event?.Num_QueryLocator_Rows__c,
				Num_Queueable_Jobs__c = event?.Num_Queueable_Jobs__c,
				Num_SOQL_Queries__c = event?.Num_SOQL_Queries__c,
				Num_SOQL_Query_Rows__c = event?.Num_SOQL_Query_Rows__c,
				Num_SOSL_Queries__c = event?.Num_SOSL_Queries__c,
				Push_Notifications_Limit__c = event?.Push_Notifications_Limit__c,
				QueryLocator_Row_Limit__c = event?.QueryLocator_Row_Limit__c,
				Queueable_Job_Limit__c = event?.Queueable_Job_Limit__c,
				Running_User__c = event?.Running_User__c,
				Sequence__c = event?.Sequence__c,
				SOQL_Queries_Limit__c = event?.SOQL_Queries_Limit__c,
				SOQL_Query_Row_Limit__c = event?.SOQL_Query_Row_Limit__c,
				SOSL_Query_Limit__c = event?.SOSL_Query_Limit__c,
				Source__c = event?.Source__c,
				Stack_Trace__c = event?.Stack_Trace__c,
				Transaction_Id__c = event?.Transaction_Id__c
			);
			logs.add(log); 
		}
		Database.insert(logs, false);
	}
}
