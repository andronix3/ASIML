package com.imagero.meta.tiff
{	
	/**
	 * Enumeration of TIFF data types.
	 * 
	 */
	public class DataType {

		public static const ANY			:uint = 0;
		public static const BYTE		:uint = 1;
		public static const ASCII		:uint = 2;
		public static const SHORT		:uint = 3;
		public static const LONG		:uint = 4;
		public static const RATIONAL	:uint = 5;
		public static const SBYTE		:uint = 6;
		public static const UNDEFINED	:uint = 7;
		public static const SSHORT		:uint = 8;
		public static const SLONG		:uint = 9;
		public static const SRATIONAL	:uint = 10;
		public static const FLOAT		:uint = 11;
		public static const DOUBLE		:uint = 12;
		public static const IFD			:uint = 13;
		
		public static function toString(a : uint) : String {
			switch(a) {
				case ANY:
					return "ANY";
				case BYTE:
					return "BYTE";
				case ASCII:
					return "ASCII";
				case SHORT:
					return "SHORT";
				case LONG:
					return "LONG";
				case RATIONAL:
					return "RATIONAL";
				case SBYTE:
					return "SBYTE";
				case UNDEFINED:
					return "UNDEFINED";
				case SSHORT:
					return "SSHORT";
				case SLONG:
					return "SLONG";
				case SRATIONAL:
					return "SRATIONAL";
				case FLOAT:
					return "FLOAT";
				case DOUBLE:
					return "DOUBLE";
				case IFD:
					return "IFD";
				default:
					return null;
			}
		}
	}
}