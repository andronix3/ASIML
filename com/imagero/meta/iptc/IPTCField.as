package com.imagero.meta.iptc
{
	import flash.utils.ByteArray;
	import flash.utils.IDataOutput;
	

	public class IPTCField {
	    private var _meta : IPTCFieldMeta;
	    private var tostring : String;
	
	    private var _record : uint;
	    private var _dataset : uint;
	    private var _data : ByteArray;
	
	    private var _offset : uint;
	
		/**
		 * Create iptc field.
		 * 
		 * @param meta IPTCFieldMeta
		 * @param data ByteArray containing data for iptc field
		 */
	    public function IPTCField(meta : IPTCFieldMeta, data : ByteArray) {
	        this._record = meta.record;
	        this._dataset = meta.dataset;
	        this._data = data;
	    }
	
		/**
		 * Save this iptc field to IDataOutput.
		 * 
		 */
	    public function writeTo(out : IDataOutput) : void {
	        out.writeByte(IPTCConstants.TAG_MARKER);
	        out.writeByte(_record);
	        out.writeByte(_dataset);
	        var len : Number = _data.length;

	        var maxSize : Number = meta.maxSize;
	        if (len > maxSize) {
	            len = maxSize;
	        }
	        if (len > 32767) {
	            out.writeByte(128);
	            
            	var bin : uint = getBytesInNumber(len);
                out.writeByte(bin);
				
				var tmp : Array = new Array();
				for(var i : uint = 0; i < bin; i++) {
					tmp.push((len >> (i * 8)) & 0xFF); 
				}
				tmp = tmp.reverse();
				for each(var n : uint in tmp) {
					out.writeByte(n);
				}
	        }
	        else {
	            out.writeByte((int) (len >> 8) & 0xFF);
	            out.writeByte((int) (len & 0xFF));
	        }
	        out.writeBytes(_data, 0, len);
	    }
	    
	    private static function getBytesInNumber(n : Number) : uint {
	    	var len : uint = 0;
	    	while(n > 0) {
	    		n = n >> 8;
	    		len++;
	    	}
	    	return len;
	    }
	
		/**
		 * Get record number for this iptc field.
		 * 
		 */
	    public function get record() : uint {
	        return _record;
	    }
	
		/**
		 * Get dataset number of this iptc field.
		 * 
		 */
	    public function get dataset() : uint {
	        return _dataset;
	    }
	
	    /**
	     * get data of iptc field
	     * @return byte array
	     */
	    public function get data() : ByteArray {
	        return _data;
	    }
		
		/**
		 * Get meta for this IPTC field
		 * 
		 */
	    public function get meta() : IPTCFieldMeta {
	        if (_meta == null) {
	            this._meta = IPTCFieldMeta.getMeta(_record + ":" + _dataset);
	        }
	        return _meta;
	    }
	    
	   /**
	    * get XML representation of this iptc field
	    * 
	    */
	    public function get xml() : XML {
	    	var entry : XML = <entry></entry>;
	    	entry.record = record.toString();
	    	entry.dataset = dataset.toString()
	    	entry.value = toString();
	    	return entry; 
	    }
		
		/**
		 * Get data from this IPTC field as String. 
		 * 
		 */
	    public function toString() : String {
	        if (tostring == null) {
	            tostring = new String(_data);
	        }
	        return tostring;
	    }
	}
}