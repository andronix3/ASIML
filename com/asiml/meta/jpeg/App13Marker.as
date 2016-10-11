/**
 // NOTE: prolabsolutions changes made to this file
 // Search for "// prolabsolutions changes"
 **/
/*
 * 
 *
 * 
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  o Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 *  o Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 *  o Neither the name of Andrey Kuznetsov nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package com.asiml.meta.jpeg
{
	import com.asiml.io.InputStream;
	import com.asiml.io.SequenceInputStream;
	import com.asiml.meta.iptc.*;
	import com.asiml.meta.psd.ImageResourceBlock;
	import com.asiml.meta.psd.ThumbnailResource;
	
	import flash.display.Bitmap;
	import flash.errors.IOError;
	import flash.utils.Endian;


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
		
		public function get exif() :EXIF {
			if(!valid) {
				read();
			}
			return _exif;
		}
		
		protected function read() : void {
			//********************************************************
			// prolabsolutions changes
			// NO MORE TRACE STATEMENTS
			//********************************************************
			// trace("read");
			if(markers.length == 0) {
				return;
			}
			_irbs = new Array();
			var bas : Array = new Array();
			for each(var m : Marker in markers) {
				bas.push(m.data);
			}
			var stream : InputStream = new SequenceInputStream(bas);
			stream.endian = Endian.BIG_ENDIAN;
			while(true) {
				try {
					var irb : ImageResourceBlock = ImageResourceBlock.read(stream);
					_irbs.push(irb);
					dictionary["" + irb.type] = irb;
					//********************************************************
					// prolabsolutions changes
					// NO MORE TRACE STATEMENTS
					//********************************************************
					// trace("IRB " + irb.type);
				}
				catch(error : IOError) {
					//********************************************************
					// prolabsolutions changes
					// NO MORE TRACE STATEMENTS
					//********************************************************
					// trace("App13Marker::read");
					// trace(error.message)
					// trace(error.getStackTrace());
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
				_thumbnail = irbThumb.thumbnail;
			}
			var exifIRB : ImageResourceBlock = dictionary["" + ImageResourceBlock.EXIF];
			if(exifIRB != null) {
				exifIRB.data.position = 0;
				var ifds : Array = new Array();
				_exif = new EXIF(exifIRB.data); 
			}
			valid = true;
		}
		
		public function print() : void {
			//********************************************************
			// prolabsolutions changes
			// NO MORE TRACE STATEMENTS
			//********************************************************
			trace("print::App13Marker");
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