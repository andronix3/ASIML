package com.imagero.meta.jpeg
{
	
	import com.imagero.io.ByteArray24;
	import com.imagero.io.ByteArray8;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	
	/**
	 * @private
	 * 
	 */
	public final class App0JFXXMarker {
		
		private static const ID : uint = 0x4A465858;
		
		private static const FORMAT_JPEG : uint = 0x10;
		private static const FORMAT_1BPP : uint = 0x11;
		private static const FORMAT_3BPP : uint = 0x13;
		
		private var extensionCode: uint;
		private var bitmap : Bitmap;
		private var bitmapData : BitmapData;
		private var width : uint;
		private var height : uint;
				
		private var data : ByteArray;
		private var palette : Array;
		
		public function App0JFXXMarker(m : Marker) {
			if(!isJFXX(m)) {
				throw new ArgumentError();
			}
			data = m.data;
			m.data.position = 0;
			extensionCode = m.data.readUnsignedByte();
			switch(extensionCode) {
				case FORMAT_1BPP:
					read1BPP();
					break;
				case FORMAT_3BPP:
					read3BPP();
					break;
				case FORMAT_JPEG:
					createJPEG();
					break;
				default:
					throw new IOError("Unknown extension code: " + extensionCode);
			}
		}
		
		public function get thumbnail() : Bitmap {
			return bitmap;
		}
				
		public static function isJFXX(m : Marker) :Boolean {
			if(m == null) {
				throw new ArgumentError();
			}
			if(m.tag != JpegConstants.APP_0) {
				return false;
			}
			m.ident.position = 0;
			if(m.ident.readUnsignedInt() != ID) {
				return false;
			}
			return true;
		}
		
		private function read1BPP() : void {
			width = data.readUnsignedByte();
			height = data.readUnsignedByte();
			
			createPalette();
			createRAW8(); 
		}
		
		private function read3BPP() : void {
			width = data.readUnsignedByte();
			height = data.readUnsignedByte();
			
			createRAW24(); 
		}
		
		private function createPalette() : void {
			palette = new Array();
			for(var i : uint = 0; i < 256; i++) {
				var a : uint = 0xFF;
				a = (a << 8) | data.readByte();
				a = (a << 8) | data.readByte();
				a = (a << 8) | data.readByte();
				palette.push(a);
			}
		}
		private function createJPEG() : void {
			var jinfo : JpegInfo = new JpegInfo(data);
			width = jinfo.width;
			height = jinfo.height;
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadComplete);
			data.position = 0;
			loader.loadBytes(data);
			bitmapData = new BitmapData(width, height);
			bitmap = new Bitmap(bitmapData);
		}
		
		private function createRAW8() : void {
			bitmapData = new BitmapData(width, height, true);
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			data.position = 1;
			var a8 : ByteArray = new ByteArray8(data, palette);
			bitmapData.setPixels(rect, a8);
			bitmap = new Bitmap(bitmapData);
		}

		private function createRAW24() : void {
			bitmapData = new BitmapData(width, height, true);
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			data.position = 1;
			var a24 : ByteArray = new ByteArray24(data);
			bitmapData.setPixels(rect, a24);
			bitmap = new Bitmap(bitmapData);
		}
		
		private function imageLoadComplete(event:Event): void {
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			var p : Point = new Point(0, 0);
			bitmapData.copyPixels(event.target.content.bitmapData, rect, p); 
		}
		
		public function get xml() : XML {
			var app0 : XML = <Marker></Marker>;
			app0.tag = JpegConstants.APP_0;
			app0.type = "APP0";
			app0.subtype = "JFXX";
			app0.extension_code = extensionCode;
			app0.thumbnail_width = width;
			app0.thumbnail_height = height;
			app0.thumbnail_type = extensionCode;
			return app0;
		}
		
		public function print() : void {
			trace("App0JFXXMarker:");
			trace("		extensionCode: " + extensionCode + " (" + extension + ")");
			trace("		thumbnail width: " + width);
			trace("		thumbnail height: " + height);
		}
		
		private function get extension() : String {
			switch(extensionCode) {
				case FORMAT_JPEG:
					return "JPEG";
				case FORMAT_1BPP:
					return "8 bpp";
				case FORMAT_3BPP:
					return "24 bpp";
				default:
					return "unknown";
			}
		} 
	}
}