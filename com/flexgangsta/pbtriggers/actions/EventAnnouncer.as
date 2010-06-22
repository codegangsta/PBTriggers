package com.flexgangsta.pbtriggers.actions
{
	import com.flexgangsta.pbtriggers.ITriggerComponent;
	import com.pblabs.engine.debug.Logger;
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	public class EventAnnouncer implements IAction
	{
		//______________________________________ 
		//	Public Properties
		//______________________________________
		public var properties:Dictionary = new Dictionary();
		
		public var eventType:String;
		
		public function set definition(value:String):void
		{
			try 
			{
				EventClass = getDefinitionByName(value) as Class;
				
			}
			catch(e:Error)
			{
				Logger.error(this,"set definition","Class definition " + value + "does not exist");
			}
		}
		
		public function set owner(value:ITriggerComponent):void
		{
			_owner = value;
		}
		
		//______________________________________ 
		//	Public Methods
		//______________________________________
		public function execute():*
		{
			// TODO, put checks and properties in
			var event:Event = new EventClass(eventType);
			_owner.owner.eventDispatcher.dispatchEvent(event);
			return event;
		}
		
		//______________________________________ 
		//	Private Properties
		//______________________________________
		private var _owner:ITriggerComponent;
		private var EventClass:Class
	}
}