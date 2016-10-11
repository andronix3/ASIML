package com.asiml.meta.psd
{
	internal class IRBDictionary {
		
		private static var _dictionary : Object;
		
		public function IRBDictionary() {
			if(_dictionary != null) {
				return;
			}
			_dictionary = new Object();

		    add(0x03E9, "PRINT_INFO_RECORD");
		    add(0x03ED, "RESOLUTION_INFO");
    		add(0x03EE, "ALPHA_NAMES");
    		add(0x03EF, "DISPLAY_INFO");
    		
    		add(0x03F0, "CAPTION");
		    add(0x03F1, "BORDER_INFO");
		    add(0x03F2, "BACKGROUND_COLOR");
		    add(0x03F3, "PRINT_FLAGS");
		    add(0x03F4, "GRAYSCALE_HALFTONONG");
		    add(0x03F5, "COLOR_HALFTONONG");
		    add(0x03F6, "DUOTONE_HALFTONONG");
		    add(0x03F7, "GRAYSCALE_TRANSFER_FUNCTION");
		    add(0x03F8, "COLOR_TRANSFER_FUNCTION");
		    add(0x03F9, "DUOTONE_TRANSFER_FUNCTION");
		    add(0x03FA, "DUOTONE_IMAGE_INFO");
		    add(0x03FB, "DOT_RANGE");
		    add(0x03FD, "EPS_OPTIONS");
		    add(0x03FE, "QUICK_MASK_INFO");
		    
		    add(0x0400, "LAYER_STATE_INFO");
		    add(0x0401, "WORKING_PATH");
		    add(0x0402, "LAYERS_GROUP_INFO");
		    add(0x0404, "IPTC_NAA_RECORD");
		    add(0x0405, "RAW_IMAGE_MODE");
		    add(0x0406, "JPEG_QUALITY");
		    add(0x0408, "GRID_INFO");
		    add(0x0409, "THUMBNAIL_RESOURCE_1");
		    add(0x040A, "COPYRIGHT_FLAG");
		    add(0x040B, "URL");
		    add(0x040C, "THUMBNAIL_RESOURCE_2");
		    add(0x040D, "GLOBAL_ANGLE");
		    add(0x040E, "COLOR_SAMPLERS_RESOURCE");
		    add(0x040F, "ICC_PROFILE");
		    add(0x0410, "WATERMARK");
		    add(0x0411, "ICC_UNTAGGED");
		    add(0x0412, "EFFECTS_VISIBLE");
		    add(0x0413, "SPOT_HALFTONE");
		    add(0x0414, "DOCUMENT_IDS");
		    add(0x0415, "UNICODE_ALPHA_NAMES");
		    add(0x0416, "COLOR_TABLE_LENGTH");
		    add(0x0417, "TRANSPARENT_INDEX");
		    add(0x0419, "GLOBAL_ALTITUDE");
		    add(0x041A, "SLICES");
		    add(0x041B, "WORKFLOW_URL");
		    add(0x041C, "LUMP_TO_XPED");
		    add(0x041D, "ALPHA_IDS");
		    add(0x041E, "URL_LIST");
		    add(0x0421, "VERSION_INFO");
		    add(0x0422, "EXIF_1");
		    add(0x0422, "EXIF_3");
		    add(0x0424, "XMP");
		    add(0x0425, "CAPTION_DIGEST");
		    add(0x0426, "PRINT_SCALE");
		    add(0x0428, "PIXEL_ASPECT_RATIO");
		    add(0x0429, "LAYER_COMPS");
		    add(0x042A, "ALTERNATE_DUOTONE_COLORS");
		    add(0x042B, "ALTERNATE_SPOT_COLORS");
		    
		    add(0x07D0, "SAVED_PATH_FIRST");
		    add(0x0BB6, "SAVED_PATH_LAST");
		    add(0x0BB7, "CLIPPING_PATH_NAME");
		    add(0x2710, "PRINT_FLAGS_INFO");
		}
		
		public function get dictionary() : Object {
			return _dictionary;
		}
		
		internal static function add(tag : uint, name : String) : void {
			var irb : IRBTag = new IRBTag(tag, name);
			_dictionary["" + tag] = irb;
		}
	}
}