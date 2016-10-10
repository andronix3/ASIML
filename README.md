# ASIML
Action Script 3 Image Metadata Library

Example usage:


    <?xml version="1.0" encoding="utf-8"?>
    <mx:WindowedApplication xmlns:mx="http://www.adobe.com/2006/mxml" layout="absolute" initialize="initApp()">
       <mx:Script>
        <![CDATA[
        
			// Imports

			// - system imports		
			import mx.collections.*;
			import mx.core.Application; 
			import mx.core.UIComponent;
			import mx.events.FlexEvent;
			import mx.events.MenuEvent;
			import mx.utils.StringUtil;
			import mx.managers.*;
			import mx.controls.*;

			import flash.system.*;

			// - user imports
            import com.imagero.meta.jpeg.JpegInfo;
            import com.imagero.meta.jpeg.JpegListener;
            import com.imagero.meta.jpeg.PrintingJpegListener;
            import com.imagero.io.InputStream;
            import com.imagero.meta.jpeg.JpegStream;

            public function initApp():void
            {
                output.text = "";

                //file to load
                var fn : String = "<filename>";	

                var f : File = new File(fn);
                var fs : FileStream = new FileStream();
                fs.open(f, FileMode.READ);
              
                var jpegInfo : JpegInfo = new JpegInfo(fs);

                //get complete image metadata
                var xml : XML = jpegInfo.xml;
                output.text += xml;
              
                fs.close();

                //get thumbnails
                var thumbs : Array = jpegInfo.thumbnails;
                var x : uint = 200;
                for each(var b : Bitmap in thumbs)
                {
                    var label : Label = new Label();
                    label.x = x;
                    x += 200;
                    
                    //and show them
                    label.addChild(b);
                   	addChild(label);
                }
            }
        ]]>
    </mx:Script>

    <mx:Label id="Title" fontSize="24" fontStyle="bold" text='"Hello, world!" Example'/>
    <mx:TextArea id="output" width="1000" height="600" x="250" y="200"/>
  
    </mx:WindowedApplication>
