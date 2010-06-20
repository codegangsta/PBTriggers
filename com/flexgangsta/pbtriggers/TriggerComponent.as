package com.flexgangsta.pbtriggers
{
	import com.flexgangsta.pbtriggers.actions.IAction;
	import com.pblabs.engine.entity.EntityComponent;
	
	public class TriggerComponent extends EntityComponent implements ITriggerComponent
	{
		//______________________________________ 
		//	Component Methods
		//______________________________________
		override protected function onAdd():void
		{
			super.onAdd();
			
			for each(var action:IAction in actions)
			{
				action.owner = this;
			}
			
			//Add Event Handlers
			
		}
		
		override protected function onRemove():void
		{
			super.onRemove();
		}
		
		//______________________________________ 
		//	Public Properties
		//______________________________________	
		[TypeHint(type="com.jeremysaenz.components.actions.IAction")]
		public function get actions():Array
		{
			return _actions;
		}
		public function set actions(value:Array):void
		{
			_actions = value;
		}
		
		public function get lastReturn():*
		{
			return _lastReturn;
		}
		
		//______________________________________ 
		//	Public Methods
		//______________________________________
		public function execute():void
		{
			for each(var action:IAction in actions)
			{
				// Early Termination
				if(_exit)
				{
					_exit=false;
					return;
				}
				
				_lastReturn = action.execute();
			}
		}
		
		//______________________________________ 
		//	Private Properties
		//______________________________________
		private var _exit:Boolean;
		private var _lastReturn:*;
		private var _actions:Array = new Array();
	}
}