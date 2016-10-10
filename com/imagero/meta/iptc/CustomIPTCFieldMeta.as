package com.imagero.meta.iptc
{
	
	/**
	 * CustomIPTCEntryMeta is used to create user defined IPTC field meta.
	 * 
	 */
	public class CustomIPTCFieldMeta extends IPTCFieldMeta {
        public function CustomIPTCFieldMeta(record : uint, field : uint, name : String, maxSize : Number, repeatCount : uint) {
            super(record, field, name, maxSize, repeatCount > 0, repeatCount);
			_dictionary[name] = this;
			_dictionary[record + ":" + field] = this;
        }

        override public function get type() : uint {
            return TYPE_CUSTOM;
        }
    }
}