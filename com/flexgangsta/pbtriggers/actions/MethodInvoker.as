package com.flexgangsta.pbtriggers.actions
{
	import com.flexgangsta.pbtriggers.ITriggerComponent;
	import com.pblabs.engine.entity.PropertyReference;

	public class MethodInvoker implements IAction
	{
		//______________________________________ 
		//	Public Properties
		//______________________________________
		public var methodReference:PropertyReference;
		public var args:Array = new Array();
		
		public function set owner(value:ITriggerComponent):void
		{
			_owner = value;
		}
		
		//______________________________________ 
		//	Public Methods
		//______________________________________
		public function execute():*
		{
			var processedArguments:Array = new Array();
			
			//process the arguments
			for(var i:int=0; i<args.length; i++)
			{
				var arg:* = args[i];
				if(arg is PropertyReference)
					processedArguments.push(_owner.owner.getProperty(arg as PropertyReference));
				else
					processedArguments.push(arg);
			}
			
			// Create the method and execute
			var method:Function = _owner.owner.getProperty(methodReference);
			return method.apply(null,processedArguments);
		}
		
		//______________________________________ 
		//	Private Methods
		//______________________________________
		private var _owner:ITriggerComponent;
	}
}