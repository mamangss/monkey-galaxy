package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Game extends MovieClip {
		
		private var controls:Object = {
			LEFT:Array,
			UP:Array,
			RIGHT:Array,
			DOWN:Array,
			ROTATECW:Array,
			ROTATECCW:Array
		};
		
		private var pressed:Object = {
			LEFT:false,
			UP:false,
			RIGHT:false,
			DOWN:false,
			ROTATECW:false,
			ROTATECCW:false
		};
		
		private var margin:Object = {
			TOP:0,
			BOTTOM:0
		};
		
		private var _root:Object;
		private var stageWidth:int;
		private var stageHeight:int;
		private var mc:Monkie;
		
		var bulletContainer:MovieClip;
		
		public function Game() {
			
			addEventListener(Event.ADDED, initSetup);
		}
		
		private function initSetup(event:Event):void {
			
			// Set margins
			this.margin.TOP = 111;
			this.margin.BOTTOM = 139;
			
			// Set stage
			this._root = MovieClip(root);
			this.stageWidth = this._root.stage.stageWidth;
			this.stageHeight = this._root.stage.stageHeight;
			
			// Set containers
			this.bulletContainer = new MovieClip();
			addChild(this.bulletContainer);
		}
		
		private function initControls():void {
			
			this.controls.LEFT = [37, 65];		// left, a
			this.controls.UP = [38, 87];		// up, w
			this.controls.RIGHT = [39, 68];		// right, d
			this.controls.DOWN = [40, 83];		// down, s
			this.controls.ROTATECW = [88];		// x
			this.controls.ROTATECCW = [90];		// z
			
			trace('adde move');
			// Control Movements
			mc.addEventListener(Event.ENTER_FRAME, move);
			trace('adde down');
			// Control Button Listeners
			_root.stage.addEventListener(KeyboardEvent.KEY_DOWN, checkKeysDown);
			trace('adde up');
			// Listener for key up
			_root.stage.addEventListener(KeyboardEvent.KEY_UP, checkKeysUp);
		}
		
		public function start():void {
			
			this.mc = new Monkie();
			
			this.mc.x = this.stageWidth / 2;
			this.mc.y = this.stageHeight - this.mc.height - this.margin.BOTTOM;
			_root.addChild(this.mc);
			
			
			initControls();
			
			trace('start');
		}
		function move(event:Event) : void {
	
			if (pressed.LEFT) {
				mc.x -= mc.mainSpeed;
			}
			if (pressed.UP) {
				mc.y -= mc.mainSpeed;
			}
			if (pressed.RIGHT) {
				mc.x += mc.mainSpeed;
			}
			if (pressed.DOWN) {
				mc.y += mc.mainSpeed;
			}
			
			// Rotation
			if (pressed.ROTATECW) {
				mc.rotation -= mc.rotationSpeed;
			}
			if (pressed.ROTATECCW) {
				mc.rotation += mc.rotationSpeed;
			}
			
			// Keeping the monkie in bound
			if (mc.x <= mc.width/2) {
				mc.x += mc.mainSpeed;
			}
			if (mc.y <= mc.height/2 + this.margin.TOP) {
				mc.y += mc.mainSpeed;
			}
			if (mc.x >= this.stageWidth - mc.width/2) {
				mc.x -= mc.mainSpeed;
			}
			if (mc.y >= this.stageHeight - mc.height/2 - this.margin.BOTTOM) {
				mc.y -= mc.mainSpeed;
			}		
			
		}
		
		function checkKeysDown(event:KeyboardEvent) : void {
			
			if (this.controls.LEFT.indexOf(event.keyCode) >= 0) {
				this.pressed.LEFT = true;
			}
			if (this.controls.UP.indexOf(event.keyCode) >= 0) {
				this.pressed.UP = true;
			}
			if (this.controls.RIGHT.indexOf(event.keyCode) >= 0) {
				this.pressed.RIGHT = true;
			}
			if (this.controls.DOWN.indexOf(event.keyCode) >= 0) {
				this.pressed.DOWN = true;
			}
			
			// rotation
			if (this.controls.ROTATECW.indexOf(event.keyCode) >= 0) {
				this.pressed.ROTATECW = true;
			}
			if (this.controls.ROTATECCW.indexOf(event.keyCode) >= 0) {
				this.pressed.ROTATECCW = true;
			}
		}
		
		function checkKeysUp(event:KeyboardEvent) : void {
	
			if (this.controls.LEFT.indexOf(event.keyCode)) {
				this.pressed.LEFT = false;
			}
			if (this.controls.UP.indexOf(event.keyCode)) {
				this.pressed.UP = false;
			}
			if (this.controls.RIGHT.indexOf(event.keyCode)) {
				this.pressed.RIGHT = false;
			}
			if (this.controls.DOWN.indexOf(event.keyCode)) {
				this.pressed.DOWN = false;
			}
			
			// rotation
			if (this.controls.ROTATECW.indexOf(event.keyCode)) {
				this.pressed.ROTATECW = false;
			}
			if (this.controls.ROTATECCW.indexOf(event.keyCode)) {
				this.pressed.ROTATECCW = false;
			}
		}

		
		// setters and getters
		public function getGame():Game {
			return this;
		}
		public function getMargin():Object {
			return this.margin;
		}
		public function getBulletContainer():MovieClip {
			return this.bulletContainer;
		}
	}
	
}
