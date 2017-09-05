
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.RunnerActivity;
import com.yoyogames.runner.RunnerJNILib;

import android.util.Log;
import android.os.Handler;

import com.bda.controller.Controller;
import com.bda.controller.ControllerListener;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothAdapter;
import android.content.IntentFilter;

import ${YYAndroidPackageName}.Gamepad;

public class MogaExtensionAndroid extends RunnerSocial implements com.bda.controller.ControllerListener 
{

	public static Controller MogaController = null;

	@Override
	public void Init()
	{
	
		Log.i("yoyo", "MOGA extension initialising" );
	
		MogaController = Controller.getInstance(RunnerJNILib.ms_context);
        MogaController.init();
        MogaController.setListener( this, new Handler() );
		
		
	}
	@Override
    public void onDestroy() 
	{
		if (MogaController != null) {
			MogaController.exit();
        } // end if
	}
	@Override
    public void onPause() 
	{		
		if (MogaController != null) 
		{
			MogaController.onPause();
        } // end if
	}
	
	@Override
    public void onResume() {

	  if (MogaController != null) {
			MogaController.onResume();
        } // end if
	}
	
	public int MogaVersion()
	{
		switch(MogaController.getState( com.bda.controller.Controller.STATE_CURRENT_PRODUCT_VERSION )) {
		case com.bda.controller.Controller.ACTION_VERSION_MOGA:
			Log.d("yoyo", "Found Moga gamepad!!!");
			return 1;
		
		case com.bda.controller.Controller.ACTION_VERSION_MOGAPRO:
			Log.d("yoyo", "Found Moga pro gamepad!!!");
			return 2;
		
		} // end switch
		
		return 0;
	}
	
	static public void handleKeyEvent(com.bda.controller.KeyEvent ev)
	{
		// check for a Moga device connected and use that one
		Log.i("yoyo", "MOGA KEYEVENT: keyCode=" + ev.getKeyCode() + " action=" +ev.getAction() );
		
		if (Gamepad.msMogaDevice == null) {
			Gamepad.addMogaDevice(null);
		} // end if
		
		if (Gamepad.msMogaDevice != null) {
			Gamepad.msMogaDevice.onButtonUpdate( ev.getKeyCode(), ev.getAction() == com.bda.controller.KeyEvent.ACTION_DOWN );
		} // end if

	} 
	
	static public void handleMotionEvent(com.bda.controller.MotionEvent ev)
	{
		// check for a Moga device connected and use that one
		Log.i("yoyo", "MOGA MOTIONEVENT: " + ev.toString() );
		
		if (Gamepad.msMogaDevice == null) {
			Gamepad.addMogaDevice(null);
		} // end if
		
		if (Gamepad.msMogaDevice != null) {
			Gamepad.msMogaDevice.onAxisUpdate(com.bda.controller.MotionEvent.AXIS_X, ev.getAxisValue(com.bda.controller.MotionEvent.AXIS_X), 2, -1, 1 );
			Gamepad.msMogaDevice.onAxisUpdate(com.bda.controller.MotionEvent.AXIS_Y, ev.getAxisValue(com.bda.controller.MotionEvent.AXIS_Y), 2, -1, 1 );
			Gamepad.msMogaDevice.onAxisUpdate(com.bda.controller.MotionEvent.AXIS_Z, ev.getAxisValue(com.bda.controller.MotionEvent.AXIS_Z), 2, -1, 1 );
			Gamepad.msMogaDevice.onAxisUpdate(com.bda.controller.MotionEvent.AXIS_RZ, ev.getAxisValue(com.bda.controller.MotionEvent.AXIS_RZ), 2, -1, 1 );
			Gamepad.msMogaDevice.onAxisUpdate(com.bda.controller.MotionEvent.AXIS_LTRIGGER, ev.getAxisValue(com.bda.controller.MotionEvent.AXIS_LTRIGGER), 1, 0, 1 );
			Gamepad.msMogaDevice.onAxisUpdate(com.bda.controller.MotionEvent.AXIS_RTRIGGER, ev.getAxisValue(com.bda.controller.MotionEvent.AXIS_RTRIGGER), 1, 0, 1 );
		} // end if
	} 
	
	//------------------------------------------------------------------------------------------------	
	// handle the Moga Controllers
	//------------------------------------------------------------------------------------------------	
	static public void handleStateEvent( com.bda.controller.StateEvent ev)
	{
	} // end handleStateEvent
  // ------------------------------------------------------------------------------------
    // Implementing Moga library ControllerListener
    // ------------------------------------------------------------------------------------
	public void onStateEvent(com.bda.controller.StateEvent _event )
	{
		handleStateEvent( _event );
	} // end onStateEvent
	
	public void onKeyEvent( com.bda.controller.KeyEvent _event )
	{
		handleKeyEvent( _event );
	} // end onKeyEvent
   
	public void onMotionEvent( com.bda.controller.MotionEvent _event )
	{
		handleMotionEvent( _event );
	} // end onMotionEvent
   
    // ------------------------------------------------------------------------------------
    // finish Implementing Moga library ControllerListener
    // ------------------------------------------------------------------------------------



}