({
	myAction : function(component, event, helper) {
        
        var Caselist = component.get("c.getRelatedList");
        Caselist.setParams
        ({
            recordId: component.get("v.recordId")
        });
        
        Caselist.setCallback(this, function(data) 
                           {
                               component.set("v.CasesList", data.getReturnValue());
                           });
        $A.enqueueAction(Caselist);
        }
})