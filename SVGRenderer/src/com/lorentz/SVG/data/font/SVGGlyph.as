package com.lorentz.SVG.data.font
{
	import com.lorentz.SVG.data.path.SVGPathCommand;
	import com.lorentz.SVG.drawing.GraphicsPathDrawer;
	import com.lorentz.SVG.drawing.SVGPathRenderer;
	import com.lorentz.SVG.utils.StringUtil;

	/**
	 * http://www.w3.org/TR/SVG/fonts.html#GlyphElement
	 * Glyph child elements are not supported.
	 * Only pathData ('d' attribute http://www.w3.org/TR/SVG/fonts.html#GlyphElementDAttribute) is supported.
	 */
	public class SVGGlyph
	{
		public var font				:SVGFont;
		
		private var _unicode		:String;
		public var glyphName		:String;
		public var horizAdvX		:int = 0;
		private var _length			:int;
		
		private var _drawer			:GraphicsPathDrawer;

		public function set path(value:Vector.<SVGPathCommand>):void
		{
			var pathRenderer:SVGPathRenderer = new SVGPathRenderer(value); 
			_drawer = new GraphicsPathDrawer();
			pathRenderer.render(_drawer);
			
			var pathData:Vector.<Number> = _drawer.pathData;
			for (var i:int = pathData.length-1; i >= 0; i-=2) 
			{
				pathData[i] *= -1;
			}
		}

		public function get drawer():GraphicsPathDrawer
		{
			return _drawer;
		}

		public function get unicode():String
		{
			return _unicode;
		}

		public function set unicode(value:String):void
		{
			if(!value){
				_length = 1;
				return;
			}
			
			_unicode = StringUtil.cleanGlyphUnicode(value);
			_length = value.length;
		}

		public function get length():int
		{
			return _length;
		}


	}
}