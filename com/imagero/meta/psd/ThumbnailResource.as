package com.imagero.meta.psd
{
	import com.imagero.io.ByteArray24;
	
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
						return createRAW(); 
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
		
		private function createRAW() : Bitmap {
			bitmapData = new BitmapData(width, height, true);
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			data.position = 0;
			var a24 : ByteArray = new ByteArray24(data);
			bitmapData.setPixels(rect, a24);
			bitmap = new Bitmap(bitmapData);
			return bitmap;
		}
		
		private function imageLoadComplete(event:Event):void {
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			var p : Point = new Point(0, 0);
			bitmapData.copyPixels(event.target.content.bitmapData, rect, p); 
		}
		
		public function print() : void {
			trace("Thumbnail Resource:");
			trace("	format: " + (format == 0 ? "RAW" : "JPEG"));
			trace("	width: " + width);
			trace("	height: " + height);
		}
	}
}