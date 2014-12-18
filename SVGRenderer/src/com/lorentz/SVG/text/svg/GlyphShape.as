package com.lorentz.SVG.text.svg
{
	import com.lorentz.SVG.data.font.SVGGlyph;
	
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Shape;
	
	public class GlyphShape extends Shape
	{
		public var boxWidth		:Number;
		public var boxHeight	:Number;
		
		protected var _isDirty	:Boolean;
		
		protected var _glyph:SVGGlyph;
		public function get glyph():SVGGlyph { return _glyph; }
		public function set glyph(value:SVGGlyph):void
		{
			if (_glyph == value)
				return;
			_glyph = value;
			_isDirty = true;
			
			boxWidth = glyph.horizAdvX;
			boxHeight = glyph.font.fontFace.capHeight;
		}
		
		protected var _color:uint;
		public function get color():uint { return _color; }
		public function set color(value:uint):void
		{
			if (_color == value)
				return;
			_color = value;
			_isDirty = true;
		}
		
		protected var _strokeSize:Number;
		public function get strokeSize():Number { return _strokeSize; }
		public function set strokeSize(value:Number):void
		{
			if (_strokeSize == value)
				return;
			_strokeSize = value;
			_isDirty = true;
		}
		
		
		protected var _isDebug:Boolean;
		public function get isDebug():Boolean { return _isDebug; }
		public function set isDebug(value:Boolean):void
		{
			if (_isDebug == value)
				return;
			_isDebug = value;
			_isDirty = true;
		}
		
		protected function get pathData():Vector.<Number>
		{
			return glyph.drawer.pathData;
		}
		
		
		public function get isDirty():Boolean
		{
			return _isDirty;
		}
		
		public function updateGraphics():void
		{
			if(!isDirty){
				return;
			}
			var isTransparent:Boolean = color == uint.MAX_VALUE;
			var alpha:Number = isTransparent ? 0 : 1;
			
			graphics.clear();
			graphics.lineStyle(strokeSize, color, alpha, false, LineScaleMode.NORMAL, CapsStyle.SQUARE, JointStyle.MITER);
			graphics.beginFill(color, alpha);
			graphics.drawPath(glyph.drawer.commands, pathData);
			graphics.endFill();
			
			if(_isDebug) {
				graphics.lineStyle(1);
				graphics.drawRect(0, 0, glyph.horizAdvX, -glyph.font.fontFace.capHeight);
			}
			
			_isDirty = false;
		}
	}
}