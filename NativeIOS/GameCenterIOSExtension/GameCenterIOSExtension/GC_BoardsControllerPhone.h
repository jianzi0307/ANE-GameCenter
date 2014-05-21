#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "FlashRuntimeExtensions.h"
#import "GC_BoardsController.h"

@interface BoardsControllerPhone : UIViewController <BoardsController,GKLeaderboardViewControllerDelegate,GKAchievementViewControllerDelegate>
{
    
}
-(id) initWithContext:(FREContext)context;
-(void) displayLeaderboard;
-(void) displayLeaderboardWithCategory:(NSString*)category;
-(void) displayLeaderboardWithCategory:(NSString*)category andTimescope:(int)timeScope;
-(void) displayLeaderboardWithTimescope:(int)timeScope;
-(void) displayAchievements;
@end
