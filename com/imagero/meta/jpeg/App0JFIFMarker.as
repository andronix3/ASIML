package com.imagero.meta.jpeg
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.errors.IOError;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	
	/**
	 * @private
	 * 
	 */
	public final class App0JFIFMarker {
		
    private static const ID : uint = 0x4A464946;

    private var _version : uint;
    private var _units : uint;
    
    private var _xDensity : uint;
    private var _yDensity : uint;
    
    private var xThumbnail : uint;
    private var yThumbnail : uint;
	
	private var tdata : ByteArray;
	private var bitmap : Bitmap;
		
		public function App0JFIFMarker(m : Marker) {
			if(!isJFIF(m)) {
				throw new IOError("Not JFIF App0 Marker");
			}
			m.data.position = 0;
			_version = m.data.readUnsignedShort();
			_units = m.data.readUnsignedByte();
			_xDensity = m.data.readUnsignedShort();
			_yDensity = m.data.readUnsignedShort();
			xThumbnail = m.data.readUnsignedByte();
			yThumbnail = m.data.readUnsignedByte();
			
			var length : uint = xThumbnail * yThumbnail * 3;
			tdata = new ByteArray();
			m.data.readBytes(tdata, 0, length);
		}
		
		public static function isJFIF(m : Marker) : Boolean {
			if(m == null) {
				throw new ArgumentError();
			}
			if(m.tag != JpegConstants.APP_0) {
				return false;
			}
			m.ident.position = 0;
			var id : uint = m.ident.readUnsignedInt();
			if(id != ID) {
				return false;
			}
			return true;
		}
		
		public function get thumbnail() : Bitmap {
			if(tWidth == 0 || tHeight == 0) {
				return null;
			}
			if(bitmap == null) {
				var bdata : BitmapData = new BitmapData(tWidth, tHeight);
				var rect : Rectangle = new Rectangle(0, 0, tWidth, tHeight);
				bdata.setPixels(rect, tdata);
				bitmap = new Bitmap(bdata);
			}
			return bitmap;
		}
		
		public function get version() : uint {
			return _version;
		}
		
		public function get units() : uint {
			return _units;
		}
		
		public function get xDensity() : uint {
			return _xDensity;
		}
		
		public function get yDensity() : uint {
			return _yDensity;
		}
		
		public function get tWidth() : uint {
			return xThumbnail;
		}
		
		public function get tHeight() : uint {
			return yThumbnail;
		}
		
		public function get xml() : XML {
			var app0 : XML = <Marker></Marker>;
			app0.tag = JpegConstants.APP_0.toString();
			app0.type = "APP0";
			app0.subtype = "JFIF";
			app0.version = version.toString();
			app0.x_density = xDensity;
			app0.y_density = yDensity; 
			app0.density_units = unitsToString(units);
			app0.thumbnail_width = tWidth;
			app0.thumbnail_height = tHeight;
			return app0;
		}
		
		internal static function unitsToString(units : uint) : String {
			switch(units) {
				//0: no units, X and Y specify the pixel aspect ratio. 1: X and Y are dots per inch. 2: X and Y are dots per cm.
				case 0:
					return "aspect ratio";
				case 1:
					return "dots per inch";
				case 2:
					return "dots per cm";
				default:
					throw new ArgumentError("Unknown units: " + units);
			}
		}
		
		public function print() : void {
			trace(xml);
		}
	}
}