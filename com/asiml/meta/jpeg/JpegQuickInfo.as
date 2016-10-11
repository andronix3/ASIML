package com.asiml.meta.jpeg {
	
	import flash.errors.IOError;
	import flash.utils.IDataInput;

	public class JpegQuickInfo {
		
		internal var _finished : Boolean;
		internal var _error : Error;

		internal var _width : int;
		internal var _height : int;
		internal var _orientation: int = -1;
		
		public function get error() : Error {
			return _error;
		}
		
		public function get finished() : Boolean {
			return _finished;
		}
		
		public static function createJpegQuickInfo(stream : IDataInput): JpegQuickInfo {
			var jpegInfo : JpegQuickInfo = new JpegQuickInfo();
			var jil : JpegQuickInfoListener = new JpegQuickInfoListener(jpegInfo);
			
			try {
				var jstream : JpegStream = new JpegStream(stream, jil);
				while(!jpegInfo.finished) {
					jstream.readByte();
				}
			}
			catch(error : Error) {
				jpegInfo._error = error;
			}
			return jpegInfo;
		}
		
		public function JpegQuickInfo() {
		}

		public function get width() : int {
			return _width;
		}
	
		public function get height() : int {
			return _height;
		}
	
		public function get orientation() : int {
			return _orientation;
		}
		
		//********************************************************
		// prolabsolutions changes
		// added dispose()
		//********************************************************
		public function dispose() : void {
		}
	}
}