global abstract class LogUtils {
    global static void logErrors(List<DmlResult> dmlResults) {
        // Iterate through a list of DmlResults and log any errors
        for (DmlResult result : dmlResults) {
            if (result?.isSuccess() == false) {
                List<DmlResult.Error> errors = result?.getErrors(); 
                Logger.error(JSON.serializePretty(errors));
            }
        }
    }
}