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
	import com.asiml.meta.tiff.IFDEntry;
	import com.asiml.meta.tiff.ImageFileDirectory;
	import com.asiml.meta.tiff.TIFFTagNumbers;
	import flash.utils.IDataInput;
	
	internal class JpegQuickInfoListener implements JpegListener {
		
		private var quickInfo : JpegQuickInfo;
		
		public function JpegQuickInfoListener(jpegInfo : JpegQuickInfo) {
			this.quickInfo = jpegInfo;
		}
		
		public function jpegRST(input:IDataInput):void {
			
		}
		
		public function jpegDNL(input:IDataInput):void {
			
		}
		
		public function jpegMarker(tag:uint, input:IDataInput):void {
			var m : Marker;
			// trace(tag);
			
			switch(tag) {
				
				case JpegConstants.APP_1:
					m = MarkerFactory.readMarker(tag, input);
					if(App1ExifMarker.isEXIF(m)) {
						var ifds : Array;
						var ifd : ImageFileDirectory;
						var exif : App1ExifMarker = new App1ExifMarker(m);
						var ifd0 : ImageFileDirectory = exif.exif.exif;
						if(ifd0 != null) {
							var orientIE: IFDEntry = ifd0.getEntry(TIFFTagNumbers.Orientation);
							if(orientIE != null) {
								var orientation : uint = orientIE.valueOffset;
								quickInfo._orientation = orientation;				
							}
							else {
								ifds = exif.exif.ifds;
								for each(ifd in ifds) {
									orientIE = ifd.getEntry(TIFFTagNumbers.Orientation);
									if(orientIE != null) {
										quickInfo._orientation = orientIE.valueOffset;
										break;
									}
								}
							}
						}
						else {
							ifds = exif.exif.ifds;
							for each(ifd in ifds) {
								orientIE = ifd.getEntry(TIFFTagNumbers.Orientation);
								if(orientIE != null) {
									quickInfo._orientation = orientIE.valueOffset;
									break;
								}
							}
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
					var sof : SOFMarker = new SOFMarker(MarkerFactory.readMarker(tag, input));
					quickInfo._width = sof.width;
					quickInfo._height = sof.height; 
					quickInfo._finished = true;
					break;
				
				case JpegConstants.SOS:
					quickInfo._finished = true;
					break;
				
				default:
					MarkerFactory.skipMarker(tag, input);	
			}
		}
	}
}
