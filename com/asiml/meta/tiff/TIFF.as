package com.asiml.meta.tiff
{
	import com.asiml.io.ByteOrder;
	
	import flash.errors.IOError;
	
	/**
	 * @private
	 * 
	 */
	public class TIFF {
		
		private var _byteOrder : uint;
		private var number42 : uint;
		private var offset : uint;
				
		private var root : ImageFileDirectory;
		
		public function get Root() : ImageFileDirectory {
			return root;
		}
		
		public function TIFF() {

		}
		
		internal function setRoot(ifd : ImageFileDirectory) : void {
			this.root = ifd;
		}
		
		internal function setByteOrder(byteOrder : uint) : void {
			switch(byteOrder) {
				case 0x4D4D:
				case 0x4949:
					this._byteOrder = byteOrder;
					break;
				default:
					throw new IOError("Wrong byte order");
			}
		}
		
		internal function get byteOrder() : uint {
			return _byteOrder;
		}
		
		internal function setNumber42(n42 : uint) :void {
			if(n42 != 42) {
				throw new IOError("Wrong magic number");				
			}
			this.number42 = n42;
		}
		
		internal function setFirstOffset(offset : uint) : void {
			this.offset = offset;
		}
		
		public function get Endian() : String {
			return ByteOrder.toEndian(_byteOrder);
		}
	}
}