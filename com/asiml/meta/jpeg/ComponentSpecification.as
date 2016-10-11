package com.asiml.meta.jpeg
{
	
	import flash.utils.IDataInput;
	
	
	public class ComponentSpecification
	{
		
		 /**
     * component identifier
     */
    public var Ci: int;
    /**
     * horizontal sampling factor
     */
    public var Hi: int;
    /**
     * vertical sampling factor
     */
    public var Vi: int;
    /**
     * quantisation table destination selector
     */
    public var Tqi: int;

    public var Nb: int;

    private var start: int;
    
	public function ComponentSpecification(ci: int, hi: int, vi:int, tqi:int)
		{
			Ci =  ci;
			Hi =  hi;
			Vi =  vi;
			Tqi =  tqi;
			Nb = Hi * Vi;
		}

	public static function read(ro : IDataInput) : ComponentSpecification {
		var ci :int = ro.readByte();
		var b : int = ro.readByte();
		var hi : int = b >> 4;
		var vi : int = b & 0xF;
		var tqi : int = ro.readByte();
		return new ComponentSpecification(ci, hi, vi, tqi);
 }
}
}