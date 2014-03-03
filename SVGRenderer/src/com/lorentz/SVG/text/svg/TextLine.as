package com.lorentz.SVG.text.svg
{
	import com.lorentz.SVG.data.font.SVGFont;
	import com.lorentz.SVG.data.font.SVGGlyph;
	
	import flash.display.Sprite;
	
	public class TextLine extends Sprite
	{
		private var _isDirty:Boolean;
		
		private var _font:SVGFont;
		public function get font():SVGFont { return _font; }
		
		public function set font(value:SVGFont):void
		{
			if (_font == value)
				return;
			_font = value;
			_isDirty = true;
		}
		
		private var _size:uint;
		public function get size():uint { return _size; }
		
		public function set size(value:uint):void
		{
			if (_size == value)
				return;
			_size = value;
			_isDirty = true;
		}
		
		private var _text:String;
		public function get text():String { return _text; }
		
		public function set text(value:String):void
		{
			if (_text == value)
				return;
			_text = value;
			_isDirty = true;
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
		
		private var _glyphList		:Vector.<SVGGlyph> = new Vector.<SVGGlyph>();
		private var _shapeList		:Vector.<GlyphShape> = new Vector.<GlyphShape>();
		private var _boxWidth		:Number = 0;
		private var _boxHeight		:Number = 0;
		private var _scale			:Number;
		
		
		
		public function get isValid():Boolean {
			return (font && size && text != null);
		}
		
		
		public function render():void {
			if(!isValid) {
				throw new Error("Text data is not valid for rendering");
			}
			if(!_isDirty){
				return;
			}
			removeChildren();
			_boxWidth = 0;
			
			var prevGlyph:SVGGlyph;
			_glyphList = font.getGlyphList(text, _glyphList);
			var i:int;
			for (i = _shapeList.length; i < _glyphList.length; i++) 
			{
				_shapeList.push(new GlyphShape());
			}
			for (i = 0; i < _glyphList.length; i++) 
			{
				var glyph:SVGGlyph = _glyphList[i];
				var shape:GlyphShape = _shapeList[i];
				shape.scaleY = -1;
				shape.glyph = glyph;
				shape.color = color;
				shape.updateGraphics();
				addChild(shape);
				
				if(prevGlyph){
					_boxWidth -= font.getKerningValue(prevGlyph, glyph);
				}
				shape.x = _boxWidth;
				_boxWidth += glyph.horizAdvX;
				
				prevGlyph = glyph;
			}
			
			_scale = size / font.fontFace.unitsPerEm;
			_boxHeight = size;
			this.scaleX = this.scaleY = _scale;
		}
		
		public function get boxWidth():Number {
			return _boxWidth * _scale;
		}
		
		public function get boxHeight():Number {
			return _boxHeight * _scale;
		}

		
	}
}
