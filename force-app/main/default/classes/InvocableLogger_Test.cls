@IsTest 
private class InvocableLogger_Test {
    @IsTest
	static void shouldLogFromFlow() {
		Logger.Settings = getActiveSettings(LoggingLevel.FINEST);
		Logger.LogInput input = new Logger.LogInput();
		input.logLevelName = LoggingLevel.FINEST.name();
		input.logMessage = 'Hello world!';

		Test.startTest();
		InvocableLogger.invoke(new List<Logger.LogInput>{ input });
		Test.stopTest();

		System.assertEquals(1, Logger.PendingLogs?.size(), 'Wrong # of pending logs');
		System.assertEquals(input.logMessage, Logger.PendingLogs[0].Message__c, 'Wrong message');
	}

	// **** HELPER **** // 
	static Log_Setting__c getActiveSettings(LoggingLevel level) {
		return new Log_Setting__c(Enabled__c = true, Level__c = level?.name());
	}
}