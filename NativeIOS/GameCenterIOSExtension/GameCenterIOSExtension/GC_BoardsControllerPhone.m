#import "GC_BoardsControllerPhone.h"
#import "GC_NativeMessages.h"

@interface BoardsControllerPhone () {
}

@property (retain) UIWindow* win;
@property FREContext context;

@end

@implementation BoardsControllerPhone

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
    [self dismissViewControllerAnimated:YES completion:^{
        [self.view removeFromSuperview];
        
        UIViewController *parentViewController = [self parentViewController];
        [parentViewController dismissModalViewControllerAnimated:NO];
        [parentViewController.view removeFromSuperview];
        
        [self.win becomeFirstResponder];
        [self.win makeKeyAndVisible];
    }];
    
    FREDispatchStatusEventAsync(context, (const uint8_t*)"", (const uint8_t*)gameCenterViewRemoved);
}

- (void)achievementViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self.view removeFromSuperview];
        
        UIViewController *parentViewController = [self parentViewController];
        [parentViewController dismissModalViewControllerAnimated:NO];
        [parentViewController.view removeFromSuperview];

        [self.win becomeFirstResponder];
        [self.win makeKeyAndVisible];
    }];
    
    FREDispatchStatusEventAsync(context, (const uint8_t*)"", (const uint8_t*)gameCenterViewRemoved);
}

-(void) displayLeaderboard
{
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init] autorelease];
    if( leaderboardController != nil )
    {
        leaderboardController.leaderboardDelegate = self;
        [win addSubview:self.view];
        [self presentModalViewController: leaderboardController animated: YES];
    }
}

-(void) displayLeaderboardWithCategory:(NSString*)category
{
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init] autorelease];
    if( leaderboardController != nil )
    {
        leaderboardController.category = category;
        leaderboardController.leaderboardDelegate = self;
        [win addSubview:self.view];
        [self presentModalViewController: leaderboardController animated: YES];
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
        [win addSubview:self.view];
        [self presentModalViewController: leaderboardController animated: YES];
    }
}

-(void) displayLeaderboardWithTimescope:(int)timeScope
{
    GKLeaderboardViewController *leaderboardController = [[[GKLeaderboardViewController alloc] init] autorelease];
    if( leaderboardController != nil )
    {
        leaderboardController.timeScope = timeScope;
        leaderboardController.leaderboardDelegate = self;
        [win addSubview:self.view];
        [self presentModalViewController: leaderboardController animated: YES];
    }
}

-(void) displayAchievements
{
    GKAchievementViewController *achievementController = [[[GKAchievementViewController alloc] init] autorelease];
    if( achievementController != nil )
    {
        achievementController.achievementDelegate = self;
        [win addSubview:self.view];
        [self presentModalViewController: achievementController animated: YES];
    }
}

#pragma mark - Lifecycle

- (void)dealloc
{
    [super dealloc];
}

@end
