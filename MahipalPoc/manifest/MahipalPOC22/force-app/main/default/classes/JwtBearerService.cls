public class JwtBearerService {

    public static void sendRequest() {

        HttpRequest req = new HttpRequest();

        req.setEndpoint('callout:MockerJWT');
        req.setMethod('POST');

        req.setHeader('Content-Type', 'application/json');

        req.setBody('{"data":"test"}');

        Http http = new Http();
        HttpResponse res = http.send(req);

        System.debug('Status: ' + res.getStatus());
        System.debug('Response: ' + res.getBody());

        
    }
}