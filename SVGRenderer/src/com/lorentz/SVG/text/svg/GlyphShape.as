package com.lorentz.SVG.text.svg
{
	import com.lorentz.SVG.data.font.SVGGlyph;
	
	import flash.display.Shape;
	
	public class GlyphShape extends Shape
	{
		private var _isDirty:Boolean;
		
		private var _glyph:SVGGlyph;
		public function get glyph():SVGGlyph { return _glyph; }
		
		public function set glyph(value:SVGGlyph):void
		{
			if (_glyph == value)
				return;
			_glyph = value;
		}
		
		private var _color:uint;
		public function get color():uint { return _color; }
		
		public function set color(value:uint):void
		{
			if (_color == value)
				return;
			_color = value;
			_isDirty = true;
		}
		
		private var _isDebug:Boolean;
		public function get isDebug():Boolean { return _isDebug; }
		
		public function set isDebug(value:Boolean):void
		{
			if (_isDebug == value)
				return;
			_isDebug = value;
			_isDirty = true;
		}
		
		
		public function updateGraphics():void
		{
			if(!_isDirty){
				return;
			}
			
			graphics.clear();
			graphics.beginFill(color);
			graphics.drawPath(glyph.drawer.commands, glyph.drawer.pathData);
			graphics.endFill();
			
			if(_isDebug) {
				graphics.lineStyle(1);
				graphics.drawRect(0, 0, glyph.horizAdvX, glyph.font.fontFace.ascent);
			}
			
			_isDirty = false;
		}
	}
}