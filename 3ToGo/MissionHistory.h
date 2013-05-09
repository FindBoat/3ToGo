//
//  MissionHistory.h
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Mission;
@interface MissionHistory : NSObject

+ (Mission *)missionForToday;
+ (NSArray *)missionsForThisWeek;
+ (Mission *)defaultMission;
+ (void)initMissionHistory;
+ (BOOL)saveMissionHistory;

+ (void)initTestMissionHistory;

@end
