@IsTest 
private class LogUtils_Test {
    @IsTest 
    static void shouldLogErrors() {
        DmlResult result = new MockDmlResult(
            new List<DmlResult.Error>(), 
            false, 
            DmlMock.generateFakeId(Account.SObjectType), 
            Database.SaveResult.class
        );

        Test.startTest();
        LogUtils.logErrors(new List<DmlResult>{result});
        Logger.publish(); 
        Test.stopTest();

        Integer numLogs = (Integer) [SELECT COUNT(Id) FROM Log__c][0].get('expr0');
        System.assertEquals(1, numLogs, 'Wrong # of Pending Logs');
    }

    @IsTest 
    static void shouldNotLogIfNoErrors() {
        DmlResult result = new MockDmlResult(
            new List<DmlResult.Error>(), 
            true, 
            DmlMock.generateFakeId(Account.SObjectType), 
            Database.SaveResult.class
        );

        Test.startTest();
        LogUtils.logErrors(new List<DmlResult>{result});
        Logger.publish();
        Test.stopTest();

        Integer numLogs = (Integer) [SELECT COUNT(Id) FROM Log__c][0].get('expr0');
        System.assertEquals(0, numLogs, 'Wrong # of Pending Logs');
    }

    @TestSetup 
    static void setup() {
        insert new Log_Setting__c(
            Enabled__c = true, 
            Level__c = System.LoggingLevel.FINEST.name(),
            SetupOwnerId = UserInfo.getUserId()
        ); 
    }
}