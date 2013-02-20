//
//  TaskHistory.m
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "TaskHistory.h"
#import "Constants.h"
#import "Task.h"
#import "Utility.h"

@implementation TaskHistory

static NSMutableDictionary *TaskHistoryDict = nil;
static NSInteger MaxHistoryLength = 21;
static float HourPerDay = 60.0 * 60.0 * 24.0;

+ (NSMutableArray *)taskForToday {
    NSDate *today = [Utility dateWithOutTime:[NSDate date]];
//    NSDate *today = [Utility dateWithOutTime:[NSDate dateWithTimeIntervalSinceNow: -(3 * HourPerDay)]];
    NSMutableArray *tasks = [TaskHistoryDict objectForKey:today];
    if (!tasks) {
        tasks = [TaskHistory generateDefaultTaskList];
        [TaskHistoryDict setValue:tasks forKey:today];
        [TaskHistory saveTaskHistory];
    }
    return tasks;
}

+ (NSMutableDictionary *)taskHistoryDict {
    if (!TaskHistoryDict) {
        [TaskHistory initTaskHistory];
    }
    return TaskHistoryDict;
}

+ (void)initTaskHistory {
//    [TaskHistory clearTaskHistory];
    if (TaskHistoryDict) {
        return;
    }
    // Load task history from file.
    if ([[NSFileManager defaultManager] fileExistsAtPath:[Constants taskHistoryPath]]) {
        NSLog(@"Loading task history...");
        TaskHistoryDict = [NSKeyedUnarchiver unarchiveObjectWithFile:[Constants taskHistoryPath]];
    } else {
        TaskHistoryDict = [NSMutableDictionary dictionary];
    }
    NSLog(@"Init task history: %@", TaskHistoryDict);
    [TaskHistory clearPreviousTaskHistory];
}

+ (BOOL)saveTaskHistory {
    NSLog(@"Saving task history...");
    return [NSKeyedArchiver archiveRootObject:TaskHistoryDict toFile:[Constants taskHistoryPath]];
}

+ (NSMutableArray *)generateDefaultTaskList {
    Task *task1 = [[Task alloc] initWithTitle:@"Most Important Task" andRank:0];
    Task *task2 = [[Task alloc] initWithTitle:@"Important Task" andRank:1];
    Task *task3 = [[Task alloc] initWithTitle:@"Task" andRank:2];
    return [[NSMutableArray alloc] initWithObjects:task1, task2, task3, nil];
}

+ (void)clearTaskHistory {
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr removeItemAtPath:[Constants taskHistoryPath] error:&error]) {
        NSLog(@"Unable to delete file: %@", [error localizedDescription]);
    } else {
        NSLog(@"Task history cleared.");
    }
}

+ (void)clearPreviousTaskHistory {
    if ([TaskHistoryDict count] > MaxHistoryLength) {
        NSLog(@"Clearing previous task history...");
        NSDate *dateToDelete = [Utility dateWithOutTime:[NSDate dateWithTimeIntervalSinceNow: -(MaxHistoryLength * HourPerDay)]];
        NSMutableArray *deletedKeys = [NSMutableArray array];
        for (NSDate *key in TaskHistoryDict) {
            [deletedKeys addObject:key];
        }
        for (NSDate *key in deletedKeys) {
            if ([dateToDelete compare:key] == NSOrderedDescending) {
                [TaskHistoryDict removeObjectForKey:key];
            }
        }
        [TaskHistory saveTaskHistory];
    }
}

@end
