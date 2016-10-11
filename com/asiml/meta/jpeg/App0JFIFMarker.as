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
			//********************************************************
			// prolabsolutions changes
			// NO MORE TRACE STATEMENTS
			//********************************************************
			trace ("print::App0JFIFMarker");
			trace(xml);
		}
	}
}