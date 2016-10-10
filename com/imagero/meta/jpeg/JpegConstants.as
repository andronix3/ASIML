package com.imagero.meta.jpeg
{

	/**
	 * Enumeration class with JPEG constants.
	 * 
	 */
	public class JpegConstants {

    public static const MARKER:uint = 0xFF;
    /* SOFn Start Of Frame N */

    /*Non-differential Huffmann*/

	/** 
	 * Baseline DCT (Non-differential Huffmann)
	 */
    public static const SOF0:uint = 0xC0;
	/**
	 * Extended sequential DCT (Non-differential Huffmann)
	 */
    public static const SOF1:uint = 0xC1;
	/**
	 * Progressive DCT (Non-differential Huffmann)
	 */
    public static const SOF2:uint = 0xC2;
	/**
	 * Spatial (sequential) lossless (Non-differential Huffmann)
	 */
    public static const SOF3:uint = 0xC3;

     /*Differential Huffmann*/

	/**
	 * Differential sequential DCT (Differential Huffmann)
	 */
    public static const SOF5:uint = 0xC5;
	/**
	 * Differential Progressive DCT (Differential Huffmann)
	 */
    public static const SOF6:uint = 0xC6;
	/**
	 * Differential Spatial (Differential Huffmann)
	 */
    public static const SOF7:uint = 0xC7;

    /*Non-differential arithmetic */
	/**
	 * reserved for JPEG extensions
	 */
    public static const JPG:uint = 0xC8;

	/**
	 * Extended sequential DCT ( Non-differential arithmetic)
	 */
    public static const SOF9:uint = 0xC9;

	/**
	 * Progressive DCT (Non-differential arithmetic)
	 */
    public static const SOF10:uint = 0xCA;

	/**
	 * Spatial (sequential) lossless (Non-differential arithmetic)
	 */
    public static const SOF11:uint = 0xCB;

     /*Differential arithmetic */

	/**
	 * Differential sequential DCT (Differential arithmetic)
	 * */
    public static const SOF13:uint = 0xCD;

	/**
	 * Differential Progressive DCT (Differential arithmetic)
	 */
    public static const SOF14:uint = 0xCE;

	/**
	 * Differential Spatial (Differential arithmetic)
	 */
    public static const SOF15:uint = 0xCF;	//

    /** Start Of Image */
    public static const SOI:uint = 0xD8;
    /** End Of Image */
    public static const EOI:uint = 0xD9;
    /** Comment */
    public static const COM:uint = 0xFE;

    public static const APP_0:uint = 0xE0;
    public static const APP_1:uint = 0xE1;
    public static const APP_2:uint = 0xE2;
    public static const APP_3:uint = 0xE3;
    public static const APP_4:uint = 0xE4;
    public static const APP_5:uint = 0xE5;
    public static const APP_6:uint = 0xE6;
    public static const APP_7:uint = 0xE7;
    public static const APP_8:uint = 0xE8;
    public static const APP_9:uint = 0xE9;
    public static const APP_10:uint = 0xEA;
    public static const APP_11:uint = 0xEB;
    public static const APP_12:uint = 0xEC;
    public static const APP_13:uint = 0xED;
    public static const APP_14:uint = 0xEE;
    public static const APP_15:uint = 0xEF;
    

    /**
     * Define Huffman table(s)
     */
    public static const DHT:uint = 0xC4;
    /**
     * Define arithmetic coding conditions
     */
    public static const DAC:uint = 0xCC;

    /*restart interval termination*/

    public static const RST0:uint = 0xD0;
    public static const RST1:uint = 0xD1;
    public static const RST2:uint = 0xD2;
    public static const RST3:uint = 0xD3;
    public static const RST4:uint = 0xD4;
    public static const RST5:uint = 0xD5;
    public static const RST6:uint = 0xD6;
    public static const RST7:uint = 0xD7;

    /* other markers */
    /**
     * Start Of Scan (begin of compressed data)
     */
    public static const SOS:uint = 0xDA;
    /**
     * define quantisation table(s)
     */
    public static const DQT:uint = 0xDB;
    /**
     * define number of lines
     */
    public static const DNL:uint = 0xDC;
    /**
     * define restart interval
     */
    public static const DRI:uint = 0xDD;

    /**
     * Define hierarchical progression
     */
    public static const DHP:uint = 0xDE;
}

}