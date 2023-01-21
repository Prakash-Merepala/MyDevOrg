public class FirstAPICallout {
    
    public static Decimal currenyConverter(){
    decimal inr;
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    
        req.setMethod('GET');
    	req.setEndpoint('https://body-mass-index-bmi-calculator.p.rapidapi.com/metric?weight=1000&height=1.83');
        req.setHeader('x-rapidapi-host', 'body-mass-index-bmi-calculator.p.rapidapi.com');
        req.setHeader('x-rapidapi-key', '89a1b0ddafmshd33beb53886495ep1c4325jsn1dc7b378361a');
        
        HTTPResponse response = h.send(req);
        
        Map<String,Object> jsonResponse = (Map<String,Object>)json.deserializeUntyped(response.getBody());
        System.debug('JSON Response:' +jsonResponse);
        
       	Decimal bmi = (Decimal)jsonResponse.get('bmi');
        
        return bmi;

    }
}