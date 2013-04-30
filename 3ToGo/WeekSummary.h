//
//  WeekSummary.h
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeekSummary : NSObject

+ (NSInteger)getWeekScore:(NSArray *)missions;
+ (NSInteger)getNumAccomplishedTasks:(NSArray *)missions;
+ (NSInteger)getNumTasksThisWeek:(NSArray *)missions;
+ (NSDate *)getBestPerformDateThisWeek:(NSArray *)missions;
+ (NSDate *)getWorstPerformDateThisWeek:(NSArray *)missions;
+ (NSInteger)getDaysPlanned;

@end
