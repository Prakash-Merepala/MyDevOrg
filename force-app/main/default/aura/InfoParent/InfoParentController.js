({
    handleClick: function(component, event, helper) {
        let btnClicked = event.getSource();         // the button
        let btnMessage = btnClicked.get("v.title"); // the button's label
        component.set("v.message", btnMessage);     // update our message
    },
    handlenew: function(component, event, helper) {
    	
        component.set("v.message", " ");
    }
})