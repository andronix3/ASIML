package com.imagero.meta.jpeg
{
	
	/**
	 * @private
	 * 
	 * JPEG SOFMarker (Start Of Frame).
	 * 
	 */
	public class SOFMarker {
		
		private var P  : uint;
		private var Y  : uint;
		private var X  : uint;
		private var Nf : uint;
		
		public function SOFMarker(m : Marker) {
			m.data.position = 0;
			P = m.data.readUnsignedByte();
			Y = m.data.readUnsignedShort();
			X = m.data.readUnsignedShort();
			Nf = m.data.readUnsignedByte();
		}
		
		public function get width() : uint {
			return X;
		}
		
		public function get height() : uint {
			return Y;
		}
	}
}