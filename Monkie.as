package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Monkie extends MovieClip {
		
		
		private var _root:Object;
		
		// Set speed
		public var mainSpeed:int = 10;
		public var rotationSpeed:int = 10;
		
		//Set Bullet
		private var bulletSpeedTimer:int = 0;
		private var bulletSpeed:int = 12; // 12, 9, 6, 3, 2, 1
		
		private var bulletDamage:int = 1;
		private var bodyDamage:int = 1;
		
		// 
		private var life:int = 10;
		private var maxHP:int = 10;
		private var mp:int = 10;
		private var maxMP:int = 10;
		
		// Regen MP
		private var regenMP:int = 1;
		private var regenMPTime:int = 75;
		private var regenMPTimer:int = 0;

	
		
		// SKill
		private var skill:Object = {
			'SKILL1': {'CD': 5, 'MPCOST': 5, 'CDTIMER': 0, 'TIMER': 0, 'DISTANCE': 150},
			'SKILL2': {'CD': 10, 'MPCOST': 10, 'CDTIMER': 0, 'TIMER': 0, 'DURATION': 120, 'DURATION_TIMER': 0, 'ON': false},
			'SKILL3': {'CD': 5, 'MPCOST': 5, 'CDTIMER': 0, 'TIMER': 0, 'HEAL': 5}
		};
		
		// states
		private var defaultState:Object = {
			'DEFAULT': 'default',
			'TAKEN_DAMAGE': 'takenDamageEffect',
			'SHIELDED_DEFAULT': 'shieldedDefault',
			'SHIELDED_TAKEN_DAMAGE': 'shieldedTakenDamageEffect'
		}
		private var state:Object = {
			'DEFAULT': defaultState.DEFAULT,
			'TAKEN_DAMAGE': defaultState.TAKEN_DAMAGE
		}
		
		
		// util
		private var takeDamageEffectCounter:int = 0;
		
		public function Monkie(stat:Object) {
			
			this.life = stat.HP;
			this.maxHP = stat.HP;
			this.mp = stat.MP;
			this.maxMP = stat.MP;
			this.bulletDamage = stat.DAMAGE;
			this.bulletSpeed = stat.ATKSPEED;
			
			addEventListener(Event.ADDED, beginClass);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		private function beginClass(event:Event):void {
			
			_root = MovieClip(root);
		}
		private function enterFrame(event:Event):void {
			
			// Bullet Timer
			if (this.bulletSpeedTimer < this.bulletSpeed) {
				this.bulletSpeedTimer ++;
			}
			else {
				shoot();
				this.bulletSpeedTimer = 0;
			}
			
			// Bullet Hit Test
			for (var i:int = 0; i < _root.enemyBulletContainer.numChildren; i++) {
				
				var bulletTarget:MovieClip = MovieClip(_root.enemyBulletContainer.getChildAt(i));
				
				if (hitTestObject(bulletTarget)) {
					
					// Remove bullet
					_root.enemyBulletContainer.removeChild(bulletTarget);
					bulletTarget.removeListeners();
					
					
					hit(bulletTarget.getDamage());
				}
			}
			
			// Skill CD
			if (skill.SKILL1.TIMER < 30) {
				skill.SKILL1.TIMER++;
			}
			else if (skill.SKILL1.CDTIMER > 0) {
				skill.SKILL1.CDTIMER--;
				skill.SKILL1.TIMER = 0;
				_root.skill1CDView.gotoAndStop((skill.SKILL1.CDTIMER / skill.SKILL1.CD) * 100);
			}
			
			if (skill.SKILL2.TIMER < 30) {
				skill.SKILL2.TIMER++;
			}
			else if (skill.SKILL2.CDTIMER > 0) {
				skill.SKILL2.CDTIMER--;
				skill.SKILL2.TIMER = 0;
				_root.skill2CDView.gotoAndStop((skill.SKILL2.CDTIMER / skill.SKILL2.CD) * 100);
			}
			
			if (skill.SKILL2.ON) {
				
				if (skill.SKILL2.DURATION_TIMER < skill.SKILL2.DURATION) {
					skill.SKILL2.DURATION_TIMER++;
				}
				else {
					skill.SKILL2.ON = false;
					skill.SKILL2.DURATION_TIMER = 0;
					
					state.DEFAULT = defaultState.DEFAULT;
					state.TAKEN_DAMAGE = defaultState.TAKEN_DAMAGE;
					this.gotoAndStop(state.DEFAULT);
				}
			}
			
			if (skill.SKILL3.TIMER < 30) {
				skill.SKILL3.TIMER++;
			}
			else if (skill.SKILL3.CDTIMER > 0) {
				skill.SKILL3.CDTIMER--;
				skill.SKILL3.TIMER = 0;
				_root.skill3CDView.gotoAndStop((skill.SKILL3.CDTIMER / skill.SKILL3.CD) * 100);
			}
			
			
			// Regen MP
			if (this.mp < this.maxMP) {
				
				if (regenMPTimer < regenMPTime) {
					regenMPTimer ++;
				}
				else {
					
					regenMPTimer = 0;
					this.mp = (this.mp + this.regenMP > this.maxMP) ? this.maxMP : (mp + regenMP);
					_root.showMPBar();
				}
			}
		}
		public function shoot():void {
		
			var newBullet:MonkieBullet = new MonkieBullet();
			
			newBullet.x = this.x;
			newBullet.y = this.y;
			newBullet.rotation = this.rotation;
			
			newBullet.moveToGunPoint(this.width, this.height);
			_root.bulletContainer.addChild(newBullet);
		}
		public function hit(damage:int):void {
			
			if (skill.SKILL2.ON) {
				return;
			}
			
			this.life -= damage;
			_root.showHPBar();
					
			
			if (this.life <= 0) {
				this.visible = false;
				_root.success = false;
				_root.gotoAndStop('gameOver');
			}
			else {
				takeDamageEffectCounter = 0;
				takeDamageEffect();
			}
		}
		public function removeListeners():void {
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		public function die():void {
			this.removeListeners();
			_root.removeChild(this);
		}
		
		public function takeDamageEffect():void {
			
			this.gotoAndStop(state.TAKEN_DAMAGE);
			addEventListener(Event.ENTER_FRAME, blink);
		}
		public function blink(event:Event):void {
			
			if (takeDamageEffectCounter < 2) {
				takeDamageEffectCounter++;
			}
			else {
				takeDamageEffectCounter = 0;
				this.gotoAndStop(state.DEFAULT);
				this.removeEventListener(Event.ENTER_FRAME, blink);
			}
		}
		
		// skills
		public function doSkill1() {
			
			if (skill.SKILL1.CDTIMER == 0 && skill.SKILL1.MPCOST <= this.mp) {
				
				y -= skill.SKILL1.DISTANCE * Math.cos(rotation * Math.PI/180);
				x += skill.SKILL1.DISTANCE * Math.sin(rotation * Math.PI/180);
				
				this.mp -= skill.SKILL1.MPCOST;
				_root.showMPBar();
				
				skill.SKILL1.CDTIMER = skill.SKILL1.CD;
				skill.SKILL1.TIMER = 0;
				_root.skill1CDView.gotoAndStop((skill.SKILL1.CDTIMER / skill.SKILL1.CD) * 100);
			}
		}
		public function doSkill2() {
			
			if (skill.SKILL2.CDTIMER == 0 && skill.SKILL2.MPCOST <= this.mp) {
				
				state.DEFAULT = defaultState.SHIELDED_DEFAULT;
				state.TAKEN_DAMAGE = defaultState.SHIELDED_TAKEN_DAMAGE;
				this.gotoAndStop(state.DEFAULT);
				
				skill.SKILL2.ON = true;
				
				this.mp -= skill.SKILL2.MPCOST;
				_root.showMPBar();
				
				skill.SKILL2.CDTIMER = skill.SKILL2.CD;
				skill.SKILL2.TIMER = 0;
				_root.skill2CDView.gotoAndStop((skill.SKILL2.CDTIMER / skill.SKILL2.CD) * 100);
			}
		}
		public function doSkill3() {
			
			if (skill.SKILL3.CDTIMER == 0 && skill.SKILL3.MPCOST <= this.mp) {
				
				this.life += skill.SKILL3.HEAL;
				this.life = (this.life > this.maxHP) ? this.maxHP : this.life;
				_root.showHPBar();
				
				this.mp -= skill.SKILL3.MPCOST;
				_root.showMPBar();
				
				skill.SKILL3.CDTIMER = skill.SKILL3.CD;
				skill.SKILL3.TIMER = 0;
				_root.skill1CDView.gotoAndStop((skill.SKILL3.CDTIMER / skill.SKILL3.CD) * 100);
			}
		}
		
		// setters and getters
		public function getLife():int {
			return this.life;
		}
		
		public function getMaxHP():int {
			return this.maxHP;
		}
		
		public function getMP():int {
			return this.mp;
		}
		
		public function getMaxMP():int {
			return this.maxMP;
		}
		
		public function getBodyDamage():int {
			return this.bodyDamage;
		}
	}
	
}
