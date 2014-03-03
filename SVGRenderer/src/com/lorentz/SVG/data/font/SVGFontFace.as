package com.lorentz.SVG.data.font {
	import com.lorentz.SVG.utils.ICloneable;

	/**
	 * http://www.w3.org/TR/SVG/fonts.html#FontFaceElement
	 * TODO many properties are not included
	 */
	public class SVGFontFace implements ICloneable {
		
		public var fontFamily	:String;
		public var fontStyle	:String;
		public var fontWeight	:String;
		public var unitsPerEm	:int = 1000;
		public var capHeight	:int = 0;
		public var xHeight		:int = 0;
		public var accentHeight	:int = 0;
		public var ascent		:int = 0;
		public var descent		:int = 0;
		
		public function clone():Object {
			var c:SVGFontFace = new SVGFontFace();
			c.fontFamily = fontFamily;
			c.unitsPerEm = unitsPerEm;
			c.capHeight = capHeight;
			c.xHeight = xHeight;
			c.accentHeight = accentHeight;
			c.ascent = ascent;
			c.descent = descent;
			return c;
		}


	}
}