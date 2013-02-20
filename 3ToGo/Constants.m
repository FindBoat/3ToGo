//
//  Constants.m
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "Constants.h"

@implementation Constants

static NSString *TaskHistoryPath = nil;

+ (NSString *)documentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths lastObject];
}


+(NSString *)taskHistoryPath {
    if (!TaskHistoryPath) {
        TaskHistoryPath = [[Constants documentsPath] stringByAppendingPathComponent:@"task_history.plist"];
    }
    return TaskHistoryPath;
}

@end
