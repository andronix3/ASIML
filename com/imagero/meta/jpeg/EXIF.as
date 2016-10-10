package com.imagero.meta.jpeg
{
	import com.imagero.io.ByteOrder;
	import com.imagero.meta.MetadataClass;
	import com.imagero.meta.tiff.*;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	/**
	 * @private
	 * 
	 */
	public class EXIF {
		private var _ifds: Array = new Array();
		private var _root : ImageFileDirectory;
		private var _exif : ImageFileDirectory;
		private var _gps : ImageFileDirectory;
		private var _interop : ImageFileDirectory;

		private var bitmap : Bitmap;
		private var bitmapData : BitmapData;
		private var width : int;
		private var height : int;
		
		private var data : ByteArray;
		
		public function EXIF(data : ByteArray) {
			this.data = data;
			init();
		}
		
		public function get thumbnail() : Bitmap {
			if(bitmap == null) {
				createJPEG();
			}
			return bitmap;
		}
		
		private function createJPEG() : void {
			for each(var ifd : ImageFileDirectory in _ifds) {
				var soi : IFDEntry = ifd.getEntry(TIFFTagNumbers.JpegSoi);
				var jlen : IFDEntry = ifd.getEntry(TIFFTagNumbers.JpegDataLength);
				if(soi != null && jlen != null && jlen.valueOffset > 0) {
					var jpegData : ByteArray = new ByteArray();
					data.position = soi.valueOffset;
					data.readBytes(jpegData, 0, jlen.valueOffset);
					
					jpegData.position = 0;
					var jinfo : JpegInfo = new JpegInfo(jpegData);
					width = jinfo.width;
					height = jinfo.height;
					
					jpegData.position = 0;					
					var loader : Loader = new Loader(); 
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadComplete);
					loader.loadBytes(jpegData);
					bitmapData = new BitmapData(width, height);
					bitmap = new Bitmap(bitmapData);
					break;
				}
			}
		}
		
		private function imageLoadComplete(event:Event):void {
			var rect : Rectangle = new Rectangle(0, 0, width, height);
			var p : Point = new Point(0, 0);
			bitmapData.copyPixels(event.target.content.bitmapData, rect, p); 
		}		
		
		protected function init(pos : uint = 0) : void {
			data.position = pos;
			
			var byteOrder : uint = data.readUnsignedShort();
			data.endian = ByteOrder.toEndian(byteOrder);
			
			var padding : uint = data.readUnsignedShort();
			var offset : uint = data.readUnsignedInt();
			
			_root = readIFDs(data, _ifds);

			_exif = findAndReadIFD(_root, data, TIFFTagNumbers.ExifPointer, MetadataClass.EXIF);
			_gps = findAndReadIFD(_root, data, TIFFTagNumbers.GPSInfoIFDPointer, MetadataClass.GPS);
			_interop = findAndReadIFD(_exif, data, TIFFTagNumbers.InteroperabilityIFDPointer, MetadataClass.INTER_OP);
		}
		
		public static function readIFDs(data : ByteArray, ifds : Array) : ImageFileDirectory {
			var ifd :ImageFileDirectory = null;
			var root : ImageFileDirectory = null;
			
			while(data.position < data.length) {
				if(ifd == null) {
					ifd = Utils.readIFD(data); 
					root = ifd;
				}
				else {
					ifd.setNext(Utils.readIFD(data));
					ifd = ifd.next;
				}
				ifds.push(ifd);
				if(ifd.nextOffset == 0) {
					break;
				}
				data.position = ifd.nextOffset;
			}
			return root;
		}
		
		public static function findAndReadIFD(ifd: ImageFileDirectory, data : ByteArray, tag : uint, cat : MetadataClass) : ImageFileDirectory {
			while(ifd != null) {
				var entry : IFDEntry = ifd.getEntry(tag);
				if(entry != null) {
					data.position = entry.valueOffset;
					return Utils.readIFD(data, cat);
				}
				ifd = ifd.next;
			}
			return null;
		}
		
		public function get ifds() : Array {
			return _ifds;
		}
		
		public function get root() : ImageFileDirectory {
			return _root;
		}
		
		public function get exif() : ImageFileDirectory {
			return _exif;
		}
		
		public function get gps() : ImageFileDirectory {
			return _gps;
		}
		
		public function get interoperability() : ImageFileDirectory {
			return _interop;
		}
				
		public function get xml() : XML {
			var exifml : XML = <EXIF></EXIF>;
			var ifdsml : XML = <ifds></ifds>;
			for each(var ifd : ImageFileDirectory in _ifds) {
				ifdsml.appendChild(ifd.xml);
			}
			if(_exif != null) {
				ifdsml.appendChild(_exif.xml);				
			}
			if(_gps != null) {
				ifdsml.appendChild(_gps.xml);
			}
			if(_interop != null) {
				ifdsml.appendChild(_interop.xml);
			}
			exifml.appendChild(ifdsml);
			return exifml;
		}
	}
}