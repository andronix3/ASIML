package com.imagero.meta.jpeg
{
	import flash.display.Bitmap;
	import flash.errors.IOError;
	import flash.utils.IDataInput;
	
	/**
	 * JpegInfo - use this class to get metadata and thumbnails from JPEG file (without complete image loading).
	 * 
	 */
	public class JpegInfo {
		
		private var stream : IDataInput;
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
		
		public function JpegInfo(stream : IDataInput) {
			var jstream : JpegStream = new JpegStream(stream, new JpegInfoListener(this));
			try {
				while(!finished) {
					jstream.readByte();
				}
			}
			catch(error : IOError) {
				trace(error.getStackTrace());
			}
		}
		
		/**
		 * get JPEG metadata as xml.
		 * 
		 */
		public function get xml() : XML {
			return _xml;
		}
		
		/**
		 * Get JPEG markers.
		 * 
		 */
		public function get markers() : Array {
			return _markers.slice();
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
				_markers.push(_app13);
				_dictionary["app13"] = _app13;
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
			_dictionary[name] = m;
		}
	}
}