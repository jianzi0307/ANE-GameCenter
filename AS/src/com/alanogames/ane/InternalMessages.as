package com.alanogames.ane
{
	internal class InternalMessages
	{
		// Messages received from the native extension
		internal static const notAuthenticated : String = "NotAuthenticated";
		internal static const localPlayerAuthenticated : String = "LocalPlayerAuthenticated";
		internal static const localPlayerNotAuthenticated : String = "LocalPlayerNotAuthenticated";
		
		internal static const scoreReported : String = "ScoreReported";
		internal static const scoreNotReported : String = "ScoreNotReported";
		internal static const achievementReported : String = "AchievementReported";
		internal static const achievementNotReported : String = "AchievementNotReported";
		internal static const loadFriendsComplete : String = "LoadFriendsComplete";
		internal static const loadFriendsFailed : String = "LoadFriendsFailed";
		internal static const loadLocalPlayerScoreComplete : String = "LoadLocalPlayerScoreComplete";
		internal static const loadLocalPlayerScoreFailed : String = "LoadLocalPlayerScoreFailed";
		internal static const loadLeaderboardComplete : String = "LoadLeaderboardComplete";
		internal static const loadLeaderboardFailed : String = "LoadLeaderboardFailed";
		internal static const loadAchievementsComplete : String = "LoadAchievementsComplete";
		internal static const loadAchievementsFailed : String = "LoadAchievementsFailed";
		internal static const gameCenterViewRemoved : String = "GameCenterViewRemoved";
		
		// Error messages dispatched from here
		internal static const notSupportedError : String = "Game Kit is not supported on this device.";
		internal static const authenticationNotAttempted : String = "You must call authenticateLocalPlayer to get the local player's Game Kit credentials.";
		internal static const notAuthenticatedError : String = "The local player is not authenticated on Game Kit.";
	}
}
