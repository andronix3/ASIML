package com.imagero.meta.jpeg
{
	import flash.utils.IDataInput;

	internal class JpegInfoListener implements JpegListener {
		
		private var jpegInfo : JpegInfo;
		
		public function JpegInfoListener(jpegInfo : JpegInfo) {
			this.jpegInfo = jpegInfo;
		}

		public function jpegRST(input:IDataInput):void {

		}
		
		public function jpegDNL(input:IDataInput):void {

		}
		
		public function jpegMarker(tag:uint, input:IDataInput):void {
			var m : Marker;
			switch(tag) {
			case JpegConstants.APP_0:
				m = MarkerFactory.readMarker(tag, input);
				if(App0JFIFMarker.isJFIF(m)) {
					var app0 : App0JFIFMarker = new App0JFIFMarker(m);
					jpegInfo.addBitmap(app0.thumbnail);
					jpegInfo.appendXML(app0.xml);
					jpegInfo.addMarker(app0, "app0");
				}
				else if(App0JFXXMarker.isJFXX(m)) {
					var app0xx : App0JFXXMarker = new App0JFXXMarker(m);
					jpegInfo.addBitmap(app0xx.thumbnail);
					jpegInfo.appendXML(app0xx.xml);
					jpegInfo.addMarker(app0xx, "app0xx");
				}
				break;
				
			case JpegConstants.APP_1:
				m = MarkerFactory.readMarker(tag, input);
				if(App1ExifMarker.isEXIF(m)) {
					var exif : App1ExifMarker = new App1ExifMarker(m);
					jpegInfo.addBitmap(exif.exif.thumbnail);
					jpegInfo.appendXML(exif.xml);
					jpegInfo.addMarker(exif, "exif");
				}
				else if(App1XmpMarker.isXMP(m)) {
					var xmp : App1XmpMarker = new App1XmpMarker(m);
					jpegInfo.appendXML(xmp.xml);
					jpegInfo.addMarker(xmp, "xml");
				}
				break;
				
			case JpegConstants.APP_13:
				jpegInfo.app13.add(MarkerFactory.readMarker(tag, input));
				break;
			case JpegConstants.SOF0:
			case JpegConstants.SOF1:
			case JpegConstants.SOF2:
			case JpegConstants.SOF3:
			case JpegConstants.SOF5:
			case JpegConstants.SOF6:
			case JpegConstants.SOF7:
			case JpegConstants.SOF9:
			case JpegConstants.SOF10:
			case JpegConstants.SOF11:
			case JpegConstants.SOF13:
			case JpegConstants.SOF14:
			case JpegConstants.SOF15:
				var sof : SOFMarker = new SOFMarker(MarkerFactory.readMarker(tag, input));
				jpegInfo.addBitmap(jpegInfo.app13.thumbnail);
				jpegInfo.setWidth(sof.width)
				jpegInfo.setHeight(sof.height); 
				jpegInfo.addMarker(sof, "SOF");
				if(jpegInfo.hasApp13()) { 
					jpegInfo.appendXML(jpegInfo.app13.xml);
				}
				jpegInfo.finished = true;
				break;
				
			case JpegConstants.SOS:
				jpegInfo.finished = true;
				break;
				
			default:
				MarkerFactory.skipMarker(tag, input);	
			}
		}
	}
}