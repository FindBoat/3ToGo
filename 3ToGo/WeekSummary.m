//
//  WeekSummary.m
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "WeekSummary.h"
#import "Mission.h"
#import "Task.h"

@implementation WeekSummary

static float Weight[] = {0.4, 0.3, 0.3};

+ (NSInteger)getWeekScore:(NSArray *)missions {
    
    float score = 0;
    for (Mission *mission in missions) {
        score += [WeekSummary getPerform:mission];
        NSLog(@"%f", score);
    }
    score /= [missions count];
    NSLog(@"%d", [missions count]);
    return (int)score;
}

+ (NSInteger)getNumAccomplishedTasks:(NSArray *)missions {
    int numAccomplished = 0;
    for (Mission *mission in missions) {
        for (Task *task in mission.tasks) {
            if (task.status == DONE) {
                numAccomplished++;
            }
        }
    }
    return numAccomplished;
}

+ (NSInteger)getNumTasksThisWeek:(NSArray *)missions {
    return [Mission numTasksPerMission] * [missions count];
}

+ (NSDate *)getBestPerformDateThisWeek:(NSArray *)missions {
    NSDate *date = nil;
    float perf = 0;
    for (Mission *mission in missions) {
        float perfCurrent = [WeekSummary getPerform:mission];
        if (perfCurrent > perf) {
            perf = perfCurrent;
            date = mission.date;
        }
    }
    return date;
}

+ (NSDate *)getWorstPerformDateThisWeek:(NSArray *)missions {
    NSDate *date = nil;
    float perf = 999;
    for (Mission *mission in missions) {
        float perfCurrent = [WeekSummary getPerform:mission];
        if (perfCurrent < perf) {
            perf = perfCurrent;
            date = mission.date;
        }
    }
    return date;
}

+ (float)getPerform:(Mission *)mission {
    float score = 0;
    for (int i = 0; i < [Mission numTasksPerMission]; i++) {
        Task* task = (Task *)[mission.tasks objectAtIndex:i];
        if (task.status == DONE) {
            score += 100 * Weight[i];
        }
    }
    return score;
}

@end
