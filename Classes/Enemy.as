package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Enemy extends MovieClip {
		
		protected var _root:Object;
		protected var speed:int = 0;
		
		protected var life = 0;
		protected var bodyDamage = 0;
		protected var bulletDamage = 0;
		
		//Set Bullet
		private var bulletCDTimer:int = 0;
		protected var bulletCD:int = 0; // the greater, the slower
		protected var bulletSpeed:int = 0;
		
		// util
		private var takeDamageEffectCounter:int = 0;
		protected var nullBodyDamage:Boolean = false;
		
		// Boss
		protected var boss:Boolean = false;
		protected var bossConf:Object;
		
		public function Enemy() {
			
			addEventListener(Event.ADDED, beginClass);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function beginClass(event:Event):void {
			
			_root = MovieClip(root);
			
			if (boss == true) {
				this.loadBossAdded();
			}
		}
		
		private function enterFrame(event:Event):void {
			
			faceMC();
			move();
			
			borderHitTest();
			
			// Bullet Hit Test
			for (var i:int = 0; i < _root.bulletContainer.numChildren; i++) {
				
				var bulletTarget:MovieClip = _root.bulletContainer.getChildAt(i);
				
				if (hitTestObject(bulletTarget)) {
					
					// Remove bullet
					_root.bulletContainer.removeChild(bulletTarget);
					bulletTarget.removeListeners();
			
					// Score
					this.hit(bulletTarget.getDamage());
				}
			}
			
			// MC Hit Test
			mcHitTest();
			
			// Fire Bullet
			if (this.bulletCDTimer < this.bulletCD) {
				this.bulletCDTimer ++;
			}
			else {
				shoot();
				this.bulletCDTimer = 0;
			}
		}
		protected function move():void {
			this.y += speed;
		}
		protected function borderHitTest(): void {
			
			if (this.y >= stage.stageHeight - _root.margin.BOTTOM - this.height/2 ||
				this.x <= 0 ||
				this.x >= stage.stageWidth) {					
				this.removeListeners();
				_root.enemyContainer.removeChild(this);
			}	
		}
		protected function mcHitTest():void {
			
			if (hitTestObject(_root.mc)) {
				
				if (this.boss == false && this.nullBodyDamage == false) {	
					this.hit(_root.mc.getBodyDamage());
				}
				
				_root.mc.hit(this.bodyDamage);
			}
		}
		
		private function faceMC():void {
			
			this.rotation = (Math.atan2(_root.mc.y - this.y, _root.mc.x - this.x) * (180 / Math.PI)) - 90;
		}
		protected function shoot():void {
		
			var newBullet:Object = new Enemy1Bullet(this.bulletDamage, this.bulletSpeed);
			
			newBullet.x = this.x;
			newBullet.y = this.y;
			newBullet.rotation = this.rotation;
			
			newBullet.moveToGunPoint(this.width, this.height);
			_root.enemyBulletContainer.addChild(newBullet);
		}
		
		public function removeListeners():void {
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		protected function hit(damage:int):void {
		
			// Dodge for teleporter
			if (dodge()) {
				return;
			}
			
			// Take damage
			this.life -= damage;
			
			if (this.life <= 0) {
				_root.kills ++;
				
				this.removeListeners();
				_root.enemyContainer.removeChild(this);
			}
			else {
				takeDamageEffectCounter = 0;
				takeDamageEffect();
			}
		}
		protected function dodge():Boolean {
			return false;
		}
		
		public function takeDamageEffect():void {
			this.gotoAndStop('takeDamageEffect');
			addEventListener(Event.ENTER_FRAME, blink);
		}
		
		public function blink(event:Event):void {
			
			if (takeDamageEffectCounter < 2) {
				takeDamageEffectCounter++;
			}
			else {
				takeDamageEffectCounter = 0;
				this.gotoAndStop('default');
				this.removeEventListener(Event.ENTER_FRAME, blink);
			}
		}
		
		// setter and getter
		public function setBulletDamage(bulletDamage:int):void {
			this.bulletDamage = bulletDamage;
		}
		
		// boss
		public function setConf(conf:Object):void {				
			
			this.life = conf.life;
			this.bulletDamage = conf.bulletDamage;
			this.bodyDamage = conf.bodyDamage;
			this.bulletCD = conf.bulletCD;
			this.bulletSpeed = conf.bulletSpeed;
			this.speed = conf.speed;
			
			this.additionalSetConf(conf);
			
			if (conf.hasOwnProperty('boss')) {
				
				if (conf.boss == true) {
					this.loadBoss(conf);
				}
			}
			
			if (conf.hasOwnProperty('scaleX')) {
				this.scaleX = conf.scaleX;
			}
			if (conf.hasOwnProperty('scaleY')) {
				this.scaleY = conf.scaleY;
			}
			if (conf.hasOwnProperty('nullBodyDamage')) {
				this.nullBodyDamage = conf.nullBodyDamage;
			}
		}
		protected function additionalSetConf(conf:Object):void {
			
		}
		
		protected function loadBoss(conf:Object):void {
	
			this.boss = true;
		}
		protected function loadBossAdded():void {
			
		}
	}
	
}
