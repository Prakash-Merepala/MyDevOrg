({
	handleComponentEvent : function(component, event) {
        var nyear = event.getParam("Pass_Year");
        component.set("v.input", nyear);
        
    }
})