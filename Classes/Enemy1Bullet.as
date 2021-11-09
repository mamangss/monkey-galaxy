package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Enemy1Bullet extends Bullet {
		
		public function Enemy1Bullet(damage:int, speed:int) {
			
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
