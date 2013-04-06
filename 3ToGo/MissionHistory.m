//
//  MissionHistory.m
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "MissionHistory.h"
#import "Mission.h"
#import "Constants.h"
#import "Utility.h"
#import "Task.h"

@implementation MissionHistory

static NSMutableArray *MissionHistoryList = nil;
static NSInteger MaxHistoryLength = 21;
static int HourPerDay = 60 * 60 * 24;


+ (Mission *)missionForToday {
    NSDate *today = [Utility dateWithOutTime:[NSDate date]];
    NSDate *mostRecentMissionDate = ((Mission *)[MissionHistoryList lastObject]).date;
    if ([MissionHistoryList count] == 0 || [mostRecentMissionDate compare:today] == NSOrderedAscending) {
        [MissionHistoryList addObject:[MissionHistory generateDefaultMission]];
    }
    return [MissionHistoryList lastObject];
}

+ (NSArray *)missionsForThisWeek {
    int weekDay = [[Utility getWeekday:[NSDate date]] weekday];
    int num = (weekDay == 1) ? 7 : weekDay - 1;
    NSMutableArray *missions = [NSMutableArray array];
    int historyLength = [MissionHistoryList count];
    int need = num < historyLength ? num : historyLength;
    for (int i = 0; i < need; i++) {
        Mission *mission = [MissionHistoryList objectAtIndex:historyLength - i - 1];
        if ([missions count] > 0) {
            NSDate *date1 = ((Mission *)[missions objectAtIndex:0]).date;
            NSDate *date2 = mission.date;
            if ([Utility getDateDiff:date2 andDate:date1] > 1) {
                break;
            }
        }
        [missions insertObject:mission atIndex:0];
    }
    return missions;
}


+ (void)initMissionHistory {
    if (MissionHistoryList) {
        return;
    }
    // Load mission history from file.
    if ([[NSFileManager defaultManager] fileExistsAtPath:[Constants missionHistoryPath]]) {
        NSLog(@"Loading mission history...");
        MissionHistoryList = [NSKeyedUnarchiver unarchiveObjectWithFile:[Constants missionHistoryPath]];
    } else {
        MissionHistoryList = [NSMutableArray array];
    }
    NSLog(@"Init mission history: %@", MissionHistoryList);
    [MissionHistory clearPreviousMissionHistory];
}

+ (BOOL)saveMissionHistory {
    NSLog(@"Saving mission history...");
    return [NSKeyedArchiver archiveRootObject:MissionHistoryList toFile:[Constants missionHistoryPath]];
}

+ (Mission *)generateDefaultMission {
    Task *task1 = [[Task alloc] initWithTitle:@"Most Important Task" andRank:0];
    Task *task2 = [[Task alloc] initWithTitle:@"Important Task" andRank:1];
    Task *task3 = [[Task alloc] initWithTitle:@"Task" andRank:2];
    NSMutableArray *tasks = [[NSMutableArray alloc] initWithObjects:task1, task2, task3, nil];
    return [[Mission alloc] initWithTasks:tasks];
}

+ (void)clearMissionHistory {
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr removeItemAtPath:[Constants missionHistoryPath] error:&error]) {
        NSLog(@"Unable to delete file: %@", [error localizedDescription]);
    } else {
        NSLog(@"Mission history cleared.");
    }
}

+ (void)clearPreviousMissionHistory {
    if ([MissionHistoryList count] > MaxHistoryLength) {
        NSLog(@"Clearing previous mission history...");
        while ([MissionHistoryList count] > MaxHistoryLength) {
            [MissionHistoryList removeObjectAtIndex:0];
        }
        [MissionHistory saveMissionHistory];
    }
}

+ (void)initTestMissionHistory {
//    [MissionHistory clearMissionHistory];
    int num = 10;
    MissionHistoryList = [NSMutableArray array];
    for (int i = num - 1; i >= 0; i--) {
        NSDate *date = [Utility dateWithOutTime:[NSDate dateWithTimeIntervalSinceNow: -(i * HourPerDay)]];
        Mission *mission = [Mission createTestMission:date];
        [MissionHistoryList addObject:mission];
    }
    [MissionHistory saveMissionHistory];
    NSLog(@"Init mission history: %@", MissionHistoryList);
}



@end
