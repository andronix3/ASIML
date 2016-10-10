package com.imagero.meta.iptc
{
/**
 * Constants for IPTC records and datasets
 *
 * @author Andrey Kuznetsov
 */
internal class IPTCConstants {

    internal static const TAG_MARKER : uint = 0x1C;

    //records
    internal static const RECORD_ENVELOPE : uint = 1;
    internal static const RECORD_APPLICATION : uint = 2;
    internal static const RECORD_DIGITAL_NEWSPHOTO_PARAMETER : uint = 3;
    internal static const RECORD_ABSTRACT_RELATIONSHIP : uint = 6;
    internal static const RECORD_PRE_OBJECTDATA_DESCRIPTOR : uint = 7;
    internal static const RECORD_OBJECTDATA : uint = 8;
    internal static const RECORD_POST_OBJECTDATA_DESCRIPTOR : uint = 9;

    //ENVELOPE RECORD
	internal static const MODEL_VERSION : uint = 0;
	internal static const DESTINATON : uint = 5;
	internal static const FILE_FORMAT : uint = 20;
	internal static const FILE_FORMAT_VERSION : uint = 22;
	internal static const SERVICE_IDENTIFIER : uint = 30;
	internal static const ENVELOPE_NUMBER : uint = 40;
	internal static const PRODUCT_ID : uint = 50;
	internal static const ENVELOPE_PRIORITY : uint = 60;
	internal static const DATE_SENT : uint = 70;
	internal static const TIME_SENT : uint = 80;
	internal static const CODED_CHARACTER_SET : uint = 90;
	internal static const UNO : uint = 100;
	internal static const ARM_IDENTIFIER : uint = 120;
	internal static const ARM_VERSION : uint = 122;

    //APPLICATION RECORD
	internal static const RECORD_VERSION : uint = 0;
	internal static const OBJECT_REFERENCE : uint = 3;
	internal static const OBJECT_ATTRIBUTE_REFERENCE : uint = 4;
	internal static const OBJECT_NAME : uint = 5;
	internal static const EDIT_STATUS : uint = 7;
	internal static const EDITORIAL_UPDATE : uint = 8;
	internal static const URGENCY : uint = 10;
	internal static const SUBJECT_REFERENCE : uint = 12;
	internal static const CATEGORY : uint = 15;
	internal static const SUPPLEMENTAL_CATEGORY : uint = 20;
	internal static const FIXTURE_IDENTIFIER : uint = 22;
	internal static const KEYWORDS : uint = 25;
	internal static const CONTENT_LOCATION_CODE : uint = 26;
	internal static const CONTENT_LOCATION_NAME : uint = 27;
	internal static const RELEASE_DATE : uint = 30;
	internal static const RELEASE_TIME : uint = 35;
	internal static const EXPIRATION_DATE : uint = 37;
	internal static const EXPIRATION_TIME : uint = 38;
	internal static const SPECIAL_INSTRUCTIONS : uint = 40;
	internal static const ACTION_ADVISED : uint = 42;
	internal static const REFERENCE_SERVICE : uint = 45;
	internal static const REFERENCE_DATE : uint = 47;
	internal static const REFERENCE_NUMBER : uint = 50;
	internal static const DATE_CREATED : uint = 55;
	internal static const TIME_CREATED : uint = 60;
	internal static const DIGITAL_CREATION_DATE : uint = 62;
	internal static const DIGITAL_CREATION_TIME : uint = 63;
	internal static const ORIGINATING_PROGRAM : uint = 65;
	internal static const PROGRAM_VERSION : uint = 70;
	internal static const OBJECT_CYCLE : uint = 75;
	internal static const BYLINE : uint = 80;
	internal static const BYLINE_TITLE : uint = 85;
	internal static const CITY : uint = 90;
	internal static const SUBLOCATION : uint = 92;
	internal static const PROVINCE_STATE : uint = 95;
	internal static const COUNTRY_PRIMARY_LOCATION_CODE : uint = 100;
	internal static const COUNTRY_PRIMARY_LOCATION_NAME : uint = 101;
	internal static const ORIGINAL_TRANSMISSION_REFERENCE : uint = 103;
	internal static const HEADLINE : uint = 105;
	internal static const CREDIT : uint = 110;
	internal static const SOURCE : uint = 115;
	internal static const COPYRIGHT_NOTICE : uint = 116;
	internal static const CONTACT : uint = 118;
	internal static const CAPTION_ABSTRACT : uint = 120;
	internal static const WRITER_EDITOR : uint = 122;
	internal static const RASTERIZED_CAPTION : uint = 125;
	internal static const IMAGE_TYPE : uint = 130;
	internal static const IMAGE_ORIENTATION : uint = 131;
	internal static const LANGUAGE_IDENTIFIER : uint = 135;
	internal static const AUDIO_TYPE : uint = 150;
	internal static const AUDIO_SAMPLING_RATE : uint = 151;
	internal static const AUDIO_SAMPLING_RESOLUTION : uint = 152;
	internal static const AUDIO_DURATION : uint = 153;
	internal static const AUDIO_OUTCUE : uint = 154;
	internal static const OBJECTDATA_PREVIEW_FILE_FORMAT : uint = 200;
	internal static const OBJECTDATA_PREVIEW_FILE_FORMAT_VERSION : uint = 201;
	internal static const OBJECTDATA_PREVIEW : uint = 202;

    //DIGITAL_NEWSPHOTO_PARAMETER_RECORD
    internal static const NEWS_PHOTO_VERSION : uint = 0;
    internal static const IPTC_PICTURE_NUMBER : uint = 10;
    internal static const PIXELS_PER_LINE : uint = 20;
    internal static const NUMBER_OF_LINES : uint = 30;
    internal static const PIXEL_WIDTH : uint = 40;
    internal static const PIXEL_HEIGHT : uint = 50;
    internal static const SUPPLEMENTAL_TYPE : uint = 55;
    internal static const COLOR_REPRESENTATION : uint = 60;
    internal static const INTERCHANGE_COLOR_SPACE : uint = 64;
    internal static const COLOR_SEQUENCE : uint = 65;
    internal static const ICC_PROFILE : uint = 66;
    internal static const COLOR_CALIBRATION_MATRIX : uint = 70;
    internal static const LOOKUP_TABLE : uint = 80;
    internal static const NUM_INDEX_ENTRIES : uint = 84;
    internal static const COLOR_PALETTE : uint = 85;
    internal static const BITS_PER_SAMPLE : uint = 86;
    internal static const SAMPLING_STRUCTURE : uint = 90;
    internal static const SCANNING_DIRECTION : uint = 100;
    internal static const IMAGE_ROTATION : uint = 102;
    internal static const DATA_COMPRESSION_METHOD : uint = 110;
    internal static const QUANTIZATION_METHOD : uint = 120;
    internal static const END_POINTS : uint = 125;
    internal static const EXCURSION_TOLERANCE : uint = 130;
    internal static const BITS_PER_COMPONENT : uint = 135;
    internal static const MAXIMUM_DENSITY_RANGE : uint = 140;
    internal static const GAMMA_COMPENSATED_VALUE : uint = 145;

    //PRE_OBJECTDATA_DESCRIPTOR_RECORD
    internal static const SIZE_MODE : uint = 10;
    internal static const MAX_SUBFILE_SIZE : uint = 20;
    internal static const OBJECT_DATA_SIZE_ANNOUNCED : uint = 90;
    internal static const MAXIMUM_OBJECT_DATA_SIZE : uint = 95;

    //OBJECTDATA_RECORD
    internal static const SUBFILE : uint = 10;

    //POST_OBJECTDATA_DESCRIPTOR_RECORD
    internal static const OBJECT_DATA_SIZE_CONFIRMED : uint = 10;
	}
}