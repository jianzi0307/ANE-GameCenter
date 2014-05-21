#import "GC_BoardsControllerPad.h"
#import "GC_NativeMessages.h"

@interface BoardsControllerPad () {
}

@property (retain) UIWindow* win;
@property FREContext context;

@end

@implementation BoardsControllerPad

@synthesize win,context;

- (id)initWithContext:(FREContext)extensionContext
{
    self = [super init];
    if( self )
    {
        win = [UIApplication sharedApplication].keyWindow;
        context = extensionContext;
    }
    return self;
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [win.rootViewController dismissModalViewControllerAnimated:YES];
    FREDispatchStatusEventAsync(context, (const uint8_t*)"", (const uint8_t*)gameCenterViewRemoved);
}

- (void)achievementViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [win.rootViewController dismissModalViewControllerAnimated:YES];
    FREDispatchStatusEventAsync(context, (const uint8_t*)"", (const uint8_t*)gameCenterViewRemoved);
}

-(void) displayLeaderboard
{
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init] autorelease];
    if( leaderboardController != nil )
    {
        leaderboardController.leaderboardDelegate = self;
        [win.rootViewController presentModalViewController: leaderboardController animated: YES];
    }
}

-(void) displayLeaderboardWithCategory:(NSString*)category
{
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init] autorelease];
    if( leaderboardController != nil )
    {
        leaderboardController.category = category;
        leaderboardController.leaderboardDelegate = self;
        [win.rootViewController presentModalViewController: leaderboardController animated: YES];
    }
}

-(void) displayLeaderboardWithCategory:(NSString*)category andTimescope:(int)timeScope
{
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init] autorelease];
    if( leaderboardController != nil )
    {
        leaderboardController.category = category;
        leaderboardController.timeScope = timeScope;
        leaderboardController.leaderboardDelegate = self;
        [win.rootViewController presentModalViewController: leaderboardController animated: YES];
    }
}

-(void) displayLeaderboardWithTimescope:(int)timeScope
{
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init] autorelease];
    if( leaderboardController != nil )
    {
        leaderboardController.timeScope = timeScope;
        leaderboardController.leaderboardDelegate = self;
        [win.rootViewController presentModalViewController: leaderboardController animated: YES];
    }
}

-(void) displayAchievements
{
    GKAchievementViewController *achievementController = [[[GKAchievementViewController alloc] init] autorelease];
    if( achievementController != nil )
    {
        achievementController.achievementDelegate = self;
        [win.rootViewController presentModalViewController: achievementController animated: YES];
    }
}

#pragma mark - Lifecycle

- (void)dealloc
{
    [super dealloc];
}

@end
