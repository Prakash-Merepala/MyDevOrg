({
    handleValidation : function(component, event, helper) {
          
        var toggleChangedVal = component.find("vtoggle").get("v.checked");
        
        if (toggleChangedVal == true){
            
            component.set("v.vstatustext",'Validation are ON' );
        }else 
        {
        component.set("v.vstatustext",'Validation are OFF');
        }
    
    },
        
    handleWorkflow : function(component, event, helper) {

        var toggleChangedWrkFlw = component.find("wtoggle").get("v.checked");

        if(toggleChangedWrkFlw == true) {
            
            component.set("v.wstatustext", 'Workflows are ON');
        } else
        {
            component.set("v.wstatustext", 'Workflows are OFF');
        }
        
    }
    
})