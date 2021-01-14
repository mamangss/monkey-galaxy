package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy3Bullet extends Bullet {
		
		public function Enemy3Bullet(damage:int, speed:int) {
			
			this.upward = false;
			this.damage = damage;
			this.speed = speed;
			
			addEventListener(Event.ADDED, beginClass);
		}
		private function beginClass(event:Event):void {
			
			this.container = this._root.enemyBulletContainer;
		}
	}
	
}
