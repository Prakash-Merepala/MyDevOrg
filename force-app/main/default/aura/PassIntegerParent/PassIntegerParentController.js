({
	handleEvent : function(component, event, helper) {

        var eventValue = event.getParam("birthYear");
        console.log("current text: " + eventValue);
        component.set("v.appValue", eventValue);
        
        var yearVal = parseInt(component.get("v.input"));
        component.set("v.input" , yearVal);
	}
})