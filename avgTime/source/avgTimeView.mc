using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class avgTimeView extends WatchUi.SimpleDataField {

	hidden var unitMeasure;
	
    // Set the label of the data field here.
    function initialize() {
    	SimpleDataField.initialize();
    	var mySettings = System.getDeviceSettings();
    	
    	if (mySettings.distanceUnits == System.UNIT_METRIC) {
    		label = "Avg Time/km";
    		unitMeasure = 1000.00;
    	} else {
    		label = "Avg Time/mi";
    		unitMeasure = 1609.34;
    	}
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        var seconds = info.elapsedTime / 1000;
        var distance = info.elapsedDistance;
        
        if (distance == 0 || seconds == 0) {
        	return "n/a";
        }
        
        var metersPerSec = distance / seconds;
        
        var timePrevision = unitMeasure / metersPerSec;
        
        System.println("time = " + timePrevision);
        var min = timePrevision.toLong() / 60;
        var sec = timePrevision.toLong() % 60;

		var str = Lang.format("$1$:$2$", 
			[min.format("%02d"), sec.format("%02d")]);
	
		return str;
    }

}