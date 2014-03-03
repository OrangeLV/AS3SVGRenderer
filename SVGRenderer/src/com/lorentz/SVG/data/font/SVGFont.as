package com.lorentz.SVG.data.font {
	
	
	import flash.utils.Dictionary;

	/**
	 * http://www.w3.org/TR/SVG/fonts.html#FontElement
	 */
	public class SVGFont {
		
	//	ATTRIBUTES
		public var id				:String;
		public var horizAdvX		:int = 0;
		
	//	ELEMENTS
		public var fontFace			:SVGFontFace;
		public var missingGlyph		:SVGGlyph;
		private var _glyphList		:Vector.<SVGGlyph> = new Vector.<SVGGlyph>();
		
		private var _glyphMap		:Dictionary = new Dictionary();
		private var _hkernMap		:Dictionary = new Dictionary();

		public function get glyphList():Vector.<SVGGlyph>
		{
			return _glyphList;
		}
		
		public function registerGlyph(glyph:SVGGlyph):void
		{
			_glyphList.push(glyph);
			_glyphMap[glyph.unicode] = glyph;
		}
		
		public function registerHkern(kern:SVGKern):void
		{
			const glyph2Map	:Dictionary = new Dictionary();
			
			for each (var glyph:SVGGlyph in _glyphList) 
			{
				if(kern.unicodeRange1.indexOf(glyph.unicode) != -1 || kern.glyphNameRange1.indexOf(glyph.glyphName) != -1) {
					_hkernMap[glyph] = new SVGKernPair(glyph2Map, kern.k);
				}
				if(kern.unicodeRange2.indexOf(glyph.unicode) != -1 || kern.glyphNameRange2.indexOf(glyph.glyphName) != -1) {
					glyph2Map[glyph] = true;
				}
			}
		}
		
		public function getGlyphList(text:String, glyphList:Vector.<SVGGlyph> = null): Vector.<SVGGlyph>
		{
			if(!glyphList) {
				glyphList = new Vector.<SVGGlyph>();
			} else {
				glyphList.length = 0;
			}
			if(text){
				var glyphCount:uint = _glyphList.length;
				do {
					var glyph:SVGGlyph = findFirstGlyph(text);
					glyphList.push(glyph);
					text = text.substr(glyph.length);
				} while(text.length)
				
			}
			return glyphList;
		}
		
		public function findFirstGlyph(text:String):SVGGlyph
		{
			var glyphCount:uint = _glyphList.length;
			for (var i:int = 0; i < glyphCount; i++) 
			{
				var glyph:SVGGlyph = _glyphList[i];
				if(text.indexOf(glyph.unicode) == 0){
					return glyph;
				}
			}
			return missingGlyph;
		}
		
		public function getKerningValue(glyph1:SVGGlyph, glyph2:SVGGlyph):int
		{
			const kernPair	:SVGKernPair = _hkernMap[glyph1]
			return (kernPair && kernPair.glyph2Map[glyph2]) ? kernPair.kerning : 0;
		}
		
		public function clone():SVGFont
		{
			return this;
		}
		
		public function getGlyph(letter:String):SVGGlyph
		{
			// TODO Auto Generated method stub
			return null;
		}
	}
}