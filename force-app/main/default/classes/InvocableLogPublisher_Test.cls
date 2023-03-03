@IsTest
private class InvocableLogPublisher_Test {
    @IsTest 
    static void shouldLog() {
        Logger.log('This is a test'); 

        Test.startTest();
        InvocableLogPublisher.invoke(); 
        Test.stopTest();

        List<Log_Event__e> published = Dml.Published.getRecords(Log_Event__e.SObjectType);
        System.assertEquals(1, published?.size(), 'Wrong # of Published Logs');
    }

    @IsTest 
    static void shouldDoNothingIfNoLogs() {
        Test.startTest();
        InvocableLogPublisher.invoke(); 
        Test.stopTest();

        List<Log_Event__e> published = Dml.Published.getRecords(Log_Event__e.SObjectType);
        System.assertEquals(0, published?.size(), 'Wrong # of Published Logs');
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

        List<Log_Event__e> published = Dml.Published.getRecords(Log_Event__e.SObjectType);
        System.assertEquals(0, published?.size(), 'Wrong # of Published Logs');
    }

    // **** HELPER **** //
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
