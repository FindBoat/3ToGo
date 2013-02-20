//
//  TaskHistory.h
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskHistory : NSObject

+ (NSMutableArray *)taskForToday;
+ (NSMutableDictionary *)taskHistoryDict;
+ (void)initTaskHistory;
+ (BOOL)saveTaskHistory;

@end
