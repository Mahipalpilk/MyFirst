public class MockerApiService {

    public static void sendPost() {

        HttpRequest req = new HttpRequest();

        req.setEndpoint('callout:MockerAPI');
        req.setMethod('POST');

        req.setHeader('Content-Type', 'application/json');

        // 🔹 Simulate OAuth Bearer token
        req.setHeader('Authorization', 'Bearer mock_access_token_123');

        req.setBody('{"data":"test"}');

        Http http = new Http();
        HttpResponse res = http.send(req);

        System.debug('Response: ' + res.getBody());


    }
}