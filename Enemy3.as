package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	

	public class Enemy3 extends Enemy {
		
		// var for move and stop
		private var walkAndStopTime:Array = [];
		private var timeCounter:int = 0;
		private var actionCounter:int = 0;

		public function Enemy3() {
			addEventListener(Event.ADDED, setup);
		}
		
		private function setup(event:Event):void {
			
			setMoveAndStop(1, 2);
		}
		
		
		protected override function shoot():void {
			
		}
		
		private function setMoveAndStop(walkTimeInSeconds:int, stopTimeInSeconds:int):void {
			
			this.walkAndStopTime.push(walkTimeInSeconds * 30);
			this.walkAndStopTime.push(stopTimeInSeconds * 30);
		}
		
		protected override function move():void {
			
			if (this.timeCounter < this.walkAndStopTime[actionCounter]) {
				this.timeCounter++;
			}
			else {
				this.actionCounter = (actionCounter == 0) ? 1 : 0;
				this.timeCounter = 0;
			}
			
			if (actionCounter == 0) { // Stop
				
				y += speed * Math.cos(rotation * Math.PI/180);
				x -= speed * Math.sin(rotation * Math.PI/180);
			}
		}
		
		protected override function additionalSetConf(conf:Object):void {				
			
			this.walkAndStopTime = [conf.walkTime, conf.stopTime];
		}
		
		protected override function mcHitTest():void {
			
			if (hitTestObject(_root.mc)) {
				_root.mc.hit(this.bodyDamage);
			}
		}
	}
	
}
