package com.asiml.meta.tiff
{
public class TIFFTagNumbers extends DataType {
	
    public static const NewSubfileType: uint = 0xfe;
    public static const SubfileType: uint = 0xff;

    public static const ImageWidth: uint = 0x100;
    public static const ImageLength: uint = 0x101;
    public static const BitsPerSample: uint = 0x102;
    public static const Compression: uint = 0x103;

    public static const PhotometricInterpretation: uint = 0x106;
    public static const Treshholding: uint = 0x107;
    public static const CellWidth: uint = 0x108;
    public static const CellLength: uint = 0x109;
    public static const FillOrder: uint = 0x10a;

    public static const DocumentName: uint = 0x10d;
    public static const ImageDescription: uint = 0x10e;
    public static const Make: uint = 0x10f;
    public static const Model: uint = 0x110;
    public static const StripOffsets: uint = 0x111;
    public static const Orientation: uint = 0x112;

    public static const SamplesPerPixel: uint = 0x115;
    public static const RowsPerStrip: uint = 0x116;
    public static const StripByteCounts: uint = 0x117;
    public static const MinSampleValue: uint = 0x118;
    public static const MaxSampleValue: uint = 0x119;
    public static const XResolution: uint = 0x11a;
    public static const YResolution: uint = 0x11b;
    public static const PlanarConfiguration: uint = 0x11c;
    public static const PageName: uint = 0x11d;
    public static const XPosition: uint = 0x11e;
    public static const YPosition: uint = 0x11f;
    public static const FreeOffsets: uint = 0x120;
    public static const FreeByteCounts: uint = 0x121;
    public static const GrayResponseUnit: uint = 0x122;
    public static const GrayResponseCurve: uint = 0x123;
    public static const T4Options: uint = 0x124;
    public static const T6Options: uint = 0x125;

    public static const ResolutionUnit: uint = 0x128;
    public static const PageNumber: uint = 0x129;
    public static const ColorResponseUnit: uint = 0x12c;
    public static const TransferFunction: uint = 0x12d;

    public static const Software: uint = 0x131;
    public static const DateTime: uint = 0x132;
    public static const Artist: uint = 0x13b;
    public static const HostComputer: uint = 0x13c;
    public static const HorizontalPredictor: uint = 0x13d;
    public static const WhitePoint: uint = 0x13e;
    public static const PrimaryChromaticities: uint = 0x13f;
    public static const ColorMap: uint = 0x140;
    public static const TileWidth: uint = 0x142;
    public static const TileLength: uint = 0x143;
    public static const TileOffsets: uint = 0x144;
    public static const TileByteCounts: uint = 0x145;
    public static const BadFaxLines: uint = 0x146;
    public static const CleanFaxData: uint = 0x147;
    public static const ConsecutiveBadFaxLines: uint = 0x148;
    public static const SubIFD: uint = 0x14a;

    public static const InkSet: uint = 0x14c;
    public static const InkNames: uint = 0x14d;
    public static const NumberOfInks: uint = 0x14e;

    public static const DotRange: uint = 0x150;
    public static const TargetPrinter: uint = 0x151;
    public static const ExtraSamples: uint = 0x152;
    public static const SampleFormat: uint = 0x153;
    public static const SMinSampleValue: uint = 0x154;
    public static const SMaxSampleValue: uint = 0x155;
    public static const TransferRange: uint = 0x156;
    public static const ClipPath: uint = 0x157;
    public static const XClipPathUnits: uint = 0x158;
    public static const YClipPathUnits: uint = 0x159;
    public static const Indexed: uint = 0x15a;
    public static const JPEGTables: uint = 0x15b;

    public static const OPIProxy: uint = 0x15f;
    public static const GlobalParametersIFD: uint = 0x190;
    public static const ProfileType: uint = 0x191;
    public static const FaxProfile: uint = 0x192;
    public static const CodingMethods: uint = 0x193;
    public static const VersionYear: uint = 0x194;
    public static const ModeNumber: uint = 0x195;

    public static const Decode: uint = 0x1b1;
    public static const DefaultImageColor: uint = 0x1b2;

    public static const JPEGProc: uint = 0x200;
    public static const JpegSoi: uint = 0x201;
    public static const JpegDataLength: uint = 0x202;
    public static const JPEGRestartInterval: uint = 0x203;

    public static const JPEGLosslessPredictors: uint = 0x205;
    public static const JPEGPointTransforms: uint = 0x206;
    public static const JPEGQTables: uint = 0x207;
    public static const JPEGDCTables: uint = 0x208;
    public static const JPEGACTables: uint = 0x209;
    public static const YCbCrCoefficients: uint = 0x211;
    public static const YCbCrSubsampling: uint = 0x212;
    public static const YCbCrPositioning: uint = 0x213;
    public static const ReferenceBlackWhite: uint = 0x214;

    public static const StripRowCounts: uint = 0x22f;
    public static const Xmp: uint = 0x2bc;

	public static const FileSource : uint = 0xA300;
	public static const SceneType : uint = 0xA301;
	public static const CFAPattern : uint = 0xA302;

	public static const CustomRendered : uint = 0xA401;
	public static const ExposureMode: uint = 0xA402;
	public static const WhiteBalance: uint = 0xA403;
	public static const DigitalZoomRatio: uint = 0xA404;
	public static const FocalLengthIn35mmFilm: uint = 0xA405; 
	public static const SceneCaptureType: uint = 0xA406; 
	public static const GainControl: uint = 0xA407; 
	public static const Contrast: uint = 0xA408; 
	public static const Saturation: uint = 0xA409; 
	public static const Sharpness: uint = 0xA40A; 
	public static const DeviceSettingDescription: uint = 0xA40B; 
	public static const SubjectDistanceRange: uint = 0xA40C;
	
	public static const ImageUniqueID: uint = 0xA420; 


    public static const RelatedImageFileFormat: uint = 0x1000;
    public static const RelatedImageWidth: uint = 0x1001;
    public static const RelatedImageLength: uint = 0x1002;

    public static const Rating: uint = 0x4746;
    public static const RatingPercent: uint = 0x4749;

    public static const WangAnnotation: uint = 0x80a4;

    public static const Matteing: uint = 0x80e3;
    public static const DataType: uint = 0x80e4;
    public static const ImageDepth: uint = 0x80e5;
    public static const TileDepth: uint = 0x80e6;

    public static const Model2: uint = 0x827d;

    public static const CFARepeatPatternDIM: uint = 0x828d;
    public static const CFAPatternNEF: uint = 0x828e;
    public static const BatteryLevel: uint = 0x828f;

    public static const Copyright: uint = 0x8298;

    public static const ExposureTime: uint = 0x829a;

    public static const FNumber: uint = 0x829d;

    public static const MDFileTag: uint = 0x82a5;
    public static const MDScalePixel: uint = 0x82a6;
    public static const MDColorTable: uint = 0x82a7;
    public static const MDLabName: uint = 0x82a8;
    public static const MDSampleInfo: uint = 0x82a9;
    public static const MDPrepDate: uint = 0x82aa;
    public static const MDPrepTime: uint = 0x82ab;
    public static const MDFileUnits: uint = 0x82ac;

    public static const PixelScale: uint = 0x830e;

    public static const Iptc: uint = 0x83bb;

    public static const IntergraphPacketData: uint = 0x847e;
    public static const IntergraphFlagRegisters: uint = 0x847f;
    public static const IntergraphMatrix: uint = 0x8480;

    public static const ModelTiePoint: uint = 0x8482;

    public static const Site: uint = 0x84e0;
    public static const ColorSequence: uint = 0x84e1;
    public static const IT8Header: uint = 0x84e2;
    public static const RasterPadding: uint = 0x84e3;
    public static const BitsPerRunLength: uint = 0x84e4;
    public static const BitsPerExtendedRunLength: uint = 0x84e5;
    public static const ColorTable: uint = 0x84e6;
    public static const ImageColorIndicator: uint = 0x84e7;
    public static const BackgroundColorIndicator: uint = 0x84e8;
    public static const ImageColorValue: uint = 0x84e9;
    public static const BackgroundColorValue: uint = 0x84ea;
    public static const PixelIntensityRange: uint = 0x84eb;
    public static const TransparencyIndicator: uint = 0x84ec;
    public static const ColorCharacterization: uint = 0x84ed;
    public static const HCUsage: uint = 0x84ee;

    public static const SEMInfo: uint = 0x8546;

    public static const AfcpIptc: uint = 0x8568;

    public static const ModelTransform: uint = 0x85d8;

    public static const LeafData: uint = 0x8606;

    public static const App13: uint = 0x8649;

    public static const ExifPointer: uint = 0x8769;

    public static const ICC_Profile: uint = 0x8773;

    public static const ImageLayer: uint = 0x87ac;

    public static const GeoTiffDirectory: uint = 0x87af;
    public static const GeoTiffDoubleParams: uint = 0x87b0;
    public static const GeoTiffAsciiParams: uint = 0x87b1;

    public static const ExposureProgram: uint = 0x8822;

    public static const SpectralSensitivity: uint = 0x8824;
    public static const GPSInfoIFDPointer: uint = 0x8825;

    public static const ISOSpeedRatings: uint = 0x8827;
    public static const OptoElectricConvFactor: uint = 0x8828;
    public static const Interlace: uint = 0x8829;
    public static const TimeZoneOffset: uint = 0x882a;
    public static const SelfTimerMode: uint = 0x882b;

    public static const FaxRecvParams: uint = 0x885c;
    public static const FaxSubAddress: uint = 0x885d;
    public static const FaxRecvTime: uint = 0x885e;

    public static const LeafSubIFD: uint = 0x888a;

    public static const OECF: uint = 0x8828;

    public static const ExifVersion: uint = 0x9000;

    public static const DateTimeOriginal: uint = 0x9003;
    public static const DateTimeDigitized: uint = 0x9004;

    public static const ComponentsConfiguration: uint = 0x9101;
    public static const CompressedBitsPerPixel: uint = 0x9102;

    public static const ShutterSpeedValue: uint = 0x9201;
    public static const ApertureValue: uint = 0x9202;
    public static const BrightnessValue: uint = 0x9203;
    public static const ExposureBiasValue: uint = 0x9204;
    public static const MaxApertureValue: uint = 0x9205;
    public static const SubjectDistance: uint = 0x9206;
    public static const MeteringMode: uint = 0x9207;
    public static const LightSource: uint = 0x9208;
    public static const Flash: uint = 0x9209;

    public static const FocalLength: uint = 0x920a;

    public static const FlashEnergy: uint = 0xa20b;
    public static const SpatialFrequencyResponse: uint = 0xa20c;
    public static const FocalPlaneXResolution: uint = 0xa20e;
    public static const FocalPlaneYResolution: uint = 0xa20f;
    public static const FocalPlaneResolutionUnit: uint = 0xa210;

    public static const ImageNumber: uint = 0x9211;
    public static const SecurityClassification: uint = 0x9212;
    public static const ImageHistory: uint = 0x9213;
    public static const SubjectArea: uint = 0x9214;

    public static const ExposureIndex: uint = 0xa215;

    public static const TIFFEPStandardID: uint = 0x9216;
    public static const SensingMethod: uint = 0xa217;
    public static const NEFSensingMethod: uint = 0x9217;

    public static const StoNits: uint = 0x923f;

    public static const MakerNote: uint = 0x927c;
    public static const UserComment: uint = 0x9286;

    public static const SubSecTime: uint = 0x9290;
    public static const SubSecTimeOriginal: uint = 0x9291;
    public static const SubSecTimeDigitized: uint = 0x9292;

    public static const ImageSourceData: uint = 0x935c;

    public static const XPTitle: uint = 0x9c9b;
    public static const XPComment: uint = 0x9c9c;
    public static const XPAuthor: uint = 0x9c9d;
    public static const XPKeywords: uint = 0x9c9e;
    public static const XPSubject: uint = 0x9c9f;

    public static const FlashPixVersion: uint = 0xa000;
    public static const ColorSpace: uint = 0xa001;
    public static const PixelXDimension: uint = 0xa002;
    public static const PixelYDimension: uint = 0xa003;
    public static const RelatedSoundFile: uint = 0xa004;
    public static const InteroperabilityIFDPointer: uint = 0xa005;

    public static const DNGVersion: uint = 0xc612;
    public static const DNGBackwardVersion: uint = 0xc613;
    public static const UniqueCameraModel: uint = 0xc614;
    public static const LocalizedCameraModel: uint = 0xc615;
    public static const CFAPlaneColor: uint = 0xc616;
    public static const CFALayout: uint = 0xc617;
    public static const LinearizationTable: uint = 0xc618;
    public static const BlackLevelRepeatDim: uint = 0xc619;
    public static const BlackLevel: uint = 0xc61a;
    public static const BlackLevelDeltaH: uint = 0xc61b;
    public static const BlackLevelDeltaV: uint = 0xc61c;
    public static const WhiteLevel: uint = 0xc61d;
    public static const DefaultScale: uint = 0xc61e;
    public static const DefaultCropOrigin: uint = 0xc61f;
    public static const DefaultCropSize: uint = 0xc620;
    public static const ColorMatrix1: uint = 0xc621;
    public static const ColorMatrix2: uint = 0xc622;
    public static const CameraCalibration1: uint = 0xc623;
    public static const CameraCalibration2: uint = 0xc624;
    public static const ReductionMatrix1: uint = 0xc625;
    public static const ReductionMatrix2: uint = 0xc626;
    public static const AnalogBalance: uint = 0xc627;
    public static const AsShotNeutral: uint = 0xc628;
    public static const AsShotWhiteXY: uint = 0xc629;
    public static const BaselineExposure: uint = 0xc62a;
    public static const BaselineNoise: uint = 0xc62b;
    public static const BaselineSharpness: uint = 0xc62c;
    public static const BayerGreenSplit: uint = 0xc62d;
    public static const LinearResponseLimit: uint = 0xc62e;
    public static const CameraSerialNumber: uint = 0xc62f;
    public static const LensInfo: uint = 0xc630;
    public static const MakerNoteSafety: uint = 0xc631;
    public static const AntiAliasStrength: uint = 0xc632;
    public static const DNGPrivateData: uint = 0xc634;
    public static const BestQualityScale: uint = 0xc635;
    public static const CalibrationIlluminant1: uint = 0xc65a;
    public static const CalibrationIlluminant2: uint = 0xc65b;
    public static const RAWImageName: uint = 0xc68b;
    public static const RAWImage: uint = 0xc68c;
    public static const ChromaBlurRadius: uint = 0xC631;
}
}