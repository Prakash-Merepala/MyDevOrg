({
	handleClick : function(component, event, helper) {
		var updateEvent = component.getEvent("fireYear");
        var yearVal = component.get("v.birthYear");
        updateEvent.setParams({"DOByear" : yearVal});
        updateEvent.fire();
	}
})