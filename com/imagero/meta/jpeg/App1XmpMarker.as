package com.imagero.meta.jpeg
{
	import flash.errors.IOError;
	
	
	/**
	 * @private
	 * 
	 */
	public final class App1XmpMarker {

    	private static const XMP_ID : String = "http://ns.adobe.com/xap/1.0/";
		
		internal var _xmp : String;
		internal var _xml : XML;
		private var m : Marker;
		
		public function App1XmpMarker(m : Marker) {
			if(m == null) {
				throw new ArgumentError("Marker can't be null");
			}
			if(!isXMP(m)) {
				throw new IOError("Not XMP marker");
			}
			this.m = m;
			//trace("App1XmpMarker");
			//trace(xml);
		}
		
		public static function isXMP(m : Marker) : Boolean {
			if(m.tag != JpegConstants.APP_1) {
				return false;
			}
			
			var id : String = m.ident.toString();
			if(id.indexOf(XMP_ID) != 0) {
				return false;
			}
			return true;
		}
		
		public function get xmp() : String {
			if(_xmp == null) {
				m.data.position = 0;
				_xmp = m.data.readUTFBytes(m.data.length);
			}
			return _xmp;
		}
		
		public function get xml() : XML {
			var xml0 : XML = <Marker></Marker>;
			xml0.tag = "" + JpegConstants.APP_1;
			xml0.type = "APP1";
			xml0.subtype = "XMP";
			if(_xml == null) {
				_xml = new XML(xmp);
			}
			//var cdata : String = "<![CDATA[";
			//cdata +=_xml.toXMLString();
			//cdata +="]]>";
			xml0.rdf = _xml;			
			return xml0;
		}
	}
}