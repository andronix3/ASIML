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
//	import PLS.Application.Global;
	
	import com.asiml.io.ByteOrder;
	import com.asiml.meta.MetadataClass;
	import com.asiml.meta.tiff.IFDEntry;
	import com.asiml.meta.tiff.ImageFileDirectory;
	import com.asiml.meta.tiff.TIFFTagNumbers;
	import com.asiml.meta.tiff.Utils;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
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
		
		//*****************************************
		// prolabsolutions changes
		// Added listener for IOErrors
		//*****************************************
		private function createJPEG() : void {
			for each(var ifd : ImageFileDirectory in _ifds) {
				var soi : IFDEntry = ifd.getEntry(TIFFTagNumbers.JpegSoi);
				var jlen : IFDEntry = ifd.getEntry(TIFFTagNumbers.JpegDataLength);
				if(soi != null && jlen != null && jlen.valueOffset > 0) {
					var jpegData : ByteArray = new ByteArray();
					data.position = soi.valueOffset;
					data.readBytes(jpegData, 0, jlen.valueOffset);
					
					jpegData.position = 0;
					var jinfo : JpegInfo = JpegInfo.createJpegInfo(jpegData);
					width = jinfo.width;
					height = jinfo.height;
					
					jpegData.position = 0;					
					var loader : Loader = new Loader(); 
					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadComplete);
					loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorListener);
					loader.loadBytes(jpegData);
					bitmapData = new BitmapData(width, height);
					bitmap = new Bitmap(bitmapData);
					break;
				}
			}
		}
		
		//*****************************************
		// prolabsolutions changes
		// Added the try catch to this function
		// This has logic we needed...
		//*****************************************
		private function imageLoadComplete(event:Event):void {
			try
			{
				// Validate
				var sErr:String = "";
				if ((event != null) && 
					(event.target != null) &&
					(event.target.content != null) && 
					(event.target.content.bitmapData != null))
				{
					//if ((Bitmap(event.target.content).bitmapData.width > PLS.Application.SystemConst.FLASH_MAX_BITMAPDATA) || 
						//(Bitmap(event.target.content).bitmapData.height > PLS.Application.SystemConst.FLASH_MAX_BITMAPDATA))
					//{			    		
						//sErr = "Error trapped at ImageRO.EXIF::imageLoadComplete(): 'Max allow dimensions exceded'";				
						//Global.logHandler.error(sErr + "\r\n");			
						//trace(sErr);
					//}
					//else
					//{
						//*****************************************
						// prolabsolutions changes
						// this is the original function
						// private function imageLoadComplete(event:Event):void { 					
						var rect : Rectangle = new Rectangle(0, 0, width, height);
						var p : Point = new Point(0, 0);
						bitmapData.copyPixels(event.target.content.bitmapData, rect, p);
						// }
						//*****************************************
					//}
				}  //  if ((event != null) &&
				else
				{
					sErr = "Error trapped at ImageRO.EXIF::imageLoadComplete(): 'Invalid bitmap data'";				
					//Global.logHandler.error(sErr + "\r\n");			
					trace(sErr);
				}  //  <else> if ((event != null) &&
			}
			catch(error : Error)
			{
				sErr = "Error trapped at ImageRO.EXIF::imageLoadComplete(): " + error.message;				
				//Global.logHandler.error(sErr + "\r\n");			
				trace(sErr);
			}
		}		
		
		//*****************************************
		// prolabsolutions changes
		// Added ioErrorListener()
		//*****************************************
		private function ioErrorListener(event:IOErrorEvent):void 
		{
			var sErr:String = "Error trapped at ImageRO.EXIF::thumbnail.createJPEG.ioErrorListener(): " + event.toString();				
			//Global.logHandler.error(sErr + "\r\n");
			trace (sErr);
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