package com.imagero.meta.tiff
{
	import mx.collections.ArrayCollection;

	/**
	 * IFDEntryMeta - defines IFD entry properties.
	 * 
	 */
	public class IFDEntryMeta {
		
		private static var _unknown : IFDEntryMeta;
		
		internal static function get unknown() : IFDEntryMeta {
			if(_unknown == null) {
				_unknown = new IFDEntryMeta("Unknown", 0);
			}
			return _unknown;
		} 
		
		private static var _dictionary : Object;
				
	    private var _name			:String;
	    private var _tag			:uint;
	    private var count			:uint;
	    
	    private var pointer			:Boolean;
	    private var ifdPointer		:Boolean;
	    
	    private var dataTypes 		:Array = new Array();
	    
	    private var _category : String;
	    
	    protected const values : ArrayCollection = new ArrayCollection();
	    protected const descriptions : Object = new Object();
		
	    internal function setName(name:String) :IFDEntryMeta {
	    	this._name = name;
	    	return this;
	    }
	    
	    internal function setTag(tag :uint) :IFDEntryMeta {
	    	this._tag = tag;
	    	return this;
	    }
	    
	    internal function setCount(count :uint) :IFDEntryMeta {
	    	this.count = count;
	    	return this;
	    }
	    
	    internal function setPointer(pointer :Boolean) :IFDEntryMeta {
	    	this.pointer = pointer;
	    	return this;
	    }
	    	    
	    internal function setIfdPointer(ptr : Boolean):IFDEntryMeta {
	    	ifdPointer = ptr;
	    	return this;
	    }
	    
	    internal function addValue(value :Number, description : String) : IFDEntryMeta {
	    	values.addItem(value);
	    	descriptions[value.toString()] = description;
	    	return this;
	    }
	    
	    internal function addDataType(dataType : uint) :IFDEntryMeta {
	    	dataTypes[dataTypes.length] = dataType;
	    	return this;
	    }
	    
	    public function getDescription(value :Number) : String {
	    	return descriptions[value.toString()];
	    }
	    
	    public function isValidDataType(dataType : uint) : Boolean {
	    	for(var i : int = 0; i < dataTypes.length; i++) {
	    		if(dataType == dataTypes[i]) {
	    			return true;
	    		}
	    	}
	    	return false;
	    }
		
	    public function IFDEntryMeta(name : String, tag : uint, count : uint = 0, cat: String = "TIFF") {
	        this._name = name;
	        this._tag = tag;
	        this.count = count;
	        this._category = cat;
	        if(_dictionary == null) {
	        	_dictionary = new TiffMetaDictionary().dictionary;
	        }
	    }
	    
	    public static function get dictionary() : Object {
	    	if(_dictionary == null) {
	    		_dictionary = new TiffMetaDictionary().dictionary;
	    	}
	    	return _dictionary;
	    }

	    public function get tag() : uint {
	    	return _tag;
	    }
	    
	    public function get category() : String {
	    	return _category;
	    }
	    
	    public function get name() : String {
	    	return _name;
	    }
	}
}