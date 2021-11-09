package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Enemy1 extends Enemy {
		
		
		public function Enemy1() {
			
		}
		protected override function shoot():void {
		
			var newBullet:Object = new Enemy1Bullet(this.bulletDamage, this.bulletSpeed);
			
			newBullet.x = this.x;
			newBullet.y = this.y;
			newBullet.rotation = this.rotation;
			
			newBullet.moveToGunPoint(this.width, this.height);
			_root.enemyBulletContainer.addChild(newBullet);
		}
		
		// boss
		protected override function loadBossAdded():void {
			
			var tempConf:Object = {
				'yLoc': (this.height/2 + _root.margin.TOP + 90)
			};
			
			this.bossConf = tempConf;
			
			
			this.x = _root.stage.stageWidth/2;
			this.y = this.height/2 + _root.margin.TOP;
			
		}
		
		
		
		protected override function move():void {
			
			if (this.boss == true) {
				
				if (this.y < bossConf.yLoc) {
					
					this.y += speed;
				}
			}
			else {
				this.y += speed;	
			}
		}
	}
	
}
