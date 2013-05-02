//
//  Utility.h
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSDate *)dateWithoutTime:(NSDate *)date;

// Sun = 1, Mon = 2 ... Sat = 7.
+ (NSDateComponents *)getWeekday:(NSDate *)date;
+ (NSString *)getWeekdayString:(NSDate *)date andShortForm:(BOOL)shortForm;
+ (NSString *)getDateString:(NSDate *)date;

// date2 - date1
+ (NSInteger)getDateDiff:(NSDate *)date1 andDate:(NSDate *)date2;

// Red to Green.
+ (UIColor *) getColorFromNum:(NSInteger)num andTotal:(NSInteger)total;

@end
