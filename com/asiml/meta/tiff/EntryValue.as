package com.asiml.meta.tiff
{
	import com.asiml.meta.tiff.type.*;
	
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;
	
	/**
	 * EntryValue encapsulates reading of TIFF values.
	 * 
	 */
	public class EntryValue {
		private var count : uint;
		internal var type : uint;
		internal var values:Array = new Array();
		private var str : String;
		
		public function EntryValue(cnt:uint) {
			count = cnt;
			values = new Array();
		}
		
		public function toString() : String {
			if(str == null) {
				str = createString();
			}
			return str;
		}
		
		protected function createString() : String {
			switch(type) {
				case DataType.ANY:
				case DataType.BYTE:
				case DataType.SBYTE:
				case DataType.ASCII:
				 	var ba : ByteArray = new ByteArray();
					for each(var t : TByte in values) {
						t.write(ba);
					}
					ba.position = 0;
					return ba.toString();
				case DataType.UNDEFINED:
					var isString : Boolean = true;
					for each(var tb : TByte in values) {
						if(tb.value < 32) {
							isString = false;
							break;
						}
					}
					if(isString) {
				 		var bs : ByteArray = new ByteArray();
						for each(var ts : TByte in values) {
							ts.write(bs);
						}
						bs.position = 0;
						return bs.toString();						
					}
					else {
						var su  : String = "";
						for each(var tu : TByte in values) {
							su += tu.toHexString();
						}
						return su;
					}
				default:
					var s : String = "";
					if(values.length > 1) {
						s +="[";
					}
					for each(var n : TNumber in values) {
						s += n.toString();
						s += ", ";
					}
					s = s.substr(0, s.length - 2);
					if(values.length > 1) {
						s +="]";
					}
					return s;
			}
		}
		
		public static function read(count:uint, type:uint, fs:IDataInput):EntryValue {
			var ev : EntryValue = new EntryValue(count);
			ev.type = type;
			
			for(var i	:uint = 0; i < count; i++) {
				var tn	:TNumber = Utils.create(type);
				tn.read(fs);
				ev.values.push(tn);
			}
			return ev;
		}
	}
}