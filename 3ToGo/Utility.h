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
+ (NSDateComponents *)getWeekday:(NSDate *)date;
+ (NSString *)getWeekdayString:(NSDate *)date andShortForm:(BOOL)shortForm;
+ (NSString *)getDateString:(NSDate *)date;
+ (NSInteger)getDateDiff:(NSDate *)date1 andDate:(NSDate *)date2;
+ (UIColor *) getColorFromCompletion:(NSInteger)completion andTotal:(NSInteger)total;

@end
