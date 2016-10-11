package com.asiml.meta.iptc
{
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;
	
	/**
	 * IPTCParser - used to parse stream with iptc data.
	 * 
	 */
	public class IPTCParser {
		
		public static function parse(stream: IDataInput, dest : IPTC) : void {
			try {
				while(true) {
					var entry : IPTCField = readEntry(stream);
					dest.entries.push(entry);
				}
			}
			catch(error : IOError) {
				//ignore
			}
		}
		
		private static function readEntry(stream: IDataInput) : IPTCField {
	        var tag: uint = stream.readUnsignedByte();
	        if(tag != IPTCConstants.TAG_MARKER) {
	        	throw new IOError("Not IPTC Marker");
	        }
	        var record: uint = stream.readUnsignedByte();
	        var dataSet: uint = stream.readUnsignedByte();
			
	        var byte4 : uint = stream.readUnsignedByte();
	        var byte5 : uint = stream.readUnsignedByte();
	        
	        var tagLength : uint = 5;
	        var dataLength : uint = 0;
	        
	        if ((byte4 & 0x80) != 0) {
	            var m : uint = ((byte4 & 0x7F) << 8) | byte5;
				tagLength += m;
	            for (var i : int = m; i >= 0; --i) {
	                var nextByte : uint = stream.readUnsignedByte();
					dataLength = (dataLength << 8) | nextByte;
	            }
	        }
	        else {
	            dataLength = (byte4 << 8) | byte5;
	        }
	        
	        var data : ByteArray = new ByteArray();
	        stream.readBytes(data, 0, dataLength);
	        
	        var meta : IPTCFieldMeta = IPTCFieldMeta.getMeta(record + ":" + dataSet);
	        return new IPTCField(meta, data);
	    }
	}
}