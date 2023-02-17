@IsTest
private class InvocableLogPublisher_Test {
    @IsTest 
    static void shouldLog() {
        Logger.log('This is a test'); 

        Test.startTest();
        InvocableLogPublisher.invoke(); 
        Test.stopTest();

        System.assertEquals(1, Logger.PublishedLogs?.size(), 'Wrong # of Published Logs');
    }

    @IsTest 
    static void shouldDoNothingIfNoLogs() {
        Test.startTest();
        InvocableLogPublisher.invoke(); 
        Test.stopTest();

        System.assertEquals(0, Logger.PublishedLogs?.size(), 'Wrong # of Published Logs');
    }

    @IsTest 
    static void shouldDoNothingIfNotEnabled() {
        insert new Log_Setting__c(
            Enabled__c = false,
            SetupOwnerId = UserInfo.getUserId()
        );
        Logger.log('This is a test'); 

        Test.startTest();
        InvocableLogPublisher.invoke(); 
        Test.stopTest();

        System.assertEquals(0, Logger.PublishedLogs?.size(), 'Wrong # of Published Logs');
    }

    @TestSetup 
    static void setup() {
        // Create an org-wide default Log_Setting__c
        insert new Log_Setting__c(
            Enabled__c = true,
            Level__c = LoggingLevel.FINEST.name(),
            SetupOwnerId = UserInfo.getOrganizationId()
        );
    }
}
