package com.asiml.meta.jpeg
{
	import com.asiml.io.InputStream;
	
	import flash.errors.IOError;
	import flash.utils.IDataInput;

	/**
	 * @private
	 * 
	 */
	public class JpegStream extends InputStream {
		private var jl : JpegListener;
				
		public function JpegStream(input : IDataInput, jl : JpegListener) {
			super(input);
			this.jl = jl;
		}
		
		override public function readByte() : uint {
			var m : uint = input.readUnsignedByte();
			if (m == JpegConstants.MARKER) {
            	var tag : uint = input.readUnsignedByte();
            	if(jl == null) {
            		MarkerFactory.readMarker(tag, input);
            		return m;
            	}
            	switch (tag) {
                	case 0:
                    	return m;

	                case JpegConstants.RST0:
    	            case JpegConstants.RST1:
        	        case JpegConstants.RST2:
            	    case JpegConstants.RST3:
                	case JpegConstants.RST4:
	                case JpegConstants.RST5:
    	            case JpegConstants.RST6:
        	        case JpegConstants.RST7:
            	        jl.jpegRST(input);
            	        break;
	                case JpegConstants.DNL:
    	                jl.jpegDNL(input);
    	                break;
        	        case JpegConstants.SOI:
					case JpegConstants.EOI:
					case JpegConstants.SOS:
                	case JpegConstants.COM:

                	case JpegConstants.SOF0:
	                case JpegConstants.SOF1:
    	            case JpegConstants.SOF2:
        	        case JpegConstants.SOF3:
            	    case JpegConstants.SOF5:
                	case JpegConstants.SOF6:
	                case JpegConstants.SOF7:
    	            case JpegConstants.SOF9:
        	        case JpegConstants.SOF10:
            	    case JpegConstants.SOF11:
                	case JpegConstants.SOF13:
	                case JpegConstants.SOF14:
    	            case JpegConstants.SOF15:
	
    	            case JpegConstants.DHT:
        	        case JpegConstants.DQT:
            	    case JpegConstants.DHP:
                	case JpegConstants.DRI:
	                case JpegConstants.DAC:
	                 	    jl.jpegMarker(tag, input);    	            	
							break;
							
    	            case JpegConstants.APP_0:
        	        case JpegConstants.APP_1:
            	    case JpegConstants.APP_2:
                	case JpegConstants.APP_3:
	                case JpegConstants.APP_4:
    	            case JpegConstants.APP_5:
        	        case JpegConstants.APP_6:
            	    case JpegConstants.APP_7:
                	case JpegConstants.APP_8:
	                case JpegConstants.APP_9:
    	            case JpegConstants.APP_10:
        	        case JpegConstants.APP_11:
            	    case JpegConstants.APP_12:
                	case JpegConstants.APP_13:
	                case JpegConstants.APP_14:
    	            case JpegConstants.APP_15:
                		    jl.jpegMarker(tag, input);
                	    break;
	                default:
                    	throw new IOError("" + tag);
        	    }
    	    }
        	return m;
		}
	}
}