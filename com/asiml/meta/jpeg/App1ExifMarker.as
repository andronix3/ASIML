package com.asiml.meta.jpeg
{
	import com.asiml.meta.tiff.ImageFileDirectory;
	
	import flash.errors.IOError;
	import flash.utils.ByteArray;
 
 	/**
 	 * @private
 	 * 
 	 */
	public class App1ExifMarker {
		protected static const IDENTIFIER : uint = 0x45786966;
		
		private var _exif : EXIF;
		private var data : ByteArray;
		
		public function App1ExifMarker(m : Marker) {
			if(m == null) {
				throw new ArgumentError();
			}
			if(!isEXIF(m)) {
				throw new IOError("Not EXIF");				
			}
			data = m.data;
			_exif = new EXIF(data);
		}
				
		public static function isEXIF(m : Marker) : Boolean {
			if(m.tag != JpegConstants.APP_1) {
				return false;
			}
			m.ident.position = 0;
			var id : uint = m.ident.readUnsignedInt();
			if(id != IDENTIFIER) {
				return false;
			}
			return true;
		}
		
		public function get exif() : EXIF {
			return _exif;
		}
		
		public function get xml() : XML {
			var exifml : XML = <Marker></Marker>;
			exifml.tag = "" + JpegConstants.APP_1;
			exifml.type = "APP1";
			exifml.subtype = "EXIF";
			exifml.appendChild(_exif.xml);
			return exifml;
		}
		
		public function print() : void {
		//********************************************************
			// prolabsolutions changes
			// NO MORE TRACE STATEMENTS
			//********************************************************
			trace("print::App1ExifMarker");
			trace(xml);
		}
	}
}