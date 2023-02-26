@IsTest
private class LogGenerator_Test {
	@IsTest
	static void shouldLogFromTrigger() {
		List<Log_Event__e> events = LogGenerator_Test.generateTestEvents();

		Test.startTest();
		new LogGenerator(events).createLogRecords();
		Test.stopTest();

		List<Log__c> logs = getLogs();
		System.assertEquals(events?.size(), logs?.size(), 'Wrong # of logs');
		for (Integer i = 0; i < 200; i++) {
			Log__c log = logs[i];
			Log_Event__e event = events[i];
			System.assertEquals(event?.Aggregate_Queries_Limit__c, log?.Aggregate_Queries_Limit__c, 'Wrong Aggregate_Queries_Limit__c');
			System.assertEquals(event?.Callouts_Limit__c, log?.Callouts_Limit__c, 'Wrong Callouts_Limit__c');
			System.assertEquals(event.Context__c, log.Context__c, 'Wrong Context__c');
			System.assertEquals(event?.CPU_Time__c, log?.CPU_Time__c, 'Wrong CPU_Time__c');
			System.assertEquals(event?.CPU_Time_Limit__c, log?.CPU_Time_Limit__c, 'Wrong CPU_Time_Limit__c');
			System.assertEquals(event?.DML_Rows_Limit__c, log?.DML_Rows_Limit__c, 'Wrong DML_Rows_Limit__c');
			System.assertEquals(event?.DML_Statements_Limit__c, log?.DML_Statements_Limit__c, 'Wrong DML_Statements_Limit__c');
			System.assertEquals(event?.Email_Invocations_Limit__c, log?.Email_Invocations_Limit__c, 'Wrong Email_Invocations_Limit__c');
			System.assertEquals(event?.Future_Calls_Limit__c, log?.Future_Calls_Limit__c, 'Wrong Future_Calls_Limit__c');
			System.assertEquals(event?.Heap_Size__c, log?.Heap_Size__c, 'Wrong Heap_Size__c');
			System.assertEquals(event?.Heap_Size_Limit__c, log?.Heap_Size_Limit__c, 'Wrong Heap_Size_Limit__c');
			System.assertEquals(event?.Immediate_Platform_Event_Publish_Limit__c, log?.Immediate_Platform_Event_Publish_Limit__c, 'Wrong Immediate_Platform_Event_Publish_Limit__c');
			System.assertEquals(event?.Include_Limits_Data__c, log?.Include_Limits_Data__c, 'Wrong Include_Limits_Data__c'); 
			System.assertEquals(event.Level__c, log.Level__c, 'Wrong Level__c');
			System.assertEquals(event.Logged_At__c, log.Logged_At__c, 'Wrong Logged_At__c');
			System.assert(log.Logged_At__c < log.CreatedDate, 'Logged At should be before CreatedDate');
			System.assertEquals(event.Message__c, log.Message__c, 'Wrong Message__c');
			System.assertEquals(event?.Num_Aggregate_Queries__c, log?.Num_Aggregate_Queries__c, 'Wrong Num_Aggregate_Queries__c');
			System.assertEquals(event?.Num_Callouts__c, log?.Num_Callouts__c, 'Wrong Num_Callouts__c');
			System.assertEquals(event?.Num_DML_Rows__c, log?.Num_DML_Rows__c, 'Wrong Num_DML_Rows__c');
			System.assertEquals(event?.Num_DML_Statements__c, log?.Num_DML_Statements__c, 'Wrong Num_DML_Statements__c');
			System.assertEquals(event?.Num_Email_Invocations__c, log?.Num_Email_Invocations__c, 'Wrong Num_Email_Invocations__c');
			System.assertEquals(event?.Num_Future_Calls__c, log?.Num_Future_Calls__c, 'Wrong Num_Future_Calls__c');
			System.assertEquals(event?.Num_Immediate_Platform_Event_Publish__c, log?.Num_Immediate_Platform_Event_Publish__c, 'Wrong Num_Immediate_Platform_Event_Publish__c');
			System.assertEquals(event?.Num_Push_Notifications__c, log?.Num_Push_Notifications__c, 'Wrong Num_Push_Notifications__c');
			System.assertEquals(event?.Num_QueryLocator_Rows__c, log?.Num_QueryLocator_Rows__c, 'Wrong Num_QueryLocator_Rows__c');
			System.assertEquals(event?.Num_Queueable_Jobs__c, log?.Num_Queueable_Jobs__c, 'Wrong Num_Queueable_Jobs__c');
			System.assertEquals(event?.Num_SOQL_Queries__c, log?.Num_SOQL_Queries__c, 'Wrong Num_SOQL_Queries__c');
			System.assertEquals(event?.Num_SOQL_Query_Rows__c, log?.Num_SOQL_Query_Rows__c, 'Wrong Num_SOQL_Query_Rows__c');
			System.assertEquals(event?.Num_SOSL_Queries__c, log?.Num_SOSL_Queries__c, 'Wrong Num_SOSL_Queries__c');
			System.assertEquals(event?.Push_Notifications_Limit__c, log?.Push_Notifications_Limit__c, 'Wrong Push_Notifications_Limit__c');
			System.assertEquals(event?.QueryLocator_Row_Limit__c, log?.QueryLocator_Row_Limit__c, 'Wrong QueryLocator_Row_Limit__c');
			System.assertEquals(event?.Queueable_Job_Limit__c, log?.Queueable_Job_Limit__c, 'Wrong Queueable_Job_Limit__c');
			System.assertEquals(event.Running_User__c, log.Running_User__c, 'Wrong Running_User__c');
			System.assertEquals(event.Sequence__c, log.Sequence__c, 'Wrong Sequence__c');
			System.assertEquals(event?.SOQL_Queries_Limit__c, log?.SOQL_Queries_Limit__c, 'Wrong SOQL_Queries_Limit__c');
			System.assertEquals(event?.SOQL_Query_Row_Limit__c, log?.SOQL_Query_Row_Limit__c, 'Wrong SOQL_Query_Row_Limit__c');
			System.assertEquals(event?.SOSL_Query_Limit__c, log?.SOSL_Query_Limit__c, 'Wrong SOSL_Query_Limit__c');
			System.assertEquals(event.Source__c, log.Source__c, 'Wrong Source__c');
			System.assertEquals(event.Stack_Trace__c, log.Stack_Trace__c, 'Wrong Stack_Trace__c');
			System.assertEquals(event.Transaction_Id__c, log.Transaction_Id__c, 'Wrong Transaction_Id__c');
		}
	}

	// **** HELPER **** //
	static List<Log_Event__e> generateTestEvents() {
		List<Log_Event__e> logEvents = new List<Log_Event__e>();
		Id userId = UserInfo.getUserId();
		System.Request req = System.Request.getCurrent();
		String stack = new System.DmlException()?.getStackTraceString();
		for (Integer i = 0; i < 200; i++) {
			Log_Event__e event = new Log_Event__e(
				Aggregate_Queries_Limit__c = Limits.getLimitAggregateQueries(),
				Callouts_Limit__c = Limits.getLimitCallouts(),
				Context__c = req.getQuiddity()?.name(),
				CPU_Time__c = Limits.getCpuTime(),
				CPU_Time_Limit__c = Limits.getLimitCpuTime(),
				DML_Rows_Limit__c = Limits.getLimitDMLRows(),
				DML_Statements_Limit__c = Limits.getLimitDMLStatements(),
				Email_Invocations_Limit__c = Limits.getLimitEmailInvocations(),
				Future_Calls_Limit__c = Limits.getLimitFutureCalls(),
				Heap_Size__c = Limits.getHeapSize(),
				Heap_Size_Limit__c = Limits.getLimitHeapSize(),
				Immediate_Platform_Event_Publish_Limit__c = Limits.getLimitPublishImmediateDML(),
				Include_Limits_Data__c = true, 
				Level__c = 'FINEST',
				Logged_At__c = DateTime.now().addSeconds(-5),
				Message__c = 'Test Log #' + (i + 1),
				Num_Aggregate_Queries__c = Limits.getAggregateQueries(),
				Num_Callouts__c = Limits.getCallouts(),
				Num_DML_Rows__c = Limits.getDMLRows(),
				Num_DML_Statements__c = Limits.getDMLStatements(),
				Num_Email_Invocations__c = Limits.getEmailInvocations(),
				Num_Future_Calls__c = Limits.getFutureCalls(),
				Num_Immediate_Platform_Event_Publish__c = Limits.getPublishImmediateDML(),
				Num_Push_Notifications__c = Limits.getMobilePushApexCalls(),
				Num_QueryLocator_Rows__c = Limits.getQueryLocatorRows(),
				Num_Queueable_Jobs__c = Limits.getQueueableJobs(),
				Num_SOQL_Queries__c = Limits.getQueries(),
				Num_SOQL_Query_Rows__c = Limits.getQueryRows(),
				Num_SOSL_Queries__c = Limits.getSoslQueries(),
				Push_Notifications_Limit__c = Limits.getLimitMobilePushApexCalls(),
				QueryLocator_Row_Limit__c = Limits.getLimitQueryLocatorRows(),
				Queueable_Job_Limit__c = Limits.getLimitQueueableJobs(),
				Running_User__c = userId,
				Sequence__c = (i + 1),
				SOQL_Queries_Limit__c = Limits.getLimitQueries(),
				SOQL_Query_Row_Limit__c = Limits.getLimitQueryRows(),
				SOSL_Query_Limit__c = Limits.getLimitSoslQueries(),
				Source__c = String.valueOf(LogGenerator_Test.class),
				Stack_Trace__c = stack,
				Transaction_Id__c = req.getRequestId()
			);
			logEvents?.add(event);
		}
		return logEvents;
	}

	static List<Log__c> getLogs() {
		return [
			SELECT
				Id,
				Source__c,
				Context__c,
				CreatedDate,
				Level__c,
				Logged_At__c,
				Message__c,
				Running_User__c,
				Sequence__c,
				Stack_Trace__c,
				Transaction_Id__c,
				Aggregate_Queries_Limit__c,
				Callouts_Limit__c,
				CPU_Time__c,
				CPU_Time_Limit__c,
				DML_Rows_Limit__c,
				DML_Statements_Limit__c,
				Email_Invocations_Limit__c,
				Future_Calls_Limit__c,
				Heap_Size__c,
				Heap_Size_Limit__c,
				Include_Limits_Data__c,
				Immediate_Platform_Event_Publish_Limit__c,
				Num_Aggregate_Queries__c,
				Num_Callouts__c,
				Num_DML_Rows__c,
				Num_DML_Statements__c,
				Num_Email_Invocations__c,
				Num_Future_Calls__c,
				Num_Immediate_Platform_Event_Publish__c,
				Num_Push_Notifications__c,
				Num_QueryLocator_Rows__c,
				Num_Queueable_Jobs__c,
				Num_SOQL_Queries__c,
				Num_SOQL_Query_Rows__c,
				Num_SOSL_Queries__c,
				Push_Notifications_Limit__c,
				QueryLocator_Row_Limit__c,
				Queueable_Job_Limit__c,
				SOQL_Queries_Limit__c,
				SOQL_Query_Row_Limit__c,
				SOSL_Query_Limit__c
			FROM Log__c
			ORDER BY Sequence__c ASC
		];
	}
}
