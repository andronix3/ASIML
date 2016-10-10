package com.imagero.meta.tiff
{
	import com.imagero.meta.MetadataClass;
	
	import mx.collections.ArrayList;
	
	/**
	 * ImageFileDirectory represents TIFF IFD.
	 * 
	 */
	public class ImageFileDirectory {
		
		private var _entryCount:uint;
		private var entries : Array = new Array();
		private var _nextOffset : uint;
		private var nextIFD : ImageFileDirectory;
		private var _children : ArrayList;
						
		private var _category : MetadataClass = MetadataClass.TIFF;
		
		/**
		 * get IFD entry count
		 * 
		 */
		public function get entryCount() : uint {
			return _entryCount;
		}
		
		/**
		 * Get metadata category
		 * @see MetadataClass
		 */
		public function get category() : MetadataClass {
			return _category;
		}
		
		/**
		 * Get offset of next IFD.
		 * 
		 * @return offset of next IFD or 0 if current IFD is last.
		 * 
		 */
		public function get nextOffset(): uint {
			return _nextOffset;
		}
		
		/**
		 * Get next IFD.
		 * 
		 */
		public function get next() : ImageFileDirectory {
			return nextIFD;
		}
		
		/**
		 * Get index<i>th</i> IFD entry.
		 * 
		 */
		public function getEntryAt(index:uint):IFDEntry {
			return entries[index];
		}
		
		/**
		 * Get IFD entry with given tag.
		 * 
		 */
		public function getEntry(tag : uint) : IFDEntry {
			for(var i : uint = 0; i < _entryCount; i++) {
				if(IFDEntry (entries[i]).tag == tag) {
					return entries[i];
				}
			}
			return null;
		}
		
		/**
		 * @private
		 * 
		 */
		public function get children() : Array {
			return _children.source.slice(); 
		}
		
		/**
		 * @private
		 * 
		 */
		internal function addEntry(entry : IFDEntry) : void {
			entries.push(entry);
			entry.setCategory0(category);
			entry.meta;
		}
		/**
		 * @private
		 * 
		 */
		internal function setCategory0(cat : MetadataClass) :void {
			_category = cat;
			for each(var item : IFDEntry in entries) {
				item.setCategory0(cat); 
			}
		}
		/**
		 * @private 
		 * For internal use only - public due to bug in FlexBuilder 
		 * 
		 */		
		public function setNext(nextIFD : ImageFileDirectory) : void {
			this.nextIFD = nextIFD;
		}
		
		/**
		 * @private
		 * 
		 */
		internal function setEntryCount(entryCount : uint) : void {
			this._entryCount = entryCount;
		}
		
		/**
		 * @private
		 * 
		 */
		internal function setNextIFDOffset(nextOffset : uint) : void {
			this._nextOffset = nextOffset;
		}
		
		/**
		 * @private
		 * 
		 */
		internal function addChild(child : ImageFileDirectory) : void {
			_children.addItem(child);
		}
		
		/**
		 * @private
		 * 
		 */
		public function print() : void {
			trace(xml);
		}
		
		/**
		 * Create XML object from this IFD.
		 * 
		 */
		public function get xml() : XML {
			var ifd : XML = <ImageFileDirectory></ImageFileDirectory>;
			ifd.type = category.type;
			var ee : XML = new XML("<entries></entries>");
			for(var i : uint = 0; i < entryCount; i++) {
				ee.appendChild(getEntryAt(i).xml);
			}
			ifd.appendChild(ee);
			return ifd;			
		}
	}
}