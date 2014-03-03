package com.lorentz.SVG.data.font
{
	import flash.utils.Dictionary;

	public class SVGKernPair
	{
		public var glyph2Map	:Dictionary = new Dictionary();
		public var kerning		:int;
		
		public function SVGKernPair(glyph2Map:Dictionary, kerning:int)
		{
			this.glyph2Map = glyph2Map;
			this.kerning = kerning;
		}
	}
}