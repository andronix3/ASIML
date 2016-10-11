package com.asiml.meta.jpeg
{
	import flash.utils.IDataInput;
	
	import mx.controls.TextArea;
	
	/**
	 * @private
	 * 
	 */
	public class PrintingJpegListener implements JpegListener {
		
		private var text : TextArea;
		
		private var app13 : App13Marker = new App13Marker(); 
		
		public function PrintingJpegListener(txt : TextArea) {
			this.text = txt;
		}
		
		public function jpegRST(input : IDataInput):void {
			text.text += ".";
		}
		
		public function jpegDNL(input : IDataInput):void {
			const tag : uint = JpegConstants.DNL;
			text.text += "Marker:" + tag.toString(16) + "[" + MarkerFactory.toString(tag) + "]\n";
			MarkerFactory.skipMarker(tag, input);
		}
		
		public function jpegMarker(tag:uint, input : IDataInput):void {
			text.text += "Marker:" + tag.toString(16) + "[" + MarkerFactory.toString(tag) + "]\n";
			var m : Marker;
			if(tag == JpegConstants.APP_0) {
				m = MarkerFactory.readMarker(tag, input);
				if(App0JFIFMarker.isJFIF(m)) {
					var app0 : App0JFIFMarker = new App0JFIFMarker(m);
					app0.print();
				}
				else if(App0JFXXMarker.isJFXX(m)) {
					var app0xx : App0JFXXMarker = new App0JFXXMarker(m);
					app0xx.print();
				}
			}
			else if(tag == JpegConstants.APP_1) {
				m = MarkerFactory.readMarker(tag, input);
				if(App1ExifMarker.isEXIF(m)) {
					var exif : App1ExifMarker = new App1ExifMarker(m);
				}
				else if(App1XmpMarker.isXMP(m)) {
					var xmp : App1XmpMarker = new App1XmpMarker(m);
					trace(xmp.xml);
				}
			}
			else if(tag == JpegConstants.APP_13) {
				app13.add(MarkerFactory.readMarker(tag, input));
			}
			else if(tag == JpegConstants.SOS) {
				app13.print();
				 
			}
			else {
				MarkerFactory.skipMarker(tag, input);	
			}
		}
	}
}