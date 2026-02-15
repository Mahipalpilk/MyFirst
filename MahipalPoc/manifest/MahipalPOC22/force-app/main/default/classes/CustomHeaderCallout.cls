public class CustomHeaderCallout {

    public static void sendPatch() {

        HttpRequest req = new HttpRequest();

        req.setEndpoint('callout:Mocker_Custom');
        req.setMethod('PATCH');

        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer 123456');

        req.setBody('{"status":"updated"}');

        Http http = new Http();
        HttpResponse res = http.send(req);

        System.debug(res.getBody());
    }
}