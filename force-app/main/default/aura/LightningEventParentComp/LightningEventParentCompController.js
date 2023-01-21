({
	
    
    sendValue : function(component, event, helper) {
        var myEvent = component.getEvent('passvalue');
        
        myEvent.setParams({"message" : "A component event fired me. "}); 
        myEvent.fire();
    }
})