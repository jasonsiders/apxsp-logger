global abstract class InvocableLogPublisher {
    @InvocableMethod(category='Logging' label='Publish Logs')
    global static void invoke() {
        Logger.publish();
    }
}
