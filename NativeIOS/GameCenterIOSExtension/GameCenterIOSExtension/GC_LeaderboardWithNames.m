#import "GC_LeaderboardWithNames.h"

@implementation LeaderboardWithNames

@synthesize leaderboard, names;

-(id) initWithLeaderboard:(GKLeaderboard*)lb
{
    self = [super init];
    if( self )
    {
        leaderboard = lb;
    }
    return self;
}

-(void) dealloc
{
    [leaderboard release];
    [names release];
    [super dealloc];
}

@end
