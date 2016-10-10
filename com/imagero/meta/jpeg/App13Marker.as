package com.imagero.meta.jpeg
{
	import com.imagero.io.InputStream;
	import com.imagero.io.SequenceInputStream;
	import com.imagero.meta.iptc.*;
	import com.imagero.meta.psd.ImageResourceBlock;
	import com.imagero.meta.psd.ThumbnailResource;
	
	import flash.display.Bitmap;
	import flash.errors.IOError;


	/**
	 * @private
	 * 
	 */
	public class App13Marker {
		
		private var markers : Array = new Array();
		private var dictionary : Object = new Object();
		private var valid : Boolean;
		
		private var _irbs : Array = new Array();
		private var _iptc : IPTC = new IPTC();
		private var _exif : EXIF;
		private var xmp : XML;
		private var _thumbnail : Bitmap;
		
		public function App13Marker() {
			
		}
		
		internal function add(m : Marker) : void {
			markers.push(m);
			valid = false;
		}
		
		public function get irbs() : Array {
			if(!valid) {
				read();
			}
			return _irbs.slice();
		}
		
		public function getIRB(type : uint) : ImageResourceBlock {
			if(!valid) {
				read();
			}
			return dictionary["" + type];
		}
		
		public function get thumbnail() : Bitmap {
			if(!valid) {
				read();
			}
			return _thumbnail;
		}
		
		public function get iptc() : IPTC {
			if(!valid) {
				read();
			}
			return _iptc;
		}
		
		protected function read() : void {
			if(markers.length == 0) {
				return;
			}
			_irbs = new Array();
			var bas : Array = new Array();
			for each(var m : Marker in markers) {
				bas.push(m.data);
			}
			var stream : InputStream = new SequenceInputStream(bas);
			while(true) {
				try {
					var irb : ImageResourceBlock = ImageResourceBlock.read(stream);
					_irbs.push(irb);
					dictionary["" + irb.type] = irb;
				}
				catch(error : IOError) {
					break;
				}
			}
			var iptcIRB : ImageResourceBlock = dictionary["" + ImageResourceBlock.IPTC];
			if(iptcIRB != null) {
				iptcIRB.data.position = 0;
				IPTCParser.parse(iptcIRB.data, _iptc);
			}
			var thumbIRB : ImageResourceBlock = dictionary["" + ImageResourceBlock.THUMB1];
			if(thumbIRB == null) {
				thumbIRB = dictionary["" + ImageResourceBlock.THUMB2];
			}
			if(thumbIRB != null) {
				thumbIRB.data.position = 0;
				var irbThumb : ThumbnailResource = new ThumbnailResource(thumbIRB.data);
				var thumbnail : Bitmap = irbThumb.thumbnail;
				dictionary["thumbnail"] = thumbnail;
			}
			var exifIRB : ImageResourceBlock = dictionary["" + ImageResourceBlock.EXIF];
			if(exifIRB != null) {
				exifIRB.data.position = 0;
				var ifds : Array = new Array();
				_exif = new EXIF(exifIRB.data); 
			}
		}
		
		public function print() : void {
			trace(xml);
		}
		
		public function get xml() : XML {
			var a13 : XML = <Marker></Marker>;
			a13.tag = JpegConstants.APP_13.toString();
			a13.type = "APP13";
			for each(var irb : ImageResourceBlock in irbs) {
				var irbx : XML = irb.xml;
				switch(irb.type) {
					case ImageResourceBlock.IPTC:
						irbx.appendChild(iptc.xml);
						break;
					case ImageResourceBlock.EXIF:
						irbx.appendChild(_exif);
						break;
						
				}
				a13.appendChild(irbx);
			}
			return a13;
		}
	}
}