//
//  Mission.m
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "Mission.h"
#import "Utility.h"
#import "Task.h"
#include <stdlib.h>


@implementation Mission

static NSInteger NumTasks = 3;

+ (NSInteger)numTasksPerMission {
    return NumTasks;
}

+ (id)createTestMission:(NSDate *)date {
    NSMutableArray *testTasks = [NSMutableArray array];
    for (int i = 0; i < NumTasks; i++) {
        int completion = arc4random() % 100;
        TaskStatus status = completion < 50 ? UNSTARTED : DONE;
        NSString *title = [[NSString alloc] initWithFormat:@"title%d", completion];
        Task *task = [[Task alloc] initWithTitle:title andStatus:status andRank:i];
        [testTasks addObject:task];
    }
    return [[Mission alloc] initWithTasks:testTasks andDate:date];
}

- (id)initWithTasks:(NSMutableArray *)tasks andDate:(NSDate *)date{
    self = [super init];
    if (self) {
        self.tasks = tasks;
        self.date = [Utility dateWithoutTime:date];
    }
    return self;
}

- (id)initWithTasks:(NSMutableArray *)tasks {
    return [self initWithTasks:tasks andDate:[NSDate date]];
}

// Used for encoding.
- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        [self setTasks:[decoder decodeObjectForKey:@"tasks"]];
        [self setDate:[decoder decodeObjectForKey:@"date"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.tasks forKey:@"tasks"];
    [coder encodeObject:self.date forKey:@"date"];
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"date: %@, tasks: %@", self.date, self.tasks];
}



@end
