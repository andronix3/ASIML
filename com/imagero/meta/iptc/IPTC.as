package com.imagero.meta.iptc
{
	/**
	 * @private
	 * 
	 */	
	public class IPTC {
		
		private var _entries : Array = new Array();
		
		public function IPTC() {
		}

		public function get entries() : Array {
			return _entries;
		}
		
		public function get xml() : XML {
			var iptc : XML = <IPTC></IPTC>;
			var es : XML = <entries></entries>;
			for each(var entry : IPTCField in _entries) {
				es.appendChild(entry.xml);
			}
			iptc.appendChild(es);
			return iptc;
		}
	}
}