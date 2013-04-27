//
//  Constants.m
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "Constants.h"

@implementation Constants

static NSString *MissionHistoryPath = nil;
static NSString *DeadlinePath = nil;


+ (NSString *)documentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths lastObject];
}


+(NSString *)missionHistoryPath {
    if (!MissionHistoryPath) {
        MissionHistoryPath = [[Constants documentsPath] stringByAppendingPathComponent:@"mission_history.plist"];
    }
    return MissionHistoryPath;
}


+(NSString *)deadlinePath {
    if (!DeadlinePath) {
        DeadlinePath = [[Constants documentsPath] stringByAppendingPathComponent:@"deadline.plist"];
    }
    return DeadlinePath;
}

@end
