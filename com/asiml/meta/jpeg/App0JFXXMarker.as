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
	
	import com.asiml.io.ByteArray24;
	import com.asiml.io.ByteArray8;
	
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
			var jinfo : JpegInfo = JpegInfo.createJpegInfo(data);
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
		
		//********************************************************
		// prolabsolutions changes
		// Changes to correct exceptions that were occuring on
		// certain jpeg image formats..
		//********************************************************
		private function createRAW24() : Bitmap {
			bitmapData = new BitmapData(width, height, true);
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			data.position = 0;
			var a24 : ByteArray = new ByteArray24(data);
			var a2 : ByteArray = new ByteArray();
			var k: int;
			
			while(a24.bytesAvailable > 2) {
				k = a24.readUnsignedInt();
				a2.writeInt(k);
			}
			a2.position = 0;
			bitmapData.setPixels(rect, a2);
			bitmap = new Bitmap(bitmapData);
			return bitmap;
		}

		private function imageLoadComplete(event : Event): void {
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
			//********************************************************
			// prolabsolutions changes
			// NO MORE TRACE STATEMENTS
			//********************************************************
			trace("print::App0JFXXMarker:");
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