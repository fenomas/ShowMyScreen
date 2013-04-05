package  {
	
	import flash.display.MovieClip;
	import flash.media.*;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	

	public class MyScreen extends MovieClip {
		
		var cam:Camera;
		var vid:Video;
		var aspect:Number;
		
		public function MyScreen() {
			// constructor code
			initCamera();
			initLayout();
		}
		
		// master code
		// more master.

		private function initCamera() {
			cam = Camera.getCamera();
			cam.setMode( 640, 480, 30 );
			aspect = cam.width / cam.height;
			vid = new Video();
			addChild( vid );
			vid.attachCamera(cam);
		}
		
		private function initLayout() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			vid.width = stage.stageWidth;
			vid.height = stage.stageHeight;
			stage.addEventListener( Event.RESIZE, onStageResize, false, 0, true );
		}
		
		private function onStageResize( e:Event ) {
			var w:Number = stage.stageWidth;
			var h:Number = stage.stageHeight;
			var wide:Boolean = (w/h) > aspect;
			if (wide) {
				vid.width = h*aspect;
				vid.height = h;
			} else {
				vid.width = w;
				vid.height = w/aspect;
			}
			vid.x = (w-vid.width)/2;
			vid.y = (h-vid.height)/2;
		}
		
	}
	
}
