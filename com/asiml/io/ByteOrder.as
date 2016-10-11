package com.asiml.io
{
	import flash.utils.Endian;

	/**
	 * @private
	 * 
	 */	
	public final class ByteOrder {

		public static const BIG_ENDIAN : uint = 0x4D4D;
		public static const LITTLE_ENDIAN : uint = 0x4949;
		
		public static function toEndian(byteOrder : uint) : String {
			switch(byteOrder) {
				case BIG_ENDIAN:
					return Endian.BIG_ENDIAN;
				case LITTLE_ENDIAN:
					return Endian.LITTLE_ENDIAN;
				default:
					throw new ArgumentError("Unknown byte order:" + byteOrder + " (" + BIG_ENDIAN + " or " + LITTLE_ENDIAN + " expected)"); 
			}
		}
	}
}