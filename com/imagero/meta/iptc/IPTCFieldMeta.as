package com.imagero.meta.iptc
{
	/**
	 * 
	 * IPTC field meta is format description for IPTC fields.
	 * 
	 */
	public class IPTCFieldMeta {
		
		public static const TYPE_DEFAULT : uint = 0;
	    public static const TYPE_UNKNOWN : uint = 1;
    	public static const TYPE_CUSTOM  : uint = 2;
    	
    	public static const UNKNOWN : String = "unknown";
    	
		protected static var _dictionary : Object;

	    private var _record : uint;
	    private var _dataset : uint;
	    private var _name : String;
	    private var _maxSize : Number;
	
	    private var _repeatCount : uint;
	    private var _repeatable : Boolean;
	    
	    /**
	     * get IPTCEntryMeta 
	     * @param s either name or String <record>:<dataset>
	     * so getMeta("Keywords") and getMeta("2:25") should give same result
	     * @return IPTCEntryMeta
	     * 
	     */
	    public static function getMeta(s : String) : IPTCFieldMeta {
	    	var meta : IPTCFieldMeta = dictionary[s];
	    	if(meta == null) {
	    		var index : int = s.indexOf(":");
	    		if(index > 0) {
	    			var record : uint = uint(s.substring(0, index));
	    			var dataset : uint = uint(s.substring(index + 1));
	    			meta = new UnknownIPTCFieldMeta(record, dataset);
	    		}
	    	}
	    	return _dictionary[s];
	    }
	
	    function IPTCFieldMeta(record : uint, dataset : uint, name : String, maxSize : Number, repeatable : Boolean, repeatCount : uint = 0) { 
	        this._record = record;
	        this._dataset = dataset;
	        this._name = name;
	        this._maxSize = maxSize;
	        this._repeatCount = repeatCount;
	        this._repeatable = repeatable;
	    }
	    
	   /**
	    * @ignore
	    * 
	    */
	    public static function get dictionary() : Object {
	        if(_dictionary == null) {
	        	_dictionary = new Object();
	        	new IPTCMetaDictionary();
	        }
	        return _dictionary;
	    }
	
	    public function get type(): uint {
	        return TYPE_DEFAULT;
	    }
	    
	   /**
	    * determine if this is custom iptc field meta
	    * 
	    */
	    public function isCustom() : Boolean {
	        return type == TYPE_CUSTOM;
	    }
	
		/**
		 * determine if iptc field is repeatable
		 * 
		 */
	    public function isRepeatable() : Boolean {
	        return _repeatable;
	    }

		/**
		 * get allowed repeat count for iptc field
		 * 
		 */
	    public function get repeatCount() : uint {
	        return _repeatCount;
	    }
	
		/**
		 * get dataset number
		 * 
		 */
	    public function get dataset() : uint {
	        return _dataset;
	    }
	
		/**
		 * get record number
		 * 
		 */
	    public function get record() : uint {
	        return _record;
	    }
	
		/**
		 * get field name
		 * 
		 */
	    public function get name() : String {
	        return _name;
	    }
	
		/**
		 * get max allowed length of iptc field
		 * 
		 */
	    public function get maxSize() : Number {
	        return _maxSize;
	    }
	}
}