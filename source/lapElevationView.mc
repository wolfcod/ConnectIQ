using Toybox.WatchUi;

class lapElevationView extends WatchUi.SimpleDataField  {

	hidden var elevation;
	hidden var prev_altitude;
	
    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Lap Elevation";
        elevation = 0;
        prev_altitude = 0;
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        if (prev_altitude != 0) {
        	elevation += (info.altitude - prev_altitude);
        	prev_altitude = info.altitude;
        } else {
        	prev_altitude = info.altitude;
        }

        return elevation;
    }
    
    // Get the field layout
    /*function onLayout(dc) {
    	View.setLayout(Rez.Layouts.MainLayout(dc));
    }*/
    
    function onTimerLap() {
    	elevation = 0;
    	prev_altitude = Activity.getActivityInfo().altitude;
    }
    
    /*function onUpdate(dc) {
    	View.findDrawableById("Background").setColor(getBackgroundColor());
    	var value = View.findDrawableById("value");
    	value.setColor(Graphics.COLOR_BLACK);
    	value.setText(elevation.format("%.2f"));
    	View.onUpdate(dc);
    }*/

}