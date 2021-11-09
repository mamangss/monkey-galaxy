package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import LevelEnemy;
	
	public class Level extends MovieClip {
			
		private var _root:Object;
		
		public var time:Array = [];
		public var enemy:Array = [];
		
		public var enemyTimer:int = 0;
		public var frame:int = 0;
		public var pointer:int = 0;
		
		public var xpGained:int = 0;
		public var bg:Object;
		
		public function Level() {
			
			addEventListener(Event.ADDED, beginClass);
		}
		private function beginClass(event:Event):void {
			
			_root = MovieClip(root);
		}
		public function loadEnemies():void {
			
			// Display Last wave
			_root.lastWave.visible = ((pointer >= time.length-3 && pointer < time.length-2) || (time.length <= 2 && pointer == 0))? true : false;
			
			
			// Check if the next time/frame is equivalent to current frame, then move pointer
			if (pointer == time.length-1 && time[pointer] < frame){
				pointer--;
			}
			
			if (time[pointer+1] < frame) {
	
				pointer++;
				
				if (enemy[pointer] == null) {
					
					if (_root.enemyContainer.numChildren == 0) {
						
						// stop
						this.visible = false;
						_root.success = true;
						_root.gotoAndStop('gameOver');
						return;
					}
				}
				else {
					enemyTimer = enemy[pointer].conf.enemyCD;
				}
			}
			
			// Adding Enemy
			if (pointer == time.length-1 || enemyTimer < enemy[pointer].conf.enemyCD) {
				enemyTimer++;
			}
			else {
				
				var newEnemy:Object = getEnemy(enemy[pointer].conf.enemyNo);
				
				newEnemy.y = newEnemy.height/2 + _root.margin.TOP;
				newEnemy.x = int(Math.random() * (_root.stage.stageWidth - newEnemy.width));
				newEnemy.setConf(enemy[pointer].conf);
				
				_root.enemyContainer.addChild(newEnemy);
				
				enemyTimer = 0;
			}
			
			frame++;
		}
		public function getEnemy(enemyNo:int):Object {
			
			if (enemyNo == 1) {
				return new Enemy1();
			}
			else if (enemyNo == 2) {
				return new Enemy2();
			}
			else if (enemyNo == 3) {
				return new Enemy3();
			}
			else if (enemyNo == 4) {
				return new Enemy4();
			}
			
			return new Enemy1();
		}
		public function setBG(num:int):void {
			
			switch(num) {
				case 1: this.bg = new BG1(); break;
				case 2: this.bg = new BG2(); break;
				case 3: this.bg = new BG3(); break;
				case 4: this.bg = new BG4(); break;
				
				default: this.bg = new BG1(); break;
			}
		}
		public function loadBG():void {
			_root.addChild(this.bg);
			_root.setChildIndex(this.bg, 0);
		}
		public function reset():void {
			this.frame = 0;
			this.pointer = 0;
			this.enemyTimer = 0;
		}
	}
	
}
