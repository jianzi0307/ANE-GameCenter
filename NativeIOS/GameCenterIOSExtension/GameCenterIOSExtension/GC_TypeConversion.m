//
//  TypeConversion.m
//  GameCenterIosExtension
//
//  Created by Richard Lord on 18/06/2012.
//  Copyright (c) 2012 Stick Sports Ltd. All rights reserved.
//

#import "GC_TypeConversion.h"

#define ASPlayer "com.alanogames.ane.GCPlayer"
#define ASScore "com.alanogames.ane.GCScore"
#define ASAchievement "com.alanogames.ane.GCAchievement"

@implementation GC_TypeConversion

- (FREResult) FREGetObject:(FREObject)object asString:(NSString**)value
{
    FREResult result;
    uint32_t length = 0;
    const uint8_t* tempValue = NULL;
    
    result = FREGetObjectAsUTF8( object, &length, &tempValue );
    if( result != FRE_OK ) return result;
    
    *value = [NSString stringWithUTF8String: (char*) tempValue];
    return FRE_OK;
}

- (FREResult) FREGetString:(NSString*)string asObject:(FREObject*)asString
{
    if( string == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    const char* utf8String = string.UTF8String;
    unsigned long length = strlen( utf8String );
    return FRENewObjectFromUTF8( (uint32_t)(length + 1), (uint8_t*) utf8String, asString );
}

- (FREResult) FREGetDate:(NSDate*)date asObject:(FREObject*)asDate
{
    if( date == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    NSTimeInterval timestamp = date.timeIntervalSince1970 * 1000;
    FREResult result;
    FREObject time;
    result = FRENewObjectFromDouble( timestamp, &time );
    if( result != FRE_OK ) return result;
    result = FRENewObject( (const uint8_t*)"Date", 0, NULL, asDate, NULL );
    if( result != FRE_OK ) return result;
    result = FRESetObjectProperty( *asDate, (const uint8_t*)"time", time, NULL);
    if( result != FRE_OK ) return result;
    return FRE_OK;
}

- (FREResult) FRESetObject:(FREObject)asObject property:(const uint8_t*)propertyName toString:(NSString*)value
{
    if( value == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    FREResult result;
    FREObject asValue;
    result = [self FREGetString:value asObject:&asValue];
    if( result != FRE_OK ) return result;
    result = FRESetObjectProperty( asObject, propertyName, asValue, NULL );
    if( result != FRE_OK ) return result;
    return FRE_OK;
}

- (FREResult) FRESetObject:(FREObject)asObject property:(const uint8_t*)propertyName toBool:(uint32_t)value
{
    FREResult result;
    FREObject asValue;
    result = FRENewObjectFromBool( value, &asValue );
    if( result != FRE_OK ) return result;
    result = FRESetObjectProperty( asObject, propertyName, asValue, NULL );
    if( result != FRE_OK ) return result;
    return FRE_OK;
}

- (FREResult) FRESetObject:(FREObject)asObject property:(const uint8_t*)propertyName toInt:(int32_t)value
{
    FREResult result;
    FREObject asValue;
    result = FRENewObjectFromInt32( value, &asValue );
    if( result != FRE_OK ) return result;
    result = FRESetObjectProperty( asObject, propertyName, asValue, NULL );
    if( result != FRE_OK ) return result;
    return FRE_OK;
}

- (FREResult) FRESetObject:(FREObject)asObject property:(const uint8_t*)propertyName toDouble:(double)value
{
    FREResult result;
    FREObject asValue;
    result = FRENewObjectFromDouble( value, &asValue );
    if( result != FRE_OK ) return result;
    result = FRESetObjectProperty( asObject, propertyName, asValue, NULL );
    if( result != FRE_OK ) return result;
    return FRE_OK;
}

- (FREResult) FRESetObject:(FREObject)asObject property:(const uint8_t*)propertyName toDate:(NSDate*)value
{
    if( value == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    FREResult result;
    FREObject asValue;
    result = [self FREGetDate:value asObject:&asValue];
    if( result != FRE_OK ) return result;
    result = FRESetObjectProperty( asObject, propertyName, asValue, NULL );
    if( result != FRE_OK ) return result;
    return FRE_OK;
}

- (FREResult) FREGetGKPlayer:(GKPlayer*)player asObject:(FREObject*)asPlayer
{
    if( player == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    FREResult result;
    
    result = FRENewObject( (const uint8_t*)ASPlayer, 0, NULL, asPlayer, NULL);
    if( result != FRE_OK ) return result;
    
    if( player.playerID )
    {
        result = [self FRESetObject:*asPlayer property:(const uint8_t*)"id" toString:player.playerID];
        if( result != FRE_OK ) return result;
    }
    
    if( player.alias )
    {
        result = [self FRESetObject:*asPlayer property:(const uint8_t*)"alias" toString:player.alias];
        if( result != FRE_OK ) return result;
    }
    
    result = [self FRESetObject:*asPlayer property:(const uint8_t*)"isFriend" toBool:player.isFriend];
    if( result != FRE_OK ) return result;
    
    return FRE_OK;
}

- (FREResult) FREGetGKScore:(GKScore*)score forPlayer:(GKPlayer*)player asObject:(FREObject*)asScore
{
    if( score == nil || player == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    FREResult result;
    FREObject asPlayer;
    
    result = FRENewObject( (const uint8_t*)ASScore, 0, NULL, asScore, NULL);
    if( result != FRE_OK ) return result;
    
    if( score.category )
    {
        result = [self FRESetObject:*asScore property:(const uint8_t*)"category" toString:score.category];
        if( result != FRE_OK ) return result;
    }
    
    result = [self FRESetObject:*asScore property:(const uint8_t*)"value" toInt:(uint32_t)score.value];
    if( result != FRE_OK ) return result;
    
    if( score.formattedValue )
    {
        result = [self FRESetObject:*asScore property:(const uint8_t*)"formattedValue" toString:score.formattedValue];
        if( result != FRE_OK ) return result;
    }
    
    if( score.date )
    {
        result = [self FRESetObject:*asScore property:(const uint8_t*)"date" toDate:score.date];
        if( result != FRE_OK ) return result;
    }
    
    result = [self FREGetGKPlayer:player asObject:&asPlayer];
    if( result != FRE_OK ) return result;
    result = FRESetObjectProperty( *asScore,(const uint8_t*)"player", asPlayer, NULL );
    if( result != FRE_OK ) return result;
    
    result = [self FRESetObject:*asScore property:(const uint8_t*)"rank" toInt:(uint32_t)score.rank];
    if( result != FRE_OK ) return result;
    
    return FRE_OK;
}

- (FREResult) FREGetGKAchievement:(GKAchievement*)achievement asObject:(FREObject*)asAchievement
{
    if( achievement == nil )
    {
        return FRE_INVALID_ARGUMENT;
    }
    FREResult result;
    
    result = FRENewObject( (const uint8_t*)ASAchievement, 0, NULL, asAchievement, NULL);
    if( result != FRE_OK ) return result;
    
    if( achievement.identifier )
    {
        result = [self FRESetObject:*asAchievement property:(const uint8_t*)"id" toString:achievement.identifier];
        if( result != FRE_OK ) return result;
    }
    
    result = [self FRESetObject:*asAchievement property:(const uint8_t*)"value" toDouble:achievement.percentComplete / 100.0];
    if( result != FRE_OK ) return result;
    
    return FRE_OK;
}

@end
