package com.imagero.meta.tiff
{
	internal final class TiffMetaDictionary extends TIFFTagNumbers {
		
		private static const _dictionary : Object = new Object();
		private static var initialized : Boolean;
		
		internal static const N : String = "N";
		internal static const S : String = "S";
		internal static const E : String = "E";
		internal static const W : String = "W";
		internal static const A : String = "A";
		internal static const V : String = "V";
		internal static const K : String = "K";
		internal static const M : String = "M";
		internal static const T : String = "T";
		
		internal static const D2 : String = "2";
		internal static const D3 : String = "3";
		
		
		public function get dictionary() : Object {
			return _dictionary;
		}
		
		public function TiffMetaDictionary() {
			if(initialized) {
				return;
			}
			initialized = true;
				
    	add(new IFDEntryMeta("NewSubfileType", NewSubfileType, 1)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("SubfileType", SubfileType, 1)
    		.addDataType(SHORT)
            .addValue(1, "full-resolution image data")
            .addValue(2, "reduced-resolution image data")
            .addValue(3, "a single page of multi-page image"));
            
    	add(new IFDEntryMeta("ImageWidth", ImageWidth, 1)
    		.addDataType(SHORT).addDataType(LONG));
    		
    	add(new IFDEntryMeta("ImageLength", ImageLength, 1)
    		.addDataType(SHORT).addDataType(LONG));
    		
    	add(new IFDEntryMeta("BitsPerSample", BitsPerSample, 1)
    		.addDataType(SHORT));
    		
    	add(new IFDEntryMeta("Compression", Compression, 1)
    		.addDataType(SHORT)
            .addValue(1, "uncompressed")
            .addValue(2, "CCITT 1D")
            .addValue(3, "T4/Group 3 Fax")
            .addValue(4, "T6/Group 4 Fax")
            .addValue(5, "LZW")
            .addValue(6, "JPEG (old-style)")
            .addValue(7, "JPEG")
            .addValue(8, "Adobe Deflate")
            .addValue(9, "JBIG B&W")
            .addValue(10, "JBIG COLOR")
            .addValue(32766, "Next")
            .addValue(32769, "Epson ERF Compressed")
            .addValue(32771, "CCIRLEW")
            .addValue(32773, "PackBits")
            .addValue(32809, "Thunderscan")
            .addValue(32895, "IT8CTPAD")
            .addValue(32896, "IT8LW")
            .addValue(32897, "IT8MP")
            .addValue(32898, "IT8BL")
            .addValue(32908, "PixarFilm")
            .addValue(32909, "PixarLog")
            .addValue(32946, "Deflate")
            .addValue(32947, "DCS")
            .addValue(34661, "JBIG")
            .addValue(34676, "SGILog")
            .addValue(34677, "SGILog24")
            .addValue(34712, "JPEG2000")
            .addValue(34713, "Nikon NEF Compressed")
            .addValue(65000, "Kodak DCR Compressed")
            .addValue(65535, "Pentax PEF Compressed"));

    	add(new IFDEntryMeta("PhotometricInterpretation", PhotometricInterpretation, 1)
            .addDataType(SHORT)
            .addValue(0, "WhiteIsZero")
            .addValue(1, "BlackIsZero")
            .addValue(2, "RGB")
            .addValue(3, "RGB Palette")
            .addValue(4, "Transparency Mask")
            .addValue(5, "CMYK")
            .addValue(6, "YCbCr")
            .addValue(8, "CIELab")
            .addValue(9, "ICCLab")
            .addValue(10, "ITULab")
            .addValue(32803, "Color Filter Array")
            .addValue(32844, "Pixar LogL")
            .addValue(32845, "Pixar LogLuv")
            .addValue(34892, "Linear Raw"));

    	add(new IFDEntryMeta("Treshholding", Treshholding, 1)
    		.addDataType(SHORT)
    		.addValue(1, "no dithering/halftoning")
    		.addValue(2, "ordered dithering/halftoning")
    		.addValue(3, "randomized (error diffusion)"));

    	add(new IFDEntryMeta("CellWidth", CellWidth, 1)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("CellLength", CellLength, 1)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("FillOrder", FillOrder, 1)
    		.addDataType(SHORT)
			.addValue(1, "pixels with lower column values are stored in the higher-order bits of the byte")
			.addValue(2, "pixels with lower column values are stored in the lower-order bits of the byte"));

    	add(new IFDEntryMeta("ImageDescription", ImageDescription)
    		.addDataType(ASCII));
    		
    	add(new IFDEntryMeta("Make", Make)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("Model", Model)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("StripOffsets", StripOffsets)
    		.addDataType(SHORT)
    		.addDataType(LONG)
            .setPointer(true));

    	add(new IFDEntryMeta("Orientation", Orientation, 1)
    		.addDataType(SHORT)
			.addValue(1, "(0, 0) is top-left")
			.addValue(2, "(0, 0) is top-right")
			.addValue(3, "(0, 0) is bottom-right")
			.addValue(4, "(0, 0) is bottom-left")
			.addValue(5, "(0, 0) is left-top")
			.addValue(6, "(0, 0) is right-top")
			.addValue(7, "(0, 0) is right-bottom")
			.addValue(8, "(0, 0) is left-bottom"));

    	add(new IFDEntryMeta("SamplesPerPixel", SamplesPerPixel, 1)
    		.addDataType(SHORT));
    		
    	add(new IFDEntryMeta("RowsPerStrip", RowsPerStrip, 1)
    		.addDataType(SHORT)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("StripByteCount", StripByteCounts)
    		.addDataType(SHORT)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("MinSampleValue", MinSampleValue)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("MaxSampleValue", MaxSampleValue)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("XResolution", XResolution, 1)
    		.addDataType(RATIONAL));
    		
    	add(new IFDEntryMeta("YResolution", YResolution, 1)
    		.addDataType(RATIONAL));
    		
    	add(new IFDEntryMeta("PlanarConfiguration", PlanarConfiguration, 1)
    		.addDataType(SHORT)
    		.addValue(1, "Chunky format")
    		.addValue(2, "Planar format"));

    	add(new IFDEntryMeta("FreeOffsets", FreeOffsets)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("FreeByteCounts", FreeByteCounts)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("GrayResponseUnit", GrayResponseUnit, 1)
    		.addDataType(SHORT)
    		.addValue(1, "tenths")
    		.addValue(2, "hundreds")
    		.addValue(3, "thousands")
    		.addValue(4, "ten-thousands")
    		.addValue(5, "hundred-thousands"));

    	add(new IFDEntryMeta("GrayResponseCurve", GrayResponseCurve)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("ResolutionUnit", ResolutionUnit, 1)
    		.addDataType(SHORT)
    		.addValue(1, "no unit")
    		.addValue(2, "inch")
    		.addValue(3, "centimeter"));
    		
    	add(new IFDEntryMeta("Software", Software)
    		.addDataType(ASCII));
    		
    	add(new IFDEntryMeta("DateTime", DateTime, 20)
    		.addDataType(ASCII));
    		
    	add(new IFDEntryMeta("Artist", Artist)
			.addDataType(ASCII));

    	add(new IFDEntryMeta("HostComputer", HostComputer)
			.addDataType(ASCII));
			
    	add(new IFDEntryMeta("HorizontalPredictor", HorizontalPredictor, 1)
    		.addDataType(SHORT)
    		.addValue(1, "No prediction scheme used")
    		.addValue(2, "Horizontal differencing"));

    	add(new IFDEntryMeta("WhitePoint", WhitePoint, 2)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("PrimaryChromaticities", PrimaryChromaticities, 6)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("TransferFunction", TransferFunction)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("ColorMap", ColorMap)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("TileWidth", TileWidth, 1)
    		.addDataType(SHORT)
    		.addDataType(LONG));
    		
    	add(new IFDEntryMeta("TileLength", TileLength, 1)
    		.addDataType(SHORT)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("TileOffsets", TileOffsets)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("TileByteCounts", TileByteCounts)
    		.addDataType(SHORT)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("BadFaxLines", BadFaxLines, 1)
    		.addDataType(SHORT)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("CleanFaxData", CleanFaxData, 1)
			.addDataType(SHORT)
			.addValue(0, "No 'bad' lines")
			.addValue(1, "'bad' lines exist, but were regenerated by the receiver")
			.addValue(2, "'bad' lines exist, but have not been regenerated."));

    	add(new IFDEntryMeta("ConsecutiveBadFaxLines", ConsecutiveBadFaxLines, 1)
    		.addDataType(SHORT)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("SubIFDs", SubIFD)
    		.addDataType(IFD)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("InkSet", InkSet, 1)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("InkNames", InkNames)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("NumberOfInks", NumberOfInks, 1)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("DotRange", DotRange) 
    		.addDataType(BYTE)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("TargetPrinter", TargetPrinter)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("ExtraSamples", ExtraSamples)
    		.addDataType(SHORT)
    		.addValue(0, "Unspecified data")
    		.addValue(1, "Associated alpha data (premultiplied)")
    		.addValue(2, "Unassociated data"));
    		
    	add(new IFDEntryMeta("SampleFormat", SampleFormat)
    		.addDataType(SHORT)
    		.addValue(1, "Unsigned integer")
    		.addValue(2, "Two's complement signed integer")
    		.addValue(3, "IEEE floating point")
    		.addValue(4, "Undefined")
    		.addValue(5, "Complex Integer")
    		.addValue(6, "IEEE floating point"));

    	add(new IFDEntryMeta("SMinSampleValue", SMinSampleValue)
    		.addDataType(ANY));

	    add(new IFDEntryMeta("SMaxSampleValue", SMaxSampleValue)
	    	.addDataType(ANY));

    	add(new IFDEntryMeta("TransferRange", TransferRange, 6) 
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("JpegSoi", JpegSoi, 1)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("JpegDataLength", JpegDataLength, 1)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("YCbCrCoefficients", YCbCrCoefficients, 3)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("YCbCrSubsampling", YCbCrSubsampling, 2)
            .addDataType(SHORT));

    	add(new IFDEntryMeta("YCbCrPositioning", YCbCrPositioning, 1)
    		.addDataType(SHORT)
    		.addValue(1, "Centered")
    		.addValue(2, "Co-sited"));

    	add(new IFDEntryMeta("ReferenceBlackWhite", ReferenceBlackWhite, 6)
    		.addDataType(RATIONAL));
    		
    	add(new IFDEntryMeta("xmp", Xmp)
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("Copyright", Copyright)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("App13", App13) 
    		.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("iptc", Iptc)
            .addDataType(UNDEFINED)
            .addDataType(BYTE));

    	add(new IFDEntryMeta("iptc2", AfcpIptc)
			.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("ExifPointer", ExifPointer, 1)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("GPSInfoIFDPointer", GPSInfoIFDPointer, 1)
    		.addDataType(LONG)
    		.setPointer(true));

    	add(new IFDEntryMeta("InteroperabilityIFDPointer", InteroperabilityIFDPointer, 1)
            .addDataType(LONG)
            .setPointer(true));
    		
    		
		add(new IFDEntryMeta("JPEGTables", JPEGTables)
			.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("DocumentName", DocumentName)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("PageName", PageName)
    		.addDataType(ASCII));

    	/**
     	 * PageNumber[0] is number of current page, PageNumber[1] is total number of pages in document
     	 */
    	add(new IFDEntryMeta("PageNumber", PageNumber, 2)
			.addDataType(SHORT));

    	/**
     	 * The X nextIfdOffset in ResolutionUnits of the left side of the image, with respect to the left side of the page.
     	 */
    	add(new IFDEntryMeta("XPosition", XPosition, 1)
			.addDataType(RATIONAL));
			
    	/**
     	 * The Y nextIfdOffset in ResolutionUnits of the top of the image, with respect to the top of the page. In the TIFF coordinate
     	 * scheme, the positive Y direction is down, so that YPosition is always positive.
     	 */
    	add(new IFDEntryMeta("YPosition", YPosition, 1)
			.addDataType(RATIONAL));

    	add(new IFDEntryMeta("T4Options", T4Options, 1)
    		.addDataType(LONG));

	    add(new IFDEntryMeta("T6Options", T6Options, 1)
	    	.addDataType(LONG)
	    	.addValue(1, "uncompressed mode is allowed"));
	    	
    	add(new IFDEntryMeta("CFARepeatPatternDIM", CFARepeatPatternDIM, 2)
    		.addDataType(SHORT));

    	/**
	     * 0 - Red
    	 * 1 - Green
	     * 2 - Blue
    	 * 3 - Cyan
	     * 4 - Magenta
    	 * 5 - Yellow
	     * 6 - White
    	 */
    	add(new IFDEntryMeta("NEFCFAPattern", CFAPatternNEF, 4) 
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("NEFSensingMethod", NEFSensingMethod, 4) 
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("DNGVersion", DNGVersion, 4) 
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("DNGBackwardVersion", DNGBackwardVersion, 4)
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("UniqueCameraModel", UniqueCameraModel)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("LocalizedCameraModel", LocalizedCameraModel)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("CFAPlaneColor", 0xC616)
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("CFALayout", 0xC617, 1)
    		.addDataType(SHORT)
    		.addValue(1, "Rectangular (or square) layout")
    		.addValue(2, "Staggered layout A: even columns are offset down by 1/2 row")
    		.addValue(3, "Staggered layout B: even columns are offset up by 1/2 row")
    		.addValue(4, "Staggered layout C: even rows are offset right by 1/2 column")
    		.addValue(5, "Staggered layout D: even rows are offset left by 1/2 column"));

    	add(new IFDEntryMeta("LinearizationTable", LinearizationTable)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("BlackLevelRepeatDim", BlackLevelRepeatDim, 2)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("BlackLevel", BlackLevel)
    		.addDataType(SHORT)
    		.addDataType(LONG)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("BlackLevelDeltaH", BlackLevelDeltaH)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("BlackLevelDeltaV", BlackLevelDeltaV)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("WhiteLevel", WhiteLevel) 
    		.addDataType(SHORT)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("DefaultScale", DefaultScale, 2)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("BestQualityScale", BestQualityScale, 1)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("DefaultCropOrigin", DefaultCropOrigin, 2)
    		.addDataType(SHORT)
    		.addDataType(LONG)
    		.addDataType(RATIONAL));
			
    	add(new IFDEntryMeta("DefaultCropSize", DefaultCropSize, 2)
    		.addDataType(SHORT)
    		.addDataType(LONG)
    		.addDataType(RATIONAL));
    	

	    add(new IFDEntryMeta("CalibrationIlluminant1", CalibrationIlluminant1, 1)
	    	.addDataType(SHORT));

    	add(new IFDEntryMeta("CalibrationIlluminant2", CalibrationIlluminant2, 1)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("ColorMatrix1", ColorMatrix1)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("ColorMatrix2", ColorMatrix2)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("CameraCalibration1", CameraCalibration1)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("CameraCalibration2", CameraCalibration2)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("ReductionMatrix1", ReductionMatrix1)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("ReductionMatrix2", ReductionMatrix2)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("AnalogBalance", AnalogBalance)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("AsShotNeutral", AsShotNeutral)
    		.addDataType(SHORT)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("AsShotWhiteXY", AsShotWhiteXY, 2)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("BaselineExposure", BaselineExposure, 1)
    		.addDataType(SRATIONAL));

    	add(new IFDEntryMeta("BaselineNoise", BaselineNoise, 1)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("BaselineSharpness", BaselineSharpness, 1)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("BayerGreenSplit", BayerGreenSplit, 1)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("LinearResponseLimit", LinearResponseLimit, 1)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("CameraSerialNumber", CameraSerialNumber)
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("LensInfo", LensInfo, 4)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("ChromaBlurRadius", ChromaBlurRadius, 1)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("AntiAliasStrength", AntiAliasStrength, 1)
    		.addDataType(RATIONAL));

    	add(new IFDEntryMeta("DNGPrivateData", DNGPrivateData, 1)
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("MakerNoteSafety", MakerNoteSafety, 1)
    		.addDataType(SHORT));

    	add(new IFDEntryMeta("RAWImageName", RAWImageName)
    		.addDataType(BYTE));

    	add(new IFDEntryMeta("RAWImage", RAWImage)
    		.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("MakerNote", MakerNote)
    		.addDataType(UNDEFINED));
    		
    	add(new IFDEntryMeta("ICC_Profile", ICC_Profile)
    		.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("ImageSourceData", ImageSourceData)
    		.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("WangAnnotation", WangAnnotation)
    		.addDataType(BYTE));
    		
    	add(new IFDEntryMeta("PixelXDimension", PixelXDimension, 1)
    		.addDataType(SHORT)
    		.addDataType(LONG));

    	add(new IFDEntryMeta("PixelYDimension", PixelYDimension, 1)
            .addDataType(SHORT)
            .addDataType(LONG));
    		
    		    
	    //*************************** EXIF IFD *******************************//
	    
    	add(new IFDEntryMeta("ExposureTime", TIFFTagNumbers.ExposureTime, 1, "EXIF")
    		.addDataType(RATIONAL));
    	
    	add(new IFDEntryMeta("FNumber", TIFFTagNumbers.FNumber, 1, "EXIF")
    		.addDataType(RATIONAL));    	    	
    	
    	add(new IFDEntryMeta("ExposureProgram", TIFFTagNumbers.ExposureProgram, 1, "EXIF")
    		.addDataType(SHORT)
            .addValue(0, "Not defined")
            .addValue(1, "Manual")
            .addValue(2, "Normal program")
            .addValue(3, "Aperture priority")
            .addValue(4, "Shutter priority")
            .addValue(5, "Creative program (biased toward depth of field)")
            .addValue(6, "Action program (biased toward fast shutter speed)")
            .addValue(7, "Portrait mode (for closeup photos with the background out of focus)")
            .addValue(8, "Landscape mode (for landscape photos with the background in focus)"));
            
    	add(new IFDEntryMeta("SpectralSensitivity", TIFFTagNumbers.SpectralSensitivity, 0, "EXIF")
    		.addDataType(ASCII));
    		
    	add(new IFDEntryMeta("ISOSpeedRatings", TIFFTagNumbers.ISOSpeedRatings, 1, "EXIF")
    		.addDataType(SHORT));
    		
    	add(new IFDEntryMeta("OECF", TIFFTagNumbers.OECF, 1, "EXIF")
    		.addDataType(UNDEFINED));
    		
    	add(new IFDEntryMeta("ShutterSpeedValue", TIFFTagNumbers.ShutterSpeedValue, 1, "EXIF")
    		.addDataType(SRATIONAL)); 
    		
	    add(new IFDEntryMeta("ApertureValue", TIFFTagNumbers.ApertureValue, 1, "EXIF")
	    	.addDataType(RATIONAL));
	    	
	    add(new IFDEntryMeta("BrightnessValue", TIFFTagNumbers.BrightnessValue, 1, "EXIF")
	    	.addDataType(SRATIONAL));
	    	
	    add(new IFDEntryMeta("ExposureBiasValue", TIFFTagNumbers.ExposureBiasValue, 1, "EXIF")
	    	.addDataType(SRATIONAL));
	    	
	    add(new IFDEntryMeta("MaxApertureValue", TIFFTagNumbers.MaxApertureValue, 1, "EXIF")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("SubjectDistance", TIFFTagNumbers.SubjectDistance, 1, "EXIF")
	    	.addDataType(RATIONAL));

	    add(new IFDEntryMeta("MeteringMode", TIFFTagNumbers.MeteringMode, 1, "EXIF")
	    	.addDataType(SHORT)
            .addValue(0, "Unknown")
            .addValue(1, "Average")
            .addValue(2, "CenterWeightedAverage")
            .addValue(3, "Spot")
            .addValue(4, "MultiSpot")
            .addValue(5, "Pattern")
            .addValue(6, "Partial")
            .addValue(255, "Other"));
            
	    add(new IFDEntryMeta("LightSource", TIFFTagNumbers.LightSource, 1, "EXIF")
	    	.addDataType(SHORT)
            .addValue(0, "Unknown")
            .addValue(1, "Daylight")
            .addValue(2, "Fluorescent")
            .addValue(3, "Tungsten")
            .addValue(17, "Standard light A")
            .addValue(18, "Standard light B")
            .addValue(19, "Standard light C")
            .addValue(20, "D55")
            .addValue(21, "D65")
            .addValue(22, "D75")
            .addValue(255, "Other"));

    	add(new IFDEntryMeta("Flash", TIFFTagNumbers.Flash, 1, "EXIF")
    		.addDataType(SHORT));
    	
        add(new IFDEntryMeta("FocalLength", TIFFTagNumbers.FocalLength, 1, "EXIF")
        	.addDataType(RATIONAL));
        	
        add(new IFDEntryMeta("SubjectArea", TIFFTagNumbers.SubjectArea, 1, "EXIF")
        	.addDataType(RATIONAL));

	    add(new IFDEntryMeta("FlashEnergy", TIFFTagNumbers.FlashEnergy, 4, "EXIF")
	    	.addDataType(SHORT));
	    	
	    add(new IFDEntryMeta(
	    	"SpatialFrequencyResponse", TIFFTagNumbers.SpatialFrequencyResponse, 0, "EXIF")
	    	.addDataType(UNDEFINED));
        
	    add(new IFDEntryMeta(
	    	"FocalPlaneXResolution", TIFFTagNumbers.FocalPlaneXResolution, 1, "EXIF")
	    	.addDataType(RATIONAL));
	    	
	    add(new IFDEntryMeta(
	    	"FocalPlaneYResolution", TIFFTagNumbers.FocalPlaneYResolution, 1, "EXIF")
	    	.addDataType(RATIONAL));
	    	
	    add(new IFDEntryMeta(
	    	"FocalPlaneResolutionUnit", TIFFTagNumbers.FocalPlaneResolutionUnit, 1, "EXIF")
	    	.addDataType(SHORT)
	    	.addValue(1, "no unit")
	    	.addValue(2, "inch")
	    	.addValue(3, "centimeter"));
	    	
	    add(new IFDEntryMeta("SubjectLocation", TIFFTagNumbers.SubjectArea, 2, "EXIF")
	    	.addDataType(SHORT));

	    add(new IFDEntryMeta("ExposureIndex", TIFFTagNumbers.ExposureIndex, 1, "EXIF")
	    	.addDataType(RATIONAL));

	    add(new IFDEntryMeta("SensingMethod", TIFFTagNumbers.SensingMethod, 1, "EXIF")
	    	.addDataType(SHORT)
            .addValue(1, "Not defined")
            .addValue(2, "One-chip color area sensor")
            .addValue(3, "Two-chip color area sensor")
            .addValue(4, "Three-chip color area sensor")
            .addValue(5, "Color sequential area sensor")
            .addValue(7, "Trilinear sensor")
            .addValue(8, "Color sequential linear sensor"));
            

	    add(new IFDEntryMeta("FileSource", TIFFTagNumbers.FileSource, 1, "EXIF")
	    	.addDataType(UNDEFINED)
            .addValue(3, "DSC"));
            
	    add(new IFDEntryMeta("SceneType", TIFFTagNumbers.SceneType, 1, "EXIF")
	    	.addDataType(UNDEFINED)
            .addValue(1, "A directly photographed image"));
            
	    add(new IFDEntryMeta("CFAPattern", TIFFTagNumbers.CFAPattern, 0, "EXIF")
	    	.addDataType(UNDEFINED));
	    	
	    add(new IFDEntryMeta("UserComment", TIFFTagNumbers.UserComment, 0, "EXIF")
	    	.addDataType(UNDEFINED));

	    add(new IFDEntryMeta("CustomRendered", TIFFTagNumbers.CustomRendered, 1, "EXIF")
	    	.addDataType(SHORT)
            .addValue(0, "Normal process")
            .addValue(1, "Custom process"));
            
	    add(new IFDEntryMeta("ExposureMode", TIFFTagNumbers.ExposureMode, 1, "EXIF")
	    	.addDataType(SHORT)
	    	.addValue(0, "Auto exposure")
	    	.addValue(1, "Manual exposure")
	    	.addValue(2, "Auto bracket"));
	
	    add(new IFDEntryMeta("WhiteBalance", TIFFTagNumbers.WhiteBalance, 1, "EXIF")
	    	.addDataType(SHORT)
	    	.addValue(0, "Auto white balance")
	    	.addValue(1, "Manual white balance"));

	    add(new IFDEntryMeta("DigitalZoomRatio", TIFFTagNumbers.DigitalZoomRatio, 1, "EXIF")
	    	.addDataType(RATIONAL));

	    add(new IFDEntryMeta("FocalLengthIn35mmFilm", TIFFTagNumbers.FocalLengthIn35mmFilm, 1, "EXIF")
	    	.addDataType(SHORT));

	    add(new IFDEntryMeta("SceneCaptureType", TIFFTagNumbers.SceneCaptureType, 1, "EXIF")
	    	.addDataType(SHORT)
			.addValue(0, "Standard")
			.addValue(1, "Landscape")
			.addValue(2, "Portrait")
			.addValue(3, "Night scene"));
			
	    add(new IFDEntryMeta("GainControl", TIFFTagNumbers.GainControl, 1, "EXIF")
	    	.addDataType(SHORT)
			.addValue(0, "None")
			.addValue(1, "Low gain up")
			.addValue(2, "High gain up")
			.addValue(3, "Low gain down")
			.addValue(4, "High gain down"));

	    add(new IFDEntryMeta("Contrast", TIFFTagNumbers.Contrast, 1, "EXIF")
	    	.addDataType(SHORT)
			.addValue(0, "Normal")
			.addValue(1, "Soft")
			.addValue(2, "Hard"));
			
	    add(new IFDEntryMeta("Saturation", TIFFTagNumbers.Saturation, 1, "EXIF")
	    	.addDataType(SHORT)	    	
			.addValue(0, "Normal")
			.addValue(1, "Low saturation")
			.addValue(2, "High saturation"));

	    add(new IFDEntryMeta("Sharpness", TIFFTagNumbers.Sharpness, 1, "EXIF")
	    	.addDataType(SHORT)
			.addValue(0, "Normal")
			.addValue(1, "Soft")
			.addValue(2, "Hard"));

	    add(new IFDEntryMeta(
	    	"DeviceSettingDescription", TIFFTagNumbers.DeviceSettingDescription, 0, "EXIF")
	    	.addDataType(UNDEFINED));

	    add(new IFDEntryMeta(
	    	"SubjectDistanceRange", TIFFTagNumbers.SubjectDistanceRange, 1, "EXIF")
	    	.addDataType(SHORT)
			.addValue(0, "Unknown")
			.addValue(1, "Macro")
			.addValue(2, "Close view")
			.addValue(3, "Distant view"));
			
	    add(new IFDEntryMeta(
	    	"ImageUniqueID", TIFFTagNumbers.ImageUniqueID, 33, "EXIF")
	    	.addDataType(ASCII));

    	add(new IFDEntryMeta("FlashPixVersion", FlashPixVersion, 4, "EXIF")
    		.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("ExifVersion", ExifVersion, 4, "EXIF")
    		.addDataType(UNDEFINED));

    	add(new IFDEntryMeta("ColorSpace", ColorSpace, 4, "EXIF")
    		.addDataType(SHORT)
    		.addValue(1, "sRGB")
    		.addValue(0xFFFF, "Uncalibrated"));

    	add(new IFDEntryMeta("RelatedSoundFile", RelatedSoundFile, 13, "EXIF")
            	.addDataType(ASCII));
            	
    	add(new IFDEntryMeta("DateTimeOriginal", DateTimeOriginal, 20, "EXIF")
            .addDataType(ASCII));

    	add(new IFDEntryMeta("DateTimeDigitized", DateTimeDigitized, 20, "EXIF")
            .addDataType(ASCII));

    	add(new IFDEntryMeta("SubsecTime", SubSecTime, 0, "EXIF")
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("SubsecTimeOriginal", SubSecTimeOriginal, 0, "EXIF")
    		.addDataType(ASCII));

    	add(new IFDEntryMeta("SubsecTimeDigitized", SubSecTimeDigitized, 0, "EXIF")
    		.addDataType(ASCII));
    		
    	add(new IFDEntryMeta("ComponentsConfiguration", ComponentsConfiguration, 4, "EXIF")
    		.addDataType(UNDEFINED));

	    add(new IFDEntryMeta("CompressedBitsPerPixel", CompressedBitsPerPixel, 1, "EXIF")
	    	.addDataType(RATIONAL));

            	

	    //*************************** GPS IFD *******************************//
	    
		add(new IFDEntryMeta("GPSVersionID", 0, 4, "GPS")
			.addDataType(BYTE));
		
	    add(new IFDEntryMeta("GPSLatitudeRef", 1, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(N.charCodeAt(0), "North latitude")
	    	.addValue(S.charCodeAt(0), "South latitude"));
	
	    add(new IFDEntryMeta("GPSLatitude", 2, 3, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSLongitudeRef", 3, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(E.charCodeAt(0), "East longitude")
	    	.addValue(W.charCodeAt(0), "West longitude"));
	    	
	    add(new IFDEntryMeta("GPSLongitude", 4, 3, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSAltitudeRef", 5, 1, "GPS")
	    	.addDataType(BYTE)
	    	.addValue(0, "Sea level"));
	    	
	    add(new IFDEntryMeta("GPSAltitude", 6, 1, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSTimeStamp", 7, 3, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSSatellites", 8, 0, "GPS")
	    	.addDataType(ASCII));
	
	    add(new IFDEntryMeta("GPSStatus", 9, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(A.charCodeAt(0), "Measurement in progress")
	    	.addValue(V.charCodeAt(0), "Measurement Interoperability"));
	
	    add(new IFDEntryMeta("GPSMeasureMode", 0xA, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(D2.charCodeAt(0), "2-dimensional measurement")
	    	.addValue(D3.charCodeAt(0), "3-dimensional measurement"));
	
	    add(new IFDEntryMeta("GPSDOP", 0xB, 1, "GPS")
	    	.addDataType(RATIONAL));
	    	
	    add(new IFDEntryMeta("GPSSpeedRef", 0xC, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(K.charCodeAt(0), "Kilometers per hour")
	    	.addValue(M.charCodeAt(0), "Miles per hour")
	    	.addValue(N.charCodeAt(0), "Knots"));
	    	
	    add(new IFDEntryMeta("GPSSpeed", 0xD, 1, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSTrackRef", 0xE, 2, "GPS")
	    	.addDataType(ASCII)
	        .addValue(T.charCodeAt(0), "True direction")
	    	.addValue(M.charCodeAt(0), "Magnetic direction"));
	
	    add(new IFDEntryMeta("GPSTrack", 0xF, 1, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSImgDirectionRef", 0x10, 2, "GPS")
	    	.addDataType(ASCII)
	        .addValue(T.charCodeAt(0), "True direction")
	    	.addValue(M.charCodeAt(0), "Magnetic direction"));
	
	    add(new IFDEntryMeta("GPSImgDirection", 0x11, 1, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSMapDatum", 0x12, 0, "GPS")
	    	.addDataType(ASCII));
	
	    add(new IFDEntryMeta("GPSDestLatitudeRef", 0x13, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(N.charCodeAt(0), "North latitude")
	    	.addValue(S.charCodeAt(0), "South latitude"));
	
	    add(new IFDEntryMeta("GPSDestLatitude", 0x14, 3, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSDestLongitudeRef", 0x15, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(E.charCodeAt(0), "East longitude")
	    	.addValue(W.charCodeAt(0), "West longitude"));
	
	    add(new IFDEntryMeta("GPSDestLongitude", 0x16, 3, "GPS")
	    	.addDataType(ASCII));
	
	    add(new IFDEntryMeta("GPSDestBearingRef", 0x17, 2, "GPS")
	    	.addDataType(ASCII)
	        .addValue(T.charCodeAt(0), "True direction")
	    	.addValue(M.charCodeAt(0), "Magnetic direction"));
	
	    add(new IFDEntryMeta("GPSDestBearing", 0x18, 1, "GPS")
	    	.addDataType(RATIONAL));
	
	    add(new IFDEntryMeta("GPSDestDistanceRef", 0x19, 2, "GPS")
	    	.addDataType(ASCII)
	    	.addValue(K.charCodeAt(0), "Kilometers per hour")
	    	.addValue(M.charCodeAt(0), "Miles per hour")
	    	.addValue(N.charCodeAt(0), "Knots"));
	
	    add(new IFDEntryMeta("GPSDestDistance", 0x1A, 1, "GPS")
	    	.addDataType(ASCII));
	
	    add(new IFDEntryMeta("GPSProcessingMethod", 0x1B, 0, "GPS")
	    	.addDataType(UNDEFINED));
	
	    add(new IFDEntryMeta("GPSAreaInformation", 0x1C, 0, "GPS")
	    	.addDataType(UNDEFINED));
	
	    add(new IFDEntryMeta("GPSDateStamp", 0x1D, 11, "GPS")
	    	.addDataType(ASCII));
	
	    add(new IFDEntryMeta("GPSDifferential", 0x1E, 1, "GPS")
	    	.addDataType(SHORT));
	    	
	    //*************************** Interoperability IFD *******************************//
	    
	    add(new IFDEntryMeta("InteroperabilityIndex", 0x1, 0, "INTEROP")
	    	.addDataType(ASCII));

    	add(new IFDEntryMeta("InteroperabilityVersion", 0x2, 4, "INTEROP")
    		.addDataType(ASCII));	    	
			
		}
		
		internal function add(m : IFDEntryMeta) : void {
	        if(m.name != null) {
	        	_dictionary[m.name] = m;
				_dictionary[m.category +"::" + m.tag] = m;
				//trace(m.category +"::0x" + m.tag.toString(16));
	        }
			
		}
	}
}