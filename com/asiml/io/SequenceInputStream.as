package com.asiml.io
{
	import com.asiml.io.InputStream;
	
	import flash.errors.EOFError;

	/**
	 * SequenceInputStream - concatenate multiple IDataInput Objects in one stream.
	 * 
	 */
	public class SequenceInputStream extends InputStream {
		
		private var streams : Array = new Array();
		 
		public function SequenceInputStream(strms : Array) {
			streams = streams.concat(strms);
			next();
		}
		
		override public function readByte():uint {
			if(input == null) {
				throw new EOFError();
			}
			if(input.bytesAvailable == 0) {
				next();
				return readByte();
			}
			return super.readByte();
		}
		
		protected function next() : void {
			if(streams.length > 0) {
				input = streams.shift();
			}
			else {
				input = null;
			}
		}
	}
}