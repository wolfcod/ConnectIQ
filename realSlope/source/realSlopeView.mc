using Toybox.WatchUi;

class realSlopeView extends WatchUi.SimpleDataField {

	hidden var prev_slope;
	hidden var prev_altitude;
	hidden var prev_distance;
	
    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Slope %";
        prev_altitude = 0.0;
        prev_slope = 0.0;
        prev_distance = 0.0;
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        //System.println("elapsed distance = " + info.elapsedDistance);
        //System.println("quota = " + info.altitude);
        
        if (info.elapsedDistance != null && info.altitude != null) {
	        if (prev_altitude == 0) {
	        	prev_altitude = info.altitude;
	        }
	        
	        if (prev_distance == 0) {
	        	prev_distance = info.elapsedDistance;
	        }
	        
	        if (info.elapsedDistance == 0.0) {
	        	prev_slope = 0.0;
	        	return prev_slope;
	        }
        
        	var slope = info.altitude - prev_altitude;
        	var distance = info.elapsedDistance - prev_distance;
        
        	if (distance != 0) {
	        	prev_altitude = info.altitude;
	        	prev_distance = info.elapsedDistance;
	        	
	        	System.println("slope " + slope);
	        	System.println("distance " + distance);
	        	
	        	prev_slope = (slope / distance) * 100.0;
	        }
        }
        
        return prev_slope;          
       
    }

}