package com.lorentz.SVG.data.text
{
	import com.lorentz.SVG.display.SVGDocument;

	public class SVGTextToDraw
	{
		public var text:String;
		public var parentFontSize:Number;
		public var fontSize:Number;
		public var fontFamily:String;
		public var fontWeight:String;
		public var fontStyle:String;
		public var baselineShift:String;
		public var color:uint = 0;
		public var letterSpacing:Number = 0;
		public var useEmbeddedFonts:Boolean;
		public var document:SVGDocument;
		
		public function clone():SVGTextToDraw {
			var copy:SVGTextToDraw = new SVGTextToDraw();
			copy.text = text;
			copy.parentFontSize = parentFontSize;
			copy.fontSize = fontSize;
			copy.fontFamily = fontFamily;
			copy.fontWeight = fontWeight;
			copy.fontStyle = fontStyle;
			copy.baselineShift = baselineShift;
			copy.color = color;
			copy.letterSpacing = letterSpacing;
			copy.useEmbeddedFonts = useEmbeddedFonts;
			copy.document = document;
			return copy;
		}
	}
}