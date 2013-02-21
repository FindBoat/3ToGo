//
//  Utility.m
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSDate *)dateWithOutTime:(NSDate *)date {
    if (!date) {
        date = [NSDate date];
    }
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

+ (NSDate *)getWeekdayOfTheWeek:(NSInteger)theWeekday {
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:today];
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    
    // Let's make the start day of a week Monday.
    int daysSubtract = [weekdayComponents weekday] - theWeekday;
    if ([weekdayComponents weekday] == 1) {
        daysSubtract += 7;
    }
    if (theWeekday == 1) {
        daysSubtract -= 7;
    }
    
    [componentsToSubtract setDay: - daysSubtract];
    return [gregorian dateByAddingComponents:componentsToSubtract toDate:today options:0];
}

+ (NSArray *)getAllWeekdaysOfTheWeek {
    int todayWeekday = [[Utility getWeekday:[NSDate date]] weekday];
    NSMutableArray *weekdays = [NSMutableArray array];
    
    // Today is Sunday.
    if (todayWeekday == 1) {
        [weekdays addObject:[NSDate date]];
        todayWeekday = 7;
    }
    
    for (int i = 2; i <= todayWeekday; i++) {
        [weekdays addObject:[Utility getWeekdayOfTheWeek:i]];
    }
    return weekdays;
}

+ (NSDateComponents *)getWeekday:(NSDate *)date {
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    return [gregorian components:NSWeekdayCalendarUnit fromDate:date];
}

@end
