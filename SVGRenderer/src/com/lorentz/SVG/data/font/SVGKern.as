package com.lorentz.SVG.data.font
{
	public class SVGKern
	{
		private var _unicodeRange1		:Vector.<String>
		private var _glyphNameRange1	:Vector.<String>
		private var _unicodeRange2		:Vector.<String>
		private var _glyphNameRange2	:Vector.<String>
		public var k					:int
		
		private static const EMPTY		:Vector.<String> = new Vector.<String>();
		
		public function SVGKern()
		{
		}

		public function set u1(value:String):void
		{
			_unicodeRange1 = value ? Vector.<String>(value.split(",")) : EMPTY;
		}

		public function set g1(value:String):void
		{
			_glyphNameRange1 = value ? Vector.<String>(value.split(",")) : EMPTY;
		}

		public function set u2(value:String):void
		{
			_unicodeRange2 = value ? Vector.<String>(value.split(",")) : EMPTY;
		}

		public function set g2(value:String):void
		{
			_glyphNameRange2 = value ? Vector.<String>(value.split(",")) : EMPTY;
		}
		

		public function get unicodeRange1():Vector.<String>
		{
			return _unicodeRange1;
		}

		public function get glyphNameRange1():Vector.<String>
		{
			return _glyphNameRange1;
		}

		public function get unicodeRange2():Vector.<String>
		{
			return _unicodeRange2;
		}

		public function get glyphNameRange2():Vector.<String>
		{
			return _glyphNameRange2;
		}
	}
}