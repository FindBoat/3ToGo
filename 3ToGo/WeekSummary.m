//
//  WeekSummary.m
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "WeekSummary.h"
#import "Mission.h"
#import "MissionHistory.h"
#import "Task.h"

@interface WeekSummary()

// Score [0, 100] for each mission.
+ (float)getPerform:(Mission *)mission;

@end

@implementation WeekSummary

static float Weight[] = {0.4, 0.3, 0.3};

// Avg by day.
// TODO: Get days planned into account.
+ (NSInteger)getWeekScore:(NSArray *)missions {
    float score = 0;
    for (Mission *mission in missions) {
        score += [WeekSummary getPerform:mission];
    }
    score /= [missions count];
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

+ (NSInteger)getDaysPlanned {
    return [[MissionHistory missionsForThisWeek] count];
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
