package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class MonkieBullet extends Bullet {
		
		public function MonkieBullet() {
			
			this.upward = true;
			this.damage = 1;
			this.speed = 25;
			
			addEventListener(Event.ADDED, beginClass);
		}
		private function beginClass(event:Event):void {
			
			this.container = this._root.bulletContainer;
		}
	}
	
}
