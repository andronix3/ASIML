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
package com.asiml.meta.psd
{
//	import PLS.Application.Global;
	
	import com.asiml.io.ByteArray24;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	
	/**
	 * @private
	 * 
	 */
	public final class ThumbnailResource {
		
		private static const FORMAT_RAW  : uint = 0;
		private static const FORMAT_JPEG : uint = 1;
		
		private var bitmapData : BitmapData;
		
		private var format : uint;
		private var width : uint;
		private var height : uint;
		private var wbytes : uint;
		private var size : uint;
		private var csize : uint;
		private var bpp : uint;
		private var planes : uint;
		
		private var data : ByteArray = new ByteArray();
		
		private var bitmap : Bitmap;
		
		public function ThumbnailResource(stream : IDataInput) {
			const endian : String = stream.endian;
			stream.endian = Endian.BIG_ENDIAN;
			
			format = stream.readUnsignedInt();
			width = stream.readUnsignedInt();
			height = stream.readUnsignedInt();
			wbytes = stream.readUnsignedInt();
			size = stream.readUnsignedInt();
			csize = stream.readUnsignedInt();
			bpp = stream.readUnsignedShort();
			planes = stream.readUnsignedShort();
			if(format == FORMAT_RAW) {
				stream.readBytes(data, 0, size);
			}
			else {
				stream.readBytes(data, 0, csize);
			}
		}
		
		public function get thumbnail() : Bitmap {
			if(bitmap == null) {
				switch(format) {
					case FORMAT_RAW:
						//********************************************************
						// prolabsolutions changes
						// changed name to match the one found in App0JFXXMarker, since they are the same.
						//********************************************************
						return createRAW24(); 
					case FORMAT_JPEG:
						return createJPEG();
					default:
						throw new ArgumentError("Illegal format: " + format);
				}
			}
			return bitmap;
		}
		
		private function createJPEG() : Bitmap {
			var loader : Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadComplete);
			loader.loadBytes(data);
			bitmapData = new BitmapData(width, height);
			bitmap = new Bitmap(bitmapData);
			return bitmap;
		}
		
		//********************************************************
		// prolabsolutions changes
		// changed name to match the one found in App0JFXXMarker, since they are the same.
		//********************************************************
		private function createRAW24() : Bitmap {
			bitmapData = new BitmapData(width, height, true);
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			data.position = 0;
			var a24 : ByteArray = new ByteArray24(data);
			var a2 : ByteArray = new ByteArray();
			var k : int;
			
			while(a24.bytesAvailable > 2) {
				k = a24.readUnsignedInt();
				a2.writeInt(k);
			}
			a2.position = 0;
			bitmapData.setPixels(rect, a2);
			bitmap = new Bitmap(bitmapData);
			return bitmap;
		}
		
		private function imageLoadComplete(event : Event):void {
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			var p : Point = new Point(0, 0);
			//********************************************************
			// prolabsolutions changes
			// This can crash with an Argument Exception because
			// event.target.content.bitmapData is not valid.
			// Don't know why....
			//********************************************************
			try
			{
				bitmapData.copyPixels(event.target.content.bitmapData, rect, p);
			}
			catch (error : Error)
			{
				var sErr : String = "Error trapped at ImageRO.ThumbnailResources::imageLoadComplete(): " + error.message;				
				//Global.logHandler.error(sErr + "\r\n");			
				trace(sErr);
			}
		}
		
		public function print() : void {
			//********************************************************
			// prolabsolutions changes
			// NO MORE TRACE STATEMENTS
			//********************************************************
			trace("print::ThumbnailResource");
			trace("	format: " + (format == 0 ? "RAW" : "JPEG"));
			trace("	width: " + width);
			trace("	height: " + height);
		}
	}
}