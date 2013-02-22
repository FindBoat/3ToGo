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

+ (NSDateComponents *)getWeekday:(NSDate *)date {
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    return [gregorian components:NSWeekdayCalendarUnit fromDate:date];
}

+ (NSString *)getWeekdayString:(NSDate *)date andShortForm:(BOOL)shortForm{
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    if (shortForm) {
        [theDateFormatter setDateFormat:@"EEE"];
    } else {
        [theDateFormatter setDateFormat:@"EEEE"];
    }
    return [theDateFormatter stringFromDate:date];
}

+ (NSString *)getDateString:(NSDate *)date {
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [theDateFormatter stringFromDate:date];
}

@end
