package com.asiml.meta.iptc
{
	/**
	 * UnknownIPTCFieldMeta - used only if we can't find appropriate IPTCFieldMeta for given field.
	 * 
	 */
	public class UnknownIPTCFieldMeta extends IPTCFieldMeta
	{
		public function UnknownIPTCFieldMeta(record : uint, dataset : uint) {
            super(record, dataset, IPTCFieldMeta.UNKNOWN, 0, false, 1);
        }

        override public final function get type() : uint {
            return IPTCFieldMeta.TYPE_UNKNOWN;
        }		
	}
}