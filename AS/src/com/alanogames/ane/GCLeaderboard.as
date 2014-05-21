package com.alanogames.ane
{
	public class GCLeaderboard
	{
		public var timeScope : int;
		public var playerScope : int;
		public var category : String;
		public var title : String;
		public var rangeStart : int;
		public var rangeLength : int;
		public var scores : Vector.<GCScore>;
		public var localPlayerScore : GCScore;
		public var rangeMax : int;
	}
}
