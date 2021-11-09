package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Enemy4 extends Enemy {

		private var teleport:Boolean = true;
		private var teleportTime:int = 30;
		private var teleportTimeCounter:int = 0;
		
		public function Enemy4() {
			
			
		}
		protected override function shoot():void {
		
			// Center Bullet
			var newBullet1:Object = new Enemy4Bullet(this.bulletDamage, this.bulletSpeed);
			
			newBullet1.x = this.x;
			newBullet1.y = this.y;
			newBullet1.rotation = this.rotation;
			
			newBullet1.moveToGunPoint(this.width, this.height);
			_root.enemyBulletContainer.addChild(newBullet1);
			
			// Left Bullet
			var newBullet2:Object = new Enemy4Bullet(this.bulletDamage, this.bulletSpeed);
			
			newBullet2.x = this.x;
			newBullet2.y = this.y;
			newBullet2.rotation = this.rotation + 45;
			
			newBullet2.moveToGunPoint(this.width, this.height);
			_root.enemyBulletContainer.addChild(newBullet2);
			
			// Right BUllet
			var newBullet3:Object = new Enemy4Bullet(this.bulletDamage, this.bulletSpeed);
			
			newBullet3.x = this.x;
			newBullet3.y = this.y;
			newBullet3.rotation = this.rotation - 45;
			
			newBullet3.moveToGunPoint(this.width, this.height);
			_root.enemyBulletContainer.addChild(newBullet3);
		}
		
		protected override function move():void {
			
			this.y += speed;
			
			if (teleportTimeCounter < teleportTime) {
				teleportTimeCounter++;
			}
			else {
				teleportTimeCounter = 0;
				teleport = true;
			}
		}
		
		protected override function dodge():Boolean {
			
			if (teleport == true) {
				teleport = false;
				
				this.x = int(Math.random() * (_root.stage.stageWidth - this.width));
				this.y = int(Math.random() * (_root.stage.stageHeight - this.height - _root.margin.TOP - _root.margin.BOTTOM)) + _root.margin.TOP;
				
				return true;
			}
			
			return false;
		}
	}
	
}
