using Toybox.WatchUi;

class lapElevationView extends WatchUi.SimpleDataField  {

	hidden var elevation;
	hidden var prev_altitude;
	hidden var record;
	
    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        //label = "Lap Elevation"; //Rez.Strings.FieldName;
        label = "Lap Elevation";
        elevation = 0;
        prev_altitude = 0;
        record = false;
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        if (record == true) {
	        if (prev_altitude != 0) {
	        	elevation += (info.altitude - prev_altitude);
	        	prev_altitude = info.altitude;
	        } else {
	        	prev_altitude = info.altitude;
	        }
		}
		
		if (elevation < 10.0 && elevation > -10.0) {
        	return elevation.format("%.2f");
        } else if (elevation >= 100 && elevation > -100) {
        	return elevation.toNumber();
        } 
        
        return elevation.format("%.1f");
    }
    
    // Get the field layout
    /*function onLayout(dc) {
    	View.setLayout(Rez.Layouts.MainLayout(dc));
    }*/
    
    /* A lap event occurred */
    function onTimerLap() {
    	elevation = 0;
    	prev_altitude = Activity.getActivityInfo().altitude;
    }
    
    /** the activity is on pause! */
    function onTimerPause() {
    	record = false;
    }
    
    /** The current activity has ended. */
    function onTimerReset() {
    	record = false;
    	prev_altitude = 0;
    	elevation = 0;
    }
    
    /** The activity time has resumed. */
    function onTimerResume() {
    	record = true;
    }
    
    /** The activity timer has started. */
    function onTimerStart() {
    	record = true;
    }
    
    /** The activity timer has stopped. */
    function onTimerStop() {
    	record = false;
    }
    
    /*function onUpdate(dc) {
    	View.findDrawableById("Background").setColor(getBackgroundColor());
    	var value = View.findDrawableById("value");
    	value.setColor(Graphics.COLOR_BLACK);
    	value.setText(elevation.format("%.2f"));
    	View.onUpdate(dc);
    }*/

}