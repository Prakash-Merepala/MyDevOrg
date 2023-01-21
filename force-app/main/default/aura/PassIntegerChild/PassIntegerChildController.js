({
	handleClick : function(component, event, helper) {
        
        
        
        var inputEvent = component.getEvent("PassIntegerEvent");
        
        inputEvent.setParams({"birthYear": component.get("v.output")});
        inputEvent.fire();
		
	}
})