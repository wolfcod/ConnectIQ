using Toybox.WatchUi;
using Toybox.Graphics;

class lapView extends WatchUi.DataField {
	hidden var lapDistance;
	hidden var lapElevation;
	
	function initialize() {
		DataField.initialize();
		lapDistance = 0.0;
		lapElevation = 0.0;
	}

	// Get the field layout	
	function onLayout(dc) {
		View.setLayout(Rez.Layouts.MainLayout(dc));
	}
	
	function compute(info) {
		lapDistance = info.elapsedDistance;
		lapElevation = info.altitude;
	}
	
	function onUpdate(dc) {
		var background = View.findDrawableById("Background");
		if (background != null) {
			background.setColor(getBackgroundColor());
			var value = View.findDrawableById("value");
			value.setColor(Graphics.COLOR_BLACK);
			var s = lapDistance.format("%.2f");
			value.setText(s);
		}
				
		View.onUpdate(dc);
	}
	
}
