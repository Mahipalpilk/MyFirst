public with sharing class MockerCalloutService {
        public static void sendPatchRequest() {

        HttpRequest req = new HttpRequest();

        req.setEndpoint('callout:Mocker_HTTP');
        req.setMethod('PATCH');

        req.setHeader('Content-Type', 'application/json');

        Map<String, Object> payload = new Map<String, Object>{
            'name' => 'Mahipal',
            'role' => 'Salesforce Developer'
        };

        req.setBody(JSON.serialize(payload));

        Http http = new Http();
        HttpResponse res = http.send(req);

        System.debug('Status Code: ' + res.getStatusCode());
        System.debug('Response Body: ' + res.getBody());
    }
}