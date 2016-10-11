package com.asiml.meta.jpeg
{
	import mx.formatters.SwitchSymbolFormatter;
	
	import com.asiml.io.InputStream;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;
	import flash.errors.IOError;
	
	internal class MarkerFactory {

		public static function readMarker(tag : uint, input: IDataInput) : Marker {
			var m : Marker = new Marker(tag);
			if(!isEmpty(tag)) {
        		m.length = input.readUnsignedShort();
        		var ident : ByteArray = readIdentifier(tag, input);
				m.ident = ident;
		  		m.data = new ByteArray();
				input.readBytes(m.data, 0, m.length - 2 - ident.length);
			}
			return m;
		}
		
		public static function skipMarker(tag : uint, input: IDataInput) : void {
			if(!isEmpty(tag)) {
        		var length : uint = input.readUnsignedShort();
		  		var data : ByteArray = new ByteArray();
				input.readBytes(data, 0, length - 2);
			}
		}
		
		private static function readIdentifier(tag : uint, fs : IDataInput) : ByteArray {
			var ba : ByteArray = new ByteArray();
			switch(tag) {
				case JpegConstants.APP_0:
					fs.readBytes(ba, 0, 5);
					break;
				case JpegConstants.APP_1:
					fs.readBytes(ba, 0, 6);
					var s : String = ba.toString().toLowerCase();
					if(s.indexOf("exif") >= 0) {
						break;
					}
					else if(s.indexOf("http") >= 0) {
						fs.readBytes(ba, 6, 29 - 6);// 29 - length of XMP identifier, 6 bytes are already read
						break;
					}
					else {
						trace("Error in APP_1 Marker");
						break;
					}
				case JpegConstants.APP_13:
					fs.readBytes(ba, 0, 4);
					s = ba.toString().toLowerCase();
					if(s.indexOf("phot") >= 0) {
						fs.readBytes(ba, 4, 10);
					}
					else {
						trace("Error in APP_13 Marker");
					}
					break;
				case JpegConstants.APP_2:
					fs.readBytes(ba, 0, 12);
					break;
				case JpegConstants.APP_14:
					fs.readBytes(ba, 0, 5);
					break;
			}
			return ba;
		}
		
		private static function isEmpty(tag:uint):Boolean {
			switch(tag) {
				case JpegConstants.SOI:
				case JpegConstants.EOI:
					return true;
				default:
					return false;
			}
		}
		
		public static function toString(tag : uint) : String {
			switch(tag) {
				case JpegConstants.RST0:
					return "RST 0";
				case JpegConstants.RST1:
					return "RST 1";
				case JpegConstants.RST2:
					return "RST 2";
				case JpegConstants.RST3:
					return "RST 3";
				case JpegConstants.RST4:
					return "RST 4";
				case JpegConstants.RST5:
					return "RST 5";
				case JpegConstants.RST6:
					return "RST 6";
				case JpegConstants.RST7:
					return "RST 7";
				case JpegConstants.DNL:
					return "DNL";
				case JpegConstants.SOI:
					return "SOI";
				case JpegConstants.EOI:
					return "EOI";
				case JpegConstants.SOS:
					return "SOS";
				case JpegConstants.COM:
					return "COM";
				case JpegConstants.SOF0:
					return "SOF 0";
				case JpegConstants.SOF1:
					return "SOF 1";
				case JpegConstants.SOF2:
					return "SOF 2";
				case JpegConstants.SOF3:
					return "SOF 3";
				case JpegConstants.SOF5:
					return "SOF 5";
				case JpegConstants.SOF6:
					return "SOF 6";
				case JpegConstants.SOF7:
					return "SOF 7";
				case JpegConstants.SOF9:
					return "SOF 9";
				case JpegConstants.SOF10:
					return "SOF 10";
				case JpegConstants.SOF11:
					return "SOF 11";
				case JpegConstants.SOF13:
					return "SOF 13";
				case JpegConstants.SOF14:
					return "SOF 14";
				case JpegConstants.SOF15:
					return "SOF 15";
				case JpegConstants.DHT:
					return "DHT";
				case JpegConstants.DQT:
					return "DQT";
				case JpegConstants.DHP:
					return "DHP";
				case JpegConstants.DRI:
					return "DRI";
				case JpegConstants.DAC:
					return "DAC";
				case JpegConstants.APP_0:
					return "APP 0";
				case JpegConstants.APP_1:
					return "APP 1";
				case JpegConstants.APP_2:
					return "APP 2";
				case JpegConstants.APP_3:
					return "APP 3";
				case JpegConstants.APP_4:
					return "APP 4";
				case JpegConstants.APP_5:
					return "APP 5";
				case JpegConstants.APP_6:
					return "APP 6";
				case JpegConstants.APP_7:
					return "APP 7";
				case JpegConstants.APP_8:
					return "APP 8";
				case JpegConstants.APP_9:
					return "APP 9";
				case JpegConstants.APP_10:
					return "APP 10";
				case JpegConstants.APP_11:
					return "APP 11";
				case JpegConstants.APP_12:
					return "APP 12";
				case JpegConstants.APP_13:
					return "APP 13";
				case JpegConstants.APP_14:
					return "APP 14";
				case JpegConstants.APP_15:
					return "APP 15";				
			}
			return tag.toString(16);
		}
	}
}