package com.imagero.meta.tiff
{
	import com.imagero.meta.MetadataClass;
	import com.imagero.meta.tiff.type.TByte;
	import com.imagero.meta.tiff.type.TDouble;
	import com.imagero.meta.tiff.type.TFloat;
	import com.imagero.meta.tiff.type.TLong;
	import com.imagero.meta.tiff.type.TNumber;
	import com.imagero.meta.tiff.type.TRational;
	import com.imagero.meta.tiff.type.TShort;
	
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;
	
	/**
	 * @private
	 * 
	 */
	public final class Utils { 
		internal static function getFieldLength(type:uint):uint {
        	switch (type) {
            	case DataType.BYTE:
            	case DataType.SBYTE:
            	case DataType.ASCII:
            	case DataType.UNDEFINED:
                	return 1;
            	case DataType.SHORT:
            	case DataType.SSHORT:
	                return 2;
    	        case DataType.LONG:
        	    case DataType.SLONG:
            	case DataType.FLOAT:
	            case DataType.IFD:
    	            return 4;
        	    case DataType.RATIONAL:
            	case DataType.SRATIONAL:
	            case DataType.DOUBLE:
    	            return 8;
        	    default:
            	    return 1;
	        }
    	}
    	
    	internal static function readValueOffset(length:uint, fs:IDataInput):uint {
    		var result:uint;

    		switch(length) {
    			case 1:
    				result = fs.readUnsignedByte();
    				skip(fs, 3);
    				break;
    			case 2:
					result = fs.readUnsignedShort();
					skip(fs, 2);
    				break;
    			default:
    				result = fs.readUnsignedInt();
    				break;
    		}
    		return result;
    	}
    	
    	private static function skip(fs:IDataInput, count:uint):void {
    		for(var i:uint = 0; i < count; i++) {
    			fs.readByte();
    		}
    	}

		internal static function readEntry(stream:IDataInput):IFDEntry {
			
			var tag			:uint = stream.readUnsignedShort();
			var type		:uint = stream.readUnsignedShort();
			var count		:uint = stream.readUnsignedInt();
			var valueLength	:uint = getFieldLength(type) * count;
			var rvo : ByteArray = new ByteArray();
			rvo.endian = stream.endian;
			stream.readBytes(rvo, 0, 4);
			rvo.position = 0;
			var valueOffset	:uint = readValueOffset(valueLength, rvo);
			
			var entry : IFDEntry = new IFDEntry(tag, type, count, valueOffset);
			
			if(entry.isOffset()) {
				if(stream is FileStream) {
					var fs:FileStream = FileStream (stream);
					var fsPos:Number = fs.position;
					fs.position = valueOffset;
					entry.setValue(EntryValue.read(count, type, fs));
					fs.position = fsPos;
				}
				else if(stream is ByteArray) {
					var ba:ByteArray = ByteArray (stream);
					var baPos:Number = ba.position;
					ba.position = valueOffset;
					entry.setValue(EntryValue.read(count, type, ba));
					ba.position = baPos;
				}
			}
			else {
				rvo.position = 0;
				entry.setValue(EntryValue.read(count, type, rvo));
			}
			return entry;
		}
		
		internal static function create(dataType:uint):TNumber {

			switch(dataType) {
				case DataType.ANY:
				case DataType.BYTE:
				case DataType.SBYTE:
				case DataType.ASCII:
				case DataType.UNDEFINED:
					return new TByte();
				case DataType.SHORT:
				case DataType.SSHORT:
					return new TShort();
				case DataType.LONG:
				case DataType.SLONG:
				case DataType.IFD:
					return new TLong();
				case DataType.RATIONAL:
				case DataType.SRATIONAL:
					return new TRational();
				case DataType.FLOAT:
					return new TFloat();
				case DataType.DOUBLE:
					return new TDouble();
				default:
					throw new ArgumentError();
			}
		}
		
		public static function readIFD(fs:IDataInput, cat: MetadataClass = null) : ImageFileDirectory {

			var res	:ImageFileDirectory = new ImageFileDirectory();
			res.setCategory0(cat != null? cat : MetadataClass.TIFF);
			var entryCount : uint = fs.readUnsignedShort();
			res.setEntryCount(entryCount);
			
			for(var i:uint = 0; i < res.entryCount; i++) {
				var entry:IFDEntry = Utils.readEntry(fs);
				res.addEntry(entry);
			}
			
			res.setNextIFDOffset(fs.readUnsignedInt());
			//res.print();
			return res;
		}
		
/* 		public static function readIFD_BA(fs:ByteArray, categorie : String = "default") : ImageFileDirectory {
			var res	:ImageFileDirectory = new ImageFileDirectory();
			var entryCount : uint = fs.readUnsignedShort();
			res.setEntryCount(entryCount);
			
			for(var i:uint = 0; i < res.EntryCount; i++) {
				var entry:IFDEntry = Utils.readEntry(fs);
				res.addEntry(entry);
				entry.print();
			}
			
			res.setNextIFDOffset(fs.readUnsignedInt());
			return res;
		} */
		
		internal static function readTIFF_FS(fs : FileStream) : TIFF {

			var tif : TIFF = new TIFF();
			
			fs.position = 0;

			tif.setByteOrder(fs.readUnsignedShort());
			fs.endian = tif.Endian;
			tif.setNumber42(fs.readUnsignedShort());
			tif.setFirstOffset(fs.readInt());
			
			tif.setRoot(readIFD(fs)); 
			readNextFS(fs, tif.Root);
			
			return tif;
		}
		
		internal static function readTIFF_BA(fs : ByteArray) : TIFF {
			var tif : TIFF = new TIFF();
			
			fs.position = 0;
			
			var byteOrder : uint = fs.readUnsignedShort()
			tif.setByteOrder(byteOrder);
			fs.endian = tif.Endian;
			tif.setNumber42(fs.readUnsignedShort());
			tif.setFirstOffset(fs.readInt());
			
			tif.setRoot(readIFD(fs));
			readNextBA(fs, tif.Root);
			
			return tif;
		}
		
		private static function readNextFS(fs : FileStream, ifd : ImageFileDirectory) : void {
			var nextOffset : uint = ifd.nextOffset;
			while(nextOffset != 0) {
				fs.position = nextOffset;
				ifd.setNext(readIFD(fs));
				ifd = ifd.next;
				nextOffset = ifd.nextOffset;
			}
		}
		
		private static function readNextBA(fs : ByteArray, ifd : ImageFileDirectory) : void {

			var nextOffset : uint = ifd.nextOffset;
			while(nextOffset != 0) {
				fs.position = nextOffset;
				ifd.setNext(readIFD(fs));
				ifd = ifd.next;
				nextOffset = ifd.nextOffset;
			}
		}
	}
}