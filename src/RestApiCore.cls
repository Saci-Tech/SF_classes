public class RestApiCore {

    public class RestApiCoreException extends Exception {}
    public static String exceptionMsg = '';

    public static Map<String, String> requestHeaders = new Map<String, String>();

    public static HttpResponse doRequest(String endpoint, String httpMethod, String jsonBody) {
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();

        if(endpoint == null || String.isEmpty(endpoint)) {
            // raise error
            exceptionMsg = 'No Endpoint was provided. Aborted.\n';
        }
        if(httpMethod == null || String.isEmpty(httpMethod)) {
            // raise error
            exceptionMsg = 'No HTTP Method was provided. Aborted.\n';
        }
        if(exceptionMsg.length() > 0) {
            throw new RestApiCoreException(exceptionMsg);
        }
        if(requestHeaders.keySet().size() > 0) {
            for(String s : requestHeaders.keySet()) {
                req.setHeader(s, requestHeaders.get(s));
            }
        }
        if(jsonBody != null || !String.isEmpty(jsonBody)) {
            req.setBody(jsonBody);
        }

        // here the magic starts
        req.setEndpoint(endpoint);
        req.setMethod(httpMethod);
        res = http.send(req);

        return res;
    }
}