package com.imagero.meta.psd
{
	import com.imagero.io.InputStream;
	
	import flash.errors.IOError;
	import flash.utils.ByteArray;

	/**
	 * ImageResourceBlock encapsulates Adobe <sup>(TM)</sup> image resource block.
	 * Used in PSD files and in JPEG files (in APP13 block).  
	 * 
	 */
	public class ImageResourceBlock {
		
		public static const IPTC : uint = 0x0404;
		public static const EXIF : uint = 0x0422;
		public static const XMP  : uint = 0x0424;
		public static const THUMB1  : uint = 0x0409;
		public static const THUMB2  : uint = 0x040C;
		
		
		public static const IDENTIFIER : uint = 0x3842494D;
		
		private var _type : uint;
		private var nameLength: uint;
		private var name : String;
		private var _size : uint;
		
		internal var _data : ByteArray;
		
		internal static var dictionary : Object; 
		
		public function ImageResourceBlock() {
			if(dictionary == null) {
				dictionary = new IRBDictionary().dictionary;
			}
		}
		
		public function get data() : ByteArray {
			return _data;
		}
		
		public function get type() : uint {
			return _type;
		}
		
		public function get size() : uint {
			return _size;
		}
		
		public static function read(input : InputStream) : ImageResourceBlock {
			var ident : uint = input.readInt();
			if(ident != IDENTIFIER) {
				throw new IOError("Not Image Resource Block");
			}
			var type : uint = input.readShort();
			var name : String = null;
			
			var nameLength : uint = input.readByte();
			if(nameLength == 0) {
				input.readByte();
				nameLength = 2;
			}
			else {
				if ((nameLength & 1) == 0) {
                	nameLength++;
            	}
            	var tmp : ByteArray = new ByteArray();
            	for(var i : uint = 0; i < nameLength; i++) {
            		tmp.writeByte(input.readByte());
            	}
            	tmp.position = 0;
            	name = tmp.readMultiByte(nameLength, "iso-8859-1");
			}
			var size : uint = input.readInt();
			var data : ByteArray = new ByteArray();
			input.readBytes(data, 0, size);
			if ((size % 2) != 0) {
            	input.readByte();
        	}
        	
        	var irb : ImageResourceBlock = new ImageResourceBlock();
        	
        	irb._type = type; 
        	irb._size = size;
        	irb.nameLength = nameLength;
        	irb.name = name;
        	irb._data = data;
        	
        	return irb;
		}
		
		public function get xml() : XML {
			var irb : XML = <ImageResourceBlock></ImageResourceBlock>;
			irb.type = _type;
			var tag : IRBTag = IRBTag (dictionary["" + _type]);
			var name :String;
			if(tag == null) {
				if(type > 0x07D0 && _type < 0x0BB6) {
					name = "SAVED_PATH";
				}
				else {
					name = "UNKNOWN";
				}
			}
			else {
				name = tag.name;
			}
			irb.description = name;
			if(nameLength > 2) {
				irb.name = escape(name);
			}
			irb.size = _size;
			return irb;
		}
	}
}