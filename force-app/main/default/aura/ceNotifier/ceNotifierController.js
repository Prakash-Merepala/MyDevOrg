({
	fireComponentEvent  : function(component, event, helper) {
		// Get the component event by using the
        // name value from aura:registerEvent
        var cmpEvent = component.getEvent("cmpEvent");
        
        var inputYear = component.find("Input1").get("v.value");
        var yearVal = parseInt(inputYear);
        cmpEvent.setParams({
            "message" : "A component event fired me. " +
            "It all happened so fast. Now, I'm here!" })
        cmpEvent.setParams({
            "passYear": yearVal })
        cmpEvent.fire();
	}
})