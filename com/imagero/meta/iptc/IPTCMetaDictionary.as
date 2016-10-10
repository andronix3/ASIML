package com.imagero.meta.iptc
{
	internal class IPTCMetaDictionary {
		
		public function IPTCMetaDictionary() {
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.MODEL_VERSION, "Record version", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.DESTINATON, "Destination", 1024, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.FILE_FORMAT, "File format", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.FILE_FORMAT_VERSION, "File format version", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.SERVICE_IDENTIFIER, "Service identifier", 10, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.ENVELOPE_NUMBER, "Envelope number", 8, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.PRODUCT_ID, "Product I.D.", 32, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.ENVELOPE_PRIORITY, "Envelope priority", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.DATE_SENT, "Date sent", 8, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.TIME_SENT, "Time sent", 11, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.CODED_CHARACTER_SET, "Coded character set", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.UNO, "UNO - Unique Name of Object", 80, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.ARM_IDENTIFIER, "ARM - Abstract Relationship Method", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_ENVELOPE, IPTCConstants.ARM_VERSION, "ARM version", 2, false));
		
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.RECORD_VERSION, "Record version", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.OBJECT_REFERENCE, "Object reference", 67, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.OBJECT_ATTRIBUTE_REFERENCE, "Object attribute reference", 68, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.OBJECT_NAME, "Object name", 64, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.EDIT_STATUS, "Edit status", 64, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.EDITORIAL_UPDATE, "Editorial update", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.URGENCY, "Urgency", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.SUBJECT_REFERENCE, "Subject reference", 236, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.CATEGORY, "Category", 3, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.SUPPLEMENTAL_CATEGORY, "Supplemental category", 32, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.FIXTURE_IDENTIFIER, "Fixture identifier", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.KEYWORDS, "Keywords", 64, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.CONTENT_LOCATION_CODE, "Content Location Code", 3, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.CONTENT_LOCATION_NAME, "Content Location Name", 64, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.RELEASE_DATE, "Release date", 8, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.RELEASE_TIME, "Release time", 11, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.EXPIRATION_DATE, "Expiration date", 8, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.EXPIRATION_TIME, "Expiration time", 11, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.SPECIAL_INSTRUCTIONS, "Special instructions", 256, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.ACTION_ADVISED, "Action advised", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.REFERENCE_SERVICE, "Reference service", 10, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.REFERENCE_DATE, "Reference date", 8, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.REFERENCE_NUMBER, "Reference number", 8, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.DATE_CREATED, "Date created", 8, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.TIME_CREATED, "Time created", 11, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.DIGITAL_CREATION_DATE, "Digital creation date", 8, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.DIGITAL_CREATION_TIME, "Digital creation time", 11, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.ORIGINATING_PROGRAM, "Originating program", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.PROGRAM_VERSION, "Program version", 10, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.OBJECT_CYCLE, "Object cycle", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.BYLINE, "By-line", 32, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.BYLINE_TITLE, "By-line title", 32, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.CITY, "City", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.SUBLOCATION, "Sublocation", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.PROVINCE_STATE, "Province/State", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.COUNTRY_PRIMARY_LOCATION_CODE, "Country/Primary location code", 3, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.COUNTRY_PRIMARY_LOCATION_NAME, "Country/Primary location name", 64, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.ORIGINAL_TRANSMISSION_REFERENCE, "Original transmission reference", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.HEADLINE, "Headline", 256, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.CREDIT, "Credit", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.SOURCE, "Source", 32, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.COPYRIGHT_NOTICE, "Copyright notice", 128, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.CONTACT, "Contact", 128, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.CAPTION_ABSTRACT, "Caption/Abstract", 2000, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.WRITER_EDITOR, "Writer/Editor", 32, true));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.RASTERIZED_CAPTION, "Rasterized Caption", 7360, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.IMAGE_TYPE, "Image type", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.IMAGE_ORIENTATION, "Image orientation", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.LANGUAGE_IDENTIFIER, "Language identifier", 3, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.AUDIO_TYPE, "Audio type", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.AUDIO_SAMPLING_RATE, "Audio sampling rate", 6, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.AUDIO_SAMPLING_RESOLUTION, "Audio sampling resolution", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.AUDIO_DURATION, "Audio duration", 6, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.AUDIO_OUTCUE, "Audio Outcue", 64, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.OBJECTDATA_PREVIEW_FILE_FORMAT, "ObjectData Preview File Format", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.OBJECTDATA_PREVIEW_FILE_FORMAT_VERSION, "ObjectData Preview File Format Version", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_APPLICATION, IPTCConstants.OBJECTDATA_PREVIEW, "ObjectData Preview", 256000, false));
		
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.NEWS_PHOTO_VERSION, "News photo version", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.IPTC_PICTURE_NUMBER, "IPTC picture number", 16, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.PIXELS_PER_LINE, "IPTC image width", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.NUMBER_OF_LINES, "IPTC image height", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.PIXEL_WIDTH, "Pixel Size In Scanning Direction.", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.PIXEL_HEIGHT, "Pixel Size Perpendicular To Scanning Direction.", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.SUPPLEMENTAL_TYPE, "Supplemental type", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.COLOR_REPRESENTATION, "Color representation", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.INTERCHANGE_COLOR_SPACE, "Interchange color space", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.COLOR_SEQUENCE, "Color sequence", 4, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.ICC_PROFILE, "ICC profile", 512000, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.COLOR_CALIBRATION_MATRIX, "Color Calibration Matrix", -1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.LOOKUP_TABLE, "Lookup Table", 131072, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.NUM_INDEX_ENTRIES, "Number of Index Entries", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.COLOR_PALETTE, "Color palette", 524288, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.BITS_PER_SAMPLE, "Number of Bits per Sample", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.SAMPLING_STRUCTURE, "Sampling structure", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.SCANNING_DIRECTION, "Scanning direction", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.IMAGE_ROTATION, "Image rotation", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.DATA_COMPRESSION_METHOD, "Data compression method", 4, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.QUANTIZATION_METHOD, "Quantisation method", 1, false));
		    //max length may vary
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.END_POINTS, "End points", 20, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.EXCURSION_TOLERANCE, "Excursion Tolerance", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.BITS_PER_COMPONENT, "Bits per component", 10, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.MAXIMUM_DENSITY_RANGE, "Maximum Density Range", 2, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_DIGITAL_NEWSPHOTO_PARAMETER, IPTCConstants.GAMMA_COMPENSATED_VALUE, "Gamma Compensated Value", 2, false));
		
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_PRE_OBJECTDATA_DESCRIPTOR, IPTCConstants.SIZE_MODE, "Size mode", 1, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_PRE_OBJECTDATA_DESCRIPTOR, IPTCConstants.MAX_SUBFILE_SIZE, "Max subfile size", 10, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_PRE_OBJECTDATA_DESCRIPTOR, IPTCConstants.OBJECT_DATA_SIZE_ANNOUNCED, "ObjectData size announced", 10, false));
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_PRE_OBJECTDATA_DESCRIPTOR, IPTCConstants.MAXIMUM_OBJECT_DATA_SIZE, "Maximum ObjectData size", 10, false));
		
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_OBJECTDATA, IPTCConstants.SUBFILE, "Subfile", Number.MAX_VALUE, true));
		
		    add(new IPTCFieldMeta(IPTCConstants.RECORD_POST_OBJECTDATA_DESCRIPTOR, IPTCConstants.OBJECT_DATA_SIZE_CONFIRMED, "ObjectData size confirmed", 10, false));
		}
		
		public function add(ieMeta : IPTCFieldMeta) : void {
            IPTCFieldMeta.dictionary[ieMeta.name] = ieMeta;
            IPTCFieldMeta.dictionary["" + ieMeta.record + ":" + ieMeta.dataset] = ieMeta;
		}
	}
}