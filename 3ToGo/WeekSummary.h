//
//  WeekSummary.h
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeekSummary : NSObject

+ (NSInteger)getWeekScore;
+ (NSInteger)getNumAccomplishedTasks;
+ (NSInteger)getNumTasksThisWeek;
+ (NSDate *)getBestPerformDateThisWeek;
+ (NSDate *)getWorstPerformDateThisWeek;

@end
