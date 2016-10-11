package com.asiml.io
{
	internal interface Helper {
		function checkBuffer(len : int) : void;
		function getPosition() : Number;
		function setPosition(pos : Number) : void;
		function close() :void; 
	}
}