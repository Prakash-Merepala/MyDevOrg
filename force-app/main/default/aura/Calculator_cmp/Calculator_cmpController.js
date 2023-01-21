({
    handleCalculation : function(component, event, helper) {
        var value1 = component.get("v.input1");
        var value2 = component.get("v.input2");
        var mem = component.get("v.members");
        
        var skillMapping = (parseInt(value1)/49.8);
        component.set("v.result", skillMapping);
        
        var skillTraining = (80*15*parseInt(mem));
        component.set("v.result1", skillTraining);
        
        var boardingCharges = (100*15*parseInt(mem));
        component.set("v.result2", boardingCharges);
        
        var rawMaterials = ((parseInt(value1)*11)/100);
        component.set("v.result3", rawMaterials);
        
    },


    handleClear : function(component, event, helper) {
    component.set("v.result", "");
        component.set("v.result1", "");
        component.set("v.result2", "");
        component.set("v.result3", "");
        component.set("v.members", "");
    }
})