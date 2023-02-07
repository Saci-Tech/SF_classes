@isTest
public class RestApiCoreTest {
    @isTest
    public static void restApiCoreGetMethod() {
        RestApiCore.requestHeaders = new Map<String, String>{
            'Accept' => 'application/json',
            'Content-Type' => 'application/json'
        };

        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('TestMockData.RestApiCore__get');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');

        Test.setMock(HttpCalloutMock.class, new RestApiCoreMock());
        
        HttpResponse res = RestApiCore.doRequest('/api/testing', 'GET', null);
        System.assertNotEquals(null, res, 'Callout retornou resposta nula');
        System.assertEquals('', RestApiCore.exceptionMsg, 'Mensagem de erro não é vazia.');
    }
}