using Toybox.WatchUi;
using Toybox.ActivityMonitor;

class lapDistanceView extends WatchUi.SimpleDataField  {

	hidden var previous;
		
    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Lap Distance";
        previous = 0;
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        if (info != null && info.elapsedDistance != null) {
        	return info.elapsedDistance - previous;
		}
        
        return 0;
    }
    
    // Get the field layout
    /*function onLayout(dc) {
    	View.setLayout(Rez.Layouts.MainLayout(dc));
    }*/
    
    function onTimerLap() {
   		previous = Activity.getInfo().elapsedDistance;
    }
    
    /*function onUpdate(dc) {
    	View.findDrawableById("Background").setColor(getBackgroundColor());
    	var value = View.findDrawableById("value");
    	value.setColor(Graphics.COLOR_BLACK);
    	value.setText(elevation.format("%.2f"));
    	View.onUpdate(dc);
    }*/

}