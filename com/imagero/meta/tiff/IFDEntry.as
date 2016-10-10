package com.imagero.meta.tiff
{
	import com.imagero.meta.MetadataClass;
	
	/**
	 * IFDEntry represents TIFF IFD entry.
	 * 
	 */
	public class IFDEntry {
				
		private var _tag			:uint;
    	private var _type			:uint;
    	private var _count			:uint;		
		private var _valueOffset	:uint;
		
		private var _category   	:MetadataClass;
		
		private var _value 			:EntryValue;
		
		public function IFDEntry(tag:uint, type : uint, count:uint, valueOffset:uint, cat : MetadataClass = null, val : EntryValue = null) {
			this._tag = tag;
			this._type = type;
			this._count = count;
			this._valueOffset = valueOffset;
			this._category = cat != null? cat : MetadataClass.TIFF;
		}
		
		/**
		 * Get IFDEntry tag.
		 * 
		 */
		public function get tag():uint {
			return _tag;  
		}
		
		/**
		 * Get length of this entry data.
		 * 
		 */
		public function get count():uint {
			return _count;  
		}
		
		/**
		 * Get value of this IFD entry
		 * 
		 */
		public function get value():EntryValue {
			return _value;
		}
		
		/**
		 * Get type of entry data.
		 * 
		 * @see TIFFConstants
		 * 
		 */
		public function get type():uint {
			return _type;
		}
		
		/**
		 * Get value or value offset.
		 * If length of value is less or equals to 4 then it saved in valueOffset, otherwise valueOffset contains offset (from file begin) of value. 
		 * 
		 */
		public function get valueOffset():uint {
			return _valueOffset;
		}
		
		/**
		 * Determine if valueOffset contains data or offset to data.
		 * 
		 */
		public function isOffset(): Boolean {
			return type == DataType.IFD || Utils.getFieldLength(_type) * _count > 4;
		}
		
		/**
		 * Get IFD entry meta for this entry.
		 * 
		 */
		public function get meta() : IFDEntryMeta {
			return getMeta0(_category);
		}
		
		/**
		 * @private
		 * 
		 */
		internal function getMeta0(cat : MetadataClass) : IFDEntryMeta {
			if(cat == null) {
				return IFDEntryMeta.unknown;
			}
			var dict : Object = IFDEntryMeta.dictionary;
			var m : IFDEntryMeta = dict[cat.type + "::" + _tag];
			if(m != null) {
				return m;
			}
			return getMeta0(cat.parent);
		}
		
		/**
		 * Get metadata category.
		 * 
		 * @see com.imagero.meta.MetadataClass
		 * 
		 */
		public function get category() : MetadataClass {
			return _category;
		}
		
		/**
		 * @private
		 * 
		 */
		internal function setCategory0(cat : MetadataClass) : void {
			this._category = cat;
		}
		
		/**
		 * @private
		 * 
		 */
		internal function setValue(value : EntryValue) : void {
			this._value = value;
		}
		
		/**
		 * @private
		 * 
		 */
		public function print() : void {
			var name :String = "unknown";
			if(meta != null) {
				name = meta.name;
			}
			trace("    IFDEntry:");
			trace("        Tag: " + _tag.toString(16) + " [" + name + "]");
			trace("        Type: " + DataType.toString(_type));
			trace("        Count: " + _count);
			trace("        Value: " + _value.toString());
			if(!isOffset() && count == 1) {
				trace("        Description: " + meta.getDescription((_value.values[0]).value));
			}
		}
		
		/**
		 * @private
		 * 
		 */
		public function get xml2() : XML {
			var e : XML = <entry></entry>;
			e.tag = _tag.toString();
			e.name = meta.name;
			e.fieldType = DataType.toString(_type);
			e.count = _count;
			e.value = _value.toString();
			if(!isOffset() && count == 1) {
				var descr : String = meta.getDescription((_value.values[0]).value);
				if(descr != null) {
					e.description = descr;
				}
			}
			return e;
		}

		/**
		 * Convert this entry to XML.
		 * 
		 */
		public function get xml() : XML {
			var e : XML = <entry></entry>;
			e.tag = _tag.toString();
			e.name = meta.name;
			e.value = _value.toString();
			if(!isOffset() && count == 1) {
				var descr : String = meta.getDescription((_value.values[0]).value);
				if(descr != null) {
					e.description = descr;
				}
			}
			return e;
		}
	}
}