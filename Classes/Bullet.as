package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Bullet extends MovieClip {
		
		protected var _root:Object;
		protected var speed:int = 0;
		protected var damage:int = 0;
		protected var upward:Boolean = true;
		protected var container:MovieClip;
		
		// margin before hitting the sides/borders
		private var allowance:int = 0;
		
		public function Bullet() {
			
			addEventListener(Event.ADDED, beginClass);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		private function beginClass(event:Event):void {
			
			_root = MovieClip(root);
			
		}
		protected function enterFrame(event:Event):void {
			
			y -= ((upward)? 1: -1) * speed * Math.cos(rotation * Math.PI/180);
			x += ((upward)? 1: -1) * speed * Math.sin(rotation * Math.PI/180);
			
			if (this.y < 0 + allowance + _root.margin.TOP || 
				this.y > _root.stage.stageHeight - allowance - _root.margin.BOTTOM || 
				this.x < 0 + allowance || 
				this.x > _root.stage.stageWidth - allowance) {
					
				removeEventListener(Event.ENTER_FRAME, enterFrame);
				container.removeChild(this);
			}	
		}
		public function moveToGunPoint(w:int, h:int):void {
			
			y -= ((upward)? 1: -1) * (h/2) * Math.cos(rotation * Math.PI/180);
			x += ((upward)? 1: -1) * (w/2) * Math.sin(rotation * Math.PI/180);
		}
		public function removeListeners():void {
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		
		// setters and getters
		public function getDamage():int {
			return this.damage;
		}

	}
	
}
