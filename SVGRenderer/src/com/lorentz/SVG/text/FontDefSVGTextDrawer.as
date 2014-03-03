package com.lorentz.SVG.text
{
	import com.lorentz.SVG.data.text.SVGDrawnText;
	import com.lorentz.SVG.data.text.SVGTextToDraw;
	import com.lorentz.SVG.text.svg.TextLine;

	public class FontDefSVGTextDrawer implements ISVGTextDrawer
	{	
		public function start():void {
		}
		
		public function drawText(data:SVGTextToDraw):SVGDrawnText {
			var textLine:TextLine = new TextLine();
			textLine.text = data.text.slice(1,-1); // Remove LEFT-TO-RIGHT MARK from SVGTextContainer.createTextSprite()
			textLine.font = data.document.getFont(data.fontFamily + "###" + data.fontStyle + "###" + data.fontWeight);
			textLine.size = data.fontSize;
			textLine.color = data.color;
			if(textLine.isValid) {
				textLine.render();
				return new SVGDrawnText(textLine, textLine.boxWidth, 0, 0);
			}
			
			 var textfieldDrawer:TextFieldSVGTextDrawer = new TextFieldSVGTextDrawer();
			 return textfieldDrawer.drawText(data);
		}
		
		public function end():void {
		}
	}
}