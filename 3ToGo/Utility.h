//
//  Utility.h
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSDate *)dateWithOutTime:(NSDate *)date;
+ (NSDate *)getWeekdayOfTheWeek:(NSInteger)theWeekday;
+ (NSArray *)getAllWeekdaysOfTheWeek;
+ (NSDateComponents *)getWeekday:(NSDate *)date;

@end
