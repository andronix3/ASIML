/**
 // NOTE: prolabsolutions changes made to this file
 // Search for "// prolabsolutions changes"
 **/
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
	import flash.display.Bitmap;
	import flash.errors.IOError;
	import flash.system.System;
	import flash.utils.IDataInput;
	
	/**
	 * JpegInfo - use this class to get metadata and thumbnails from JPEG file (without complete image loading).
	 * 
	 */
	public class JpegInfo {
		
		internal var finished : Boolean;
		
		private var _markers : Array = new Array();
		private var _app13 : App13Marker;
		private var _thumbs : Array = new Array();
		
		private var _xml : XML = <JPEG></JPEG>;
				
		private var _dictionary : Object = new Object();
		
		private var _width : uint;
		private var _height : uint;
		
		public function get dictionary() : Object {
			return _dictionary;
		}
		
		public static function createJpegInfo(stream : IDataInput, readThumbnails : Boolean = true, readXMP : Boolean = true): JpegInfo {
			var jpegInfo : JpegInfo = new JpegInfo();
			var jil : JpegInfoListener = new JpegInfoListener(jpegInfo);
			jil.setReadThumbnails(readThumbnails);
			jil.setReadXMP(readXMP);
			
			var jstream : JpegStream = new JpegStream(stream, jil);
			try {
				while(!jpegInfo.finished) {
					jstream.readByte();
				}
			}
			//********************************************************
			// prolabsolutions changes
			// catch Error instead of IOError
			//********************************************************
			catch(error : Error) {
				//********************************************************
				// prolabsolutions changes
				// NO MORE TRACE STATEMENTS
				//********************************************************
				// trace("JpegInfo::readFullJpegMetadata");
				trace(error.message)
				// trace(error.getStackTrace());
			}
			return jpegInfo;
		}
		
		public function JpegInfo() {
		}
		
		/**
		 * get JPEG metadata as xml.
		 * 
		 */
		public function get xml() : XML {
			return _xml;
		}
		
		public function get iptc() : XML {
			return app13.iptc.xml;
		}
		
		public function get exif() : XML {
			var exifArray : Array = getArray("exif", false);
			var xml0 : XML = new XML("<ExifMarkers></ExifMarkers>");
			for each (var m : App1ExifMarker in exifArray) {
				xml0.appendChild(m.xml);
			}
			var app13Array : Array = getArray("app13", false);
			for each (var m0 : App13Marker in app13Array) {
				if(m0.exif != null) {
					xml0.appendChild(m0.exif);
				}
			}
			return xml0;
		}
		
		/**
		 * Get JPEG markers.
		 * 
		 */
		public function get markers() : Array {
			return _markers.slice();
		}
		
		public function getMarkersByName(name : String) : Array {
			return getArray(name, false);
		}
		
		/**
		 * Get Array with thumbnails.
		 * 
		 */
		public function get thumbnails() : Array {
			return _thumbs.slice();
		}
		
		internal function get app13() : App13Marker {
			if(_app13 == null) {
				_app13 = new App13Marker();
				addMarker(_app13, "app13");
			}
			return _app13;
		}
				
		internal function hasApp13() : Boolean {
			return _app13 != null;
		}
		
		public function get width() : uint {
			return _width;
		}
		
		public function get height() : uint {
			return _height;
		}
		
		internal function setWidth(w : uint) : void {
			_width = w;
			_xml.width = w.toString();
		}
		
		internal function setHeight(h : uint) : void {
			_height = h;
			_xml.height = h.toString();
		}
		
		internal function addBitmap(b : Bitmap) : void { 
			if(b != null) {
				_thumbs.push(b);
			}
		}
		
		internal function appendXML(xml : XML) : void {
			_xml.appendChild(xml);
		}
		
		internal function addMarker(m : Object, name : String) : void {
			_markers.push(m);
			var ar : Array = getArray(name, true);
			ar.push(m);
		}
		
		private function getArray(name : String, create : Boolean) : Array {
			var ar : Array = _dictionary[name];
			if(_dictionary[name] == null && create) {
				ar = new Array();
				dictionary[name] = ar;
			}
			return ar;
		}
		
		//********************************************************
		// prolabsolutions changes
		// added dispose()
		//********************************************************
		public function dispose() : void {
			for each (var bitmap:Bitmap in _thumbs)
			{
				bitmap.bitmapData.dispose();
			}

			System.disposeXML(_xml);
			
			// @todo: _markers ?? Array 
			// @todo: _app13 ?? App13Marker with lots of crap in it.. 
			// @todo: _dictionary ?? this is an Object with properties
		}
	}
}