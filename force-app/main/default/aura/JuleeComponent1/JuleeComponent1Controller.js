({
	handleEvent : function(component, event, helper) {
		var inputYear = component.get("v.output");
        var cmpevent = component.getEvent("v.fireYear");
        
        component.set("v.opYear" , cmpevent);
	}
})