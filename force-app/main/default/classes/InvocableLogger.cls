global abstract class InvocableLogger {
    @InvocableMethod(category='Logging' configurationEditor='apxsp-logger-cpe' label='Post to Log')
	global static void invoke(List<Logger.LogInput> logInputs) {
		// Exposes the logger to Flows
		// Note: This flow action does not publish logs
		// To do this, flow developers must call the `InvocableLogPublisher.invoke()` action separately
		// This is done to give flow developers the same flexibility as in Apex
		Logger.log(logInputs);
	}
}