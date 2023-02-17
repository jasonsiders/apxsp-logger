public without sharing class LogEventHandler extends apxsp.TriggerHandler {
	@TestVisible
	List<Log_Event__e> triggerNew = (Trigger.isExecuting) ? (List<Log_Event__e>) Trigger.new : new List<Log_Event__e>();

	public override void afterInsert() {
		new LogGenerator(this.triggerNew)?.createLogRecords();
	}

	public override Type getType() {
		return LogEventHandler.class;
	}
}
