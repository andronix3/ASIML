package com.asiml.meta.jpeg
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
		private var css: Array = new Array();
		
		public function SOFMarker(m : Marker) {
			m.data.position = 0;
			P = m.data.readUnsignedByte();
			Y = m.data.readUnsignedShort();
			X = m.data.readUnsignedShort();
			Nf = m.data.readUnsignedByte();
			
			var i: int = 0;
			for (; i < Nf; i++) {
            	css.push(ComponentSpecification.read(m.data));
        	}
		}
		
		public function get width() : uint {
			return X;
		}
		
		public function get height() : uint {
			return Y;
		}
		
		public function getComponentCount() : uint {
			return Nf;
		}
		
		public function getCiString(): String {
        	var s : String = "";
        	for (var i : int = 0; i < Nf; i++) {
            	var cs: ComponentSpecification = css[i];
            	if(cs.Ci > 10) {
                	s += String.fromCharCode(cs.Ci);
            	}
            	else {
                	s += cs.Ci;
            	}
        	}
        	return s;
    	}
	}
}