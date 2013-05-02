//
//  Mission.h
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mission : NSObject <NSCoding>

@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) NSDate *date;

+ (NSInteger)numTasksPerMission;
+ (id)createTestMission:(NSDate *)date;

- (id)initWithTasks:(NSMutableArray *)tasks;
- (id)initWithTasks:(NSMutableArray *)tasks andDate:(NSDate *)date;


@end
