package  {
	
	
	public class Levels {
			
		private var levels:Array = [];
		
		public function Levels() {

		}
		public function load():Array {
			
			loadLevel1();
			loadLevel2();
			loadLevel3();
			loadLevel4();
			loadLevel5();
			loadLevel6();
			loadLevel7();
			loadLevel8();
			loadLevel9();
			loadLevel10();
			loadLevel11();
			loadLevel12();
			
			return levels;
		}
		private function convertToFrames(time:Array):Array {
			
			// Multiply time all by 30 to convert in frames
			for(var i = 0; i < time.length; i++) {
				time[i] *= 30;
			}
			return(time);
		}
		
		private function loadLevelTest():void {
			
			var level = new Level();
			level.setBG(1);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 60, 'life':100, 'bulletDamage':0, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(2);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 60, 'life':100, 'bulletDamage':0, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(4);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':4, 'enemyCD': 60, 'life':100, 'bulletDamage':0, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 15, 'speed': 5,
				 'teleportTime': 60, 'nullBodyDamage': true} 
			));
			level.time.push(10);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel1():void {
			
			var level = new Level();
			level.setBG(1);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 60, 'life':1, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(15);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 45, 'life':1, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(20);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 30, 'life':1, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(30);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel2():void {
			
			var level = new Level();
			level.setBG(1);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 60, 'life':2, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(5);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 45, 'life':1, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(15);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 45, 'life':1, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 24, 'speed': 6} 
			));
			level.time.push(25);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 45, 'life':2, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 24, 'speed': 6} 
			));
			level.time.push(40);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel3():void {
			
			var level = new Level();
			level.setBG(1);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 45, 'life':2, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(15);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 30, 'life':2, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(20);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 60, 'life':3, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(30);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 30, 'life':2, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 24, 'speed': 6} 
			));
			level.time.push(45);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 30, 'life':2, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 24, 'speed': 6} 
			));
			level.time.push(55);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'boss': true, 'enemyCD':35 , 'life':50, 'bulletDamage':0, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 10, 'speed': 5,
				 'scaleX': 2, 'scaleY': 2} 
			));
			level.time.push(56);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel4():void {
			
			var level = new Level();
			level.setBG(2);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 45, 'life':3, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(10);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 30, 'life':3, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 24, 'speed': 6} 
			));
			level.time.push(30);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 60, 'life':5, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 20, 'speed': 4,
				 'scaleX': 1.15, 'scaleY': 1.15} 
			));
			level.time.push(50);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 30, 'life':1, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 20, 'speed': 4} 
			));
			level.time.push(60);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		
		private function loadLevel5():void {
			
			var level = new Level();
			level.setBG(2);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 30, 'life':1, 'bulletDamage':2, 'bodyDamage':1, 'bulletSpeed': 1, 'bulletCD': 24, 'speed': 5} 
			));
			level.time.push(10);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 30, 'life':5, 'bulletDamage':2, 'bodyDamage':1, 'bulletSpeed': 1, 'bulletCD': 20, 'speed': 5} 
			));
			level.time.push(30);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 60, 'life':5, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 20, 'speed': 4,
				 'scaleX': 1.15, 'scaleY': 1.15} 
			));
			level.time.push(50);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':3, 'enemyCD': 30, 'life':5, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 6,
				 'walkTime': 30, 'stopTime': 90} 
			));
			level.time.push(60);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel6():void {
			
			var level = new Level();
			level.setBG(2);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 50, 'life':1, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 5} 
			));
			level.time.push(10);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':3, 'enemyCD': 60, 'life':5, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 6,
				 'walkTime': 30, 'stopTime': 90} 
			));
			level.time.push(15);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 60, 'life':5, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 20, 'speed': 4,
				 'scaleX': 1.15, 'scaleY': 1.15} 
			));
			level.time.push(30);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 60, 'life':30, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 4, 'bulletCD': 12, 'speed': 12} 
			));
			level.time.push(35);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 30, 'life':5, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 20, 'speed': 4,
				 'scaleX': 1.15, 'scaleY': 1.15} 
			));
			level.time.push(50);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'boss': true, 'enemyCD': 60, 'life':30, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 20, 'bulletCD': 12, 'speed': 12,
				 'scaleX': 2, 'scaleY': 2} 
			));
			level.time.push(51);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		
		private function loadLevel7():void {
			
			var level = new Level();
			level.setBG(3);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':3, 'enemyCD': 15, 'life':20, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 6,
				 'walkTime': 30, 'stopTime': 90} 
			));
			level.time.push(3);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 60, 'life':10, 'bulletDamage':3, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 12, 'speed': 2,
				 'scaleX': 1.15, 'scaleY': 1.15, 'nullBodyDamage': true} 
			));
			level.time.push(10);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		
		private function loadLevel8():void {
			
			var level = new Level();
			level.setBG(3);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':3, 'enemyCD': 15, 'life':20, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 6,
				 'walkTime': 30, 'stopTime': 90} 
			));
			level.time.push(3);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 60, 'life':10, 'bulletDamage':3, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 15, 'speed': 1,
				 'scaleX': 1.15, 'scaleY': 1.15, 'nullBodyDamage': true} 
			));
			level.time.push(10);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel9():void {
			
			var level = new Level();
			level.setBG(3);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':3, 'enemyCD': 20, 'life':200, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 6,
				 'walkTime': 15, 'stopTime': 30, 'scaleX': 2, 'scaleY': 2} 
			));
			level.time.push(1);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':3, 'enemyCD': 60, 'life':5, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 6,
				 'walkTime': 30, 'stopTime': 60, 'scaleX': .5, 'scaleY': .5} 
			));
			level.time.push(30);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		
		
		private function loadLevel10():void {
			
			var level = new Level();
			level.setBG(2);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':4, 'enemyCD': 60, 'life':1, 'bulletDamage':5, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 15, 'speed': 5,
				 'teleportTime': 60, 'nullBodyDamage': true} 
			));
			level.time.push(30);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel11():void {
			
			var level = new Level();
			level.setBG(2);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':4, 'enemyCD': 30, 'life':15, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 8, 'speed': 1,
				 'teleportTime': 30, 'nullBodyDamage': true, 'scaleX': .5, 'scaleY': .5} 
			));
			level.time.push(3);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
		private function loadLevel12():void {
			
			var level = new Level();
			level.setBG(2);
			level.xpGained = 1;
			
			// By seconds
			level.time.push(0);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':1, 'enemyCD': 30, 'life':10, 'bulletDamage':5, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 20, 'speed': 6,
				 'nullBodyDamage': true} 
			));
			level.time.push(10);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':2, 'enemyCD': 30, 'life':10, 'bulletDamage':2, 'bodyDamage':1, 'bulletSpeed': 12, 'bulletCD': 20, 'speed': 4,
				 'nullBodyDamage': true} 
			));
			level.time.push(20);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':3, 'enemyCD': 10, 'life':20, 'bulletDamage':1, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 30, 'speed': 6,
				 'walkTime': 30, 'stopTime': 90} 
			));
			level.time.push(21);
			level.enemy.push(new LevelEnemy(
				{'enemyNo':4, 'enemyCD': 60, 'life':100, 'bulletDamage':2, 'bodyDamage':1, 'bulletSpeed': 8, 'bulletCD': 8, 'speed': 1,
				 'teleportTime': 30, 'nullBodyDamage': true, 'scaleX': 2, 'scaleY': 2} 
			));
			level.time.push(22);
			level.enemy.push(null);
			
			level.time = convertToFrames(level.time);
			levels.push(level);
		}
	}
	
}
