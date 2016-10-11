package com.asiml.meta
{
	/**
	 * MetadataClass defines some metadata types.
	 * 
	 */
	public final class MetadataClass {
		public static const IPTC : MetadataClass = new MetadataClass().setType0("IPTC");
		public static const TIFF : MetadataClass = new MetadataClass().setType0("TIFF");
		public static const EXIF : MetadataClass = new MetadataClass().setType0("EXIF").setParent0(TIFF);
		public static const GPS : MetadataClass = new MetadataClass().setType0("GPS");
		public static const INTER_OP : MetadataClass = new MetadataClass().setType0("INTEROP");
		
		//public static const XMP : String = "XMP";

		private var _type : String;
		private var _parent : MetadataClass;
		
		private function setType0(type : String): MetadataClass {
			this._type = type;
			return this;	
		}
		
		private function setParent0(parent : MetadataClass) : MetadataClass {
			this._parent = parent;
			return this;
		}
		
		public function toString() : String {
			return _type;
		}
		
		public function get type() : String {
			return _type;
		}
		
		public function get parent() : MetadataClass {
			return _parent;
		}
	}
}