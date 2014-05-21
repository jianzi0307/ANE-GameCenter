/*
 * Based on ideas used in Robert Penner's AS3-signals - https://github.com/robertpenner/as3-signals
 */

package  com.alanogames.ane.signals
{
	/**
	 * Provides a fast signal for use where one parameter is dispatched with the signal.
	 */
	public class GCSignal1 extends SignalBase
	{
		private var type : Class;

		public function GCSignal1( type : Class )
		{
			this.type = type;
		}

		public function dispatch( object : * ) : void
		{
			startDispatch();
			var node : ListenerNode;
			for ( node = head; node; node = node.next )
			{
				node.listener( object );
				if( node.once )
				{
					remove( node.listener );
				}
			}
			endDispatch();
		}
	}
}
