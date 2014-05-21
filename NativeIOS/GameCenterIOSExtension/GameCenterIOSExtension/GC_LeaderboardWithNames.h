#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface LeaderboardWithNames : NSObject
{
}
@property (retain) GKLeaderboard* leaderboard;
@property (retain) NSDictionary* names;

-(id) initWithLeaderboard:(GKLeaderboard*)lb;
@end
