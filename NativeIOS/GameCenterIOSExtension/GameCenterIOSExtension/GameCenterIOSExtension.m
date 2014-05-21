#import "GameCenterIOSExtension.h"
#import "GameCenterHandler.h"

//FREContext GameCenterIOSExtensionCtx = nil;
GameCenterHandler* GC_handler;

@implementation GameCenterIOSExtension

#pragma mark - Singleton

static GameCenterIOSExtension *sharedInstance = nil;

+ (GameCenterIOSExtension *)sharedInstance
{
    if (sharedInstance == nil)
    {
        sharedInstance = [[super allocWithZone:NULL] init];
    }

    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return self;
}

@end

#pragma mark - C interface

DEFINE_ANE_FUNCTION( GC_isSupported )
{
    return [GC_handler isSupported];
}

DEFINE_ANE_FUNCTION( GC_authenticateLocalPlayer )
{
    return [GC_handler authenticateLocalPlayer];
}

DEFINE_ANE_FUNCTION( GC_getLocalPlayer )
{
    return [GC_handler getLocalPlayer];
}

DEFINE_ANE_FUNCTION( GC_reportScore )
{
    return [GC_handler reportScore:argv[1] inCategory:argv[0]];
}

DEFINE_ANE_FUNCTION( GC_showStandardLeaderboard )
{
    return [GC_handler showStandardLeaderboard];
}

DEFINE_ANE_FUNCTION( GC_showStandardLeaderboardWithCategory )
{
    return [GC_handler showStandardLeaderboardWithCategory:argv[0]];
}

DEFINE_ANE_FUNCTION( GC_showStandardLeaderboardWithTimescope )
{
    return [GC_handler showStandardLeaderboardWithTimescope:argv[0]];
}

DEFINE_ANE_FUNCTION( GC_showStandardLeaderboardWithCategoryAndTimescope )
{
    return [GC_handler showStandardLeaderboardWithCategory:argv[0] andTimescope:argv[1]];
}

DEFINE_ANE_FUNCTION( GC_getLeaderboard )
{
    return [GC_handler getLeaderboardWithCategory:argv[0] playerScope:argv[1] timeScope:argv[2] rangeMin:argv[3] rangeMax:argv[4]];
}

DEFINE_ANE_FUNCTION( GC_reportAchievement )
{
    return [GC_handler reportAchievement:argv[0] withValue:argv[1] andBanner:argv[2]];
}

DEFINE_ANE_FUNCTION( GC_showStandardAchievements )
{
    return [GC_handler showStandardAchievements];
}

DEFINE_ANE_FUNCTION( GC_getAchievements )
{
    return [GC_handler getAchievements];
}

DEFINE_ANE_FUNCTION( GC_getLocalPlayerFriends )
{
    return [GC_handler getLocalPlayerFriends];
}

DEFINE_ANE_FUNCTION( GC_getLocalPlayerScore )
{
    return [GC_handler getLocalPlayerScoreInCategory:argv[0] playerScope:argv[1] timeScope:argv[2]];
}

DEFINE_ANE_FUNCTION( GC_getStoredLocalPlayerScore )
{
    return [GC_handler getStoredLocalPlayerScore:argv[0]];
}

DEFINE_ANE_FUNCTION( GC_getStoredLeaderboard )
{
    return [GC_handler getStoredLeaderboard:argv[0]];
}

DEFINE_ANE_FUNCTION( GC_getStoredAchievements )
{
    return [GC_handler getStoredAchievements:argv[0]];
}

DEFINE_ANE_FUNCTION( GC_getStoredPlayers )
{
    return [GC_handler getStoredPlayers:argv[0]];
}


#pragma mark - ANE setup

void GameCenterIOSExtensionExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) 
{
    NSLog(@"Entering GameCenterIOSExtensionExtInitializer()");

    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
    *ctxFinalizerToSet = &ContextFinalizer;

    NSLog(@"Exiting GameCenterIOSExtensionExtInitializer()");
}

void GameCenterIOSExtensionExtFinalizer(void* extData) 
{
    NSLog(@"Entering GameCenterIOSExtensionExtFinalizer()");

    // Nothing to clean up.
    NSLog(@"Exiting GameCenterIOSExtensionExtFinalizer()");
    return;
}

void ContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet )
{
    NSLog(@"Entering ContextInitializer()");
    static FRENamedFunction functionMap[] = {
        MAP_FUNCTION( GC_isSupported, NULL ),
        MAP_FUNCTION( GC_authenticateLocalPlayer, NULL ),
        MAP_FUNCTION( GC_getLocalPlayer, NULL ),
        MAP_FUNCTION( GC_reportScore, NULL ),
        MAP_FUNCTION( GC_reportAchievement, NULL ),
        MAP_FUNCTION( GC_showStandardLeaderboard, NULL ),
        MAP_FUNCTION( GC_showStandardLeaderboardWithCategory, NULL ),
        MAP_FUNCTION( GC_showStandardLeaderboardWithTimescope, NULL ),
        MAP_FUNCTION( GC_showStandardLeaderboardWithCategoryAndTimescope, NULL ),
        MAP_FUNCTION( GC_showStandardAchievements, NULL ),
        MAP_FUNCTION( GC_getLocalPlayerFriends, NULL ),
        MAP_FUNCTION( GC_getLocalPlayerScore, NULL ),
        MAP_FUNCTION( GC_getLeaderboard, NULL ),
        MAP_FUNCTION( GC_getStoredLeaderboard, NULL ),
        MAP_FUNCTION( GC_getStoredLocalPlayerScore, NULL ),
        MAP_FUNCTION( GC_getStoredPlayers, NULL ),
        MAP_FUNCTION( GC_getAchievements, NULL ),
        MAP_FUNCTION( GC_getStoredAchievements, NULL )
    };
    
	*numFunctionsToSet = sizeof( functionMap ) / sizeof( FRENamedFunction );
	*functionsToSet = functionMap;
    
    GC_handler = [[GameCenterHandler alloc] initWithContext:ctx];
    
    NSLog(@"Exiting ContextInitializer()");
}

void ContextFinalizer(FREContext ctx) 
{
    NSLog(@"Entering ContextFinalizer()");

    // Nothing to clean up.
    NSLog(@"Exiting ContextFinalizer()");
    return;
}


