using Toybox.Application;

class lapElevationApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	var elevationView = new lapElevationView();
    	//var distanceView = new lapDistanceView();
    	//var v = new lapView();
        return [ elevationView ];
    }

}