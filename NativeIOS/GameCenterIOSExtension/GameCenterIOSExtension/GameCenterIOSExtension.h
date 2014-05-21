#import "FlashRuntimeExtensions.h"

@interface GameCenterIOSExtension : NSObject

+ (GameCenterIOSExtension *)sharedInstance;

@end

DEFINE_ANE_FUNCTION( GC_isSupported );
DEFINE_ANE_FUNCTION( GC_authenticateLocalPlayer );
DEFINE_ANE_FUNCTION( GC_getLocalPlayer );
DEFINE_ANE_FUNCTION( GC_reportScore );
DEFINE_ANE_FUNCTION( GC_showStandardLeaderboard );
DEFINE_ANE_FUNCTION( GC_showStandardLeaderboardWithCategory );
DEFINE_ANE_FUNCTION( GC_showStandardLeaderboardWithTimescope );
DEFINE_ANE_FUNCTION( GC_showStandardLeaderboardWithCategoryAndTimescope );
DEFINE_ANE_FUNCTION( GC_getLeaderboard );
DEFINE_ANE_FUNCTION( GC_reportAchievement );
DEFINE_ANE_FUNCTION( GC_showStandardAchievements );
DEFINE_ANE_FUNCTION( GC_getAchievements );
DEFINE_ANE_FUNCTION( GC_getLocalPlayerFriends );
DEFINE_ANE_FUNCTION( GC_getLocalPlayerScore );
DEFINE_ANE_FUNCTION( GC_getStoredLocalPlayerScore );
DEFINE_ANE_FUNCTION( GC_getStoredLeaderboard );
DEFINE_ANE_FUNCTION( GC_getStoredAchievements );
DEFINE_ANE_FUNCTION( GC_getStoredPlayers );

void GameCenterIOSExtensionExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);
void GameCenterIOSExtensionExtFinalizer(void* extData);
void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);
void ContextFinalizer(FREContext ctx);