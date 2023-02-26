@IsTest
private class InvocableLogPublisher_Test {
    @IsTest 
    static void shouldLog() {
        Logger.log('This is a test'); 

        Test.startTest();
        InvocableLogPublisher.invoke(); 
        Test.stopTest();

        List<Log_Event__e> published = InvocableLogPublisher_Test.getLogEvents();
        System.assertEquals(1, published?.size(), 'Wrong # of Published Logs');
    }

    @IsTest 
    static void shouldDoNothingIfNoLogs() {
        Test.startTest();
        InvocableLogPublisher.invoke(); 
        Test.stopTest();

        List<Log_Event__e> published = InvocableLogPublisher_Test.getLogEvents();
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

        List<Log_Event__e> published = InvocableLogPublisher_Test.getLogEvents();
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

    static List<Log_Event__e> getLogEvents() {
        // Note: Currently, Dml.History.getRecords(SObjectType) returns null if no matching records found
        // A pending issue has been logged to fix this: https://github.com/jasonsiders/apex-starter-pack/issues/56
        // Once resolved, this utility function can be removed and be replaced by directly calling the underlying Dml.History method.
        List<Log_Event__e> events = Dml.Published.getRecords(Log_Event__e.SObjectType);
        return events != null ? events : new List<Log_Event__e>();
    } 
}
