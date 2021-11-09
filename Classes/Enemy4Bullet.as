package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy4Bullet extends Bullet {
		
		public function Enemy4Bullet(damage:int, speed:int) {
			
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
