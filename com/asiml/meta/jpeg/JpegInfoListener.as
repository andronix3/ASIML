/*
 * 
 *
 * 
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  o Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 *  o Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 *  o Neither the name of Andrey Kuznetsov nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package com.asiml.meta.jpeg
{
	import flash.utils.IDataInput;

	internal class JpegInfoListener implements JpegListener {
		
		private var jpegInfo : JpegInfo;
		
		private var readThumbnails : Boolean;
		private var readXMP : Boolean;
				
		public function JpegInfoListener(jpegInfo : JpegInfo) {
			this.jpegInfo = jpegInfo;
		}

		public function jpegRST(input:IDataInput):void {

		}
		
		public function jpegDNL(input:IDataInput):void {

		}
		
		public function setReadThumbnails(b: Boolean):void {
			this.readThumbnails = b;
		}
		
		public function setReadXMP(b: Boolean):void {
			readXMP = b;
		}
				
		public function jpegMarker(tag:uint, input:IDataInput):void {
			var m : Marker;
			switch(tag) {
			case JpegConstants.APP_0:
				m = MarkerFactory.readMarker(tag, input);
				if(App0JFIFMarker.isJFIF(m)) {
					var app0 : App0JFIFMarker = new App0JFIFMarker(m);
					if(readThumbnails) {
						jpegInfo.addBitmap(app0.thumbnail);
						jpegInfo.appendXML(app0.xml);
						jpegInfo.addMarker(app0, "app0");
					}
				}
				else if(App0JFXXMarker.isJFXX(m)) {
					if(readThumbnails) {
						var app0xx : App0JFXXMarker = new App0JFXXMarker(m);
						jpegInfo.addBitmap(app0xx.thumbnail);
						jpegInfo.appendXML(app0xx.xml);
						jpegInfo.addMarker(app0xx, "app0xx");
					}
				}
				break;
				
			case JpegConstants.APP_1:
				m = MarkerFactory.readMarker(tag, input);
				if(App1ExifMarker.isEXIF(m)) {
					if(readThumbnails) {
						var exif : App1ExifMarker = new App1ExifMarker(m);
						jpegInfo.addBitmap(exif.exif.thumbnail);
						jpegInfo.appendXML(exif.xml);
						jpegInfo.addMarker(exif, "exif");
					}
				}
				else if(App1XmpMarker.isXMP(m)) {
					if(readXMP) {
						var xmp : App1XmpMarker = new App1XmpMarker(m);
						jpegInfo.appendXML(xmp.xml);
						jpegInfo.addMarker(xmp, "xml");
					}
				}
				break;
				
			case JpegConstants.APP_13:
				m = MarkerFactory.readMarker(tag, input);
				if(readThumbnails) {
					if(!m.ident.toString().toLowerCase().indexOf("adobe_cm") >= 0) {
						jpegInfo.app13.add(m);
					}
				}
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
				m = MarkerFactory.readMarker(tag, input);
				var sof : SOFMarker = new SOFMarker(m);
				if(readThumbnails) {
					jpegInfo.addBitmap(jpegInfo.app13.thumbnail);
				}
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