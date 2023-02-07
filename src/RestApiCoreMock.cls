public class RestApiCoreMock implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest request) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"testId":12345,"testList1":["this","is","a","test"],"testList2":[{"item id 1","flagsList":[true,false,false,false]},{"item id 2","flagsList":[false,true,true,false]}]}');
        res.setStatusCode(200);
        return res;
    }
}