package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Enemy2 extends Enemy {
		
		private var bulletCDs:Array = [2];
		private var bulletCDCounter:int = 0;
		
		//var to move sideways
		protected var moveSideways:Boolean = false;
		protected var yLoc:int = 0;
		protected var direction:int = 1;
		
		public function Enemy2() {
			
			addEventListener(Event.ADDED, setup);
		}
		
		private function setup(event:Event):void {
			
			setMoveSideways();
		}
		
		protected override function shoot():void {
			
			// get the normal bullet Speed and to set of bullet speeds
			if (bulletCDs.length == 1) {
				bulletCDs.push(this.bulletCD);
			}
			
			var newBullet1:Object = new Enemy2Bullet(this.bulletDamage, this.bulletSpeed);
			
			newBullet1.x = this.x-this.width/4;
			newBullet1.y = this.y;
			newBullet1.rotation = this.rotation;
			
			newBullet1.moveToGunPoint(this.width, this.height);
			_root.enemyBulletContainer.addChild(newBullet1);
			
			
			var newBullet2:Object = new Enemy2Bullet(this.bulletDamage, this.bulletSpeed);
			
			newBullet2.x = this.x+this.width/4;
			newBullet2.y = this.y;
			newBullet2.rotation = this.rotation;
			
			newBullet2.moveToGunPoint(this.width, this.height);
			_root.enemyBulletContainer.addChild(newBullet2);
			
			
			// CHange bullet Speed
			bulletCD = bulletCDs[bulletCDCounter];
			
			if (bulletCDCounter < bulletCDs.length) {
				bulletCDCounter++;
			}
			else {
				bulletCDCounter = 0;
			}
		}
		
		public function setMoveSideways() {
			
			this.yLoc = int(Math.random() * ((_root.stage.stageHeight - this.height - _root.margin.TOP - _root.margin.BOTTOM)/2)) + _root.margin.TOP;
			this.moveSideways = true;
			this.direction = (_root.stage.stageWidth - this.x >= _root.stage.stageWidth/2) ? 1 : -1;
		}
		
		protected override function move():void {
			
			if (this.y < this.yLoc) {
				this.y += speed;
			}
			else {
				this.x += (this.direction * speed);
			}
		}
		
		// boss
		protected override function loadBossAdded():void {
			
			var tempConf:Object = {
				'reset': false
			};
			
			this.bossConf = tempConf;
		}
		protected override function borderHitTest(): void {
			
					
			if (this.y >= stage.stageHeight - _root.margin.BOTTOM - this.height/2 ||
				this.x <= 0 ||
				this.x >= stage.stageWidth) {	
				
				if (this.boss == false) {
					this.removeListeners();
					_root.enemyContainer.removeChild(this);
				}
				else {
					
					this.y = this.height/2 + _root.margin.TOP;
					this.x = int(Math.random() * (_root.stage.stageWidth - this.width));
					
					setMoveSideways();
				}
			}	
		}
	}
	
}
