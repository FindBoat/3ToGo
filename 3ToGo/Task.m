//
//  Task.m
//  3ToGo
//
//  Created by Hang Zhao on 2/18/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "Task.h"

@implementation Task

- (id)initWithTitle:(NSString *)title andStatus:(TaskStatus)status andRank:(NSInteger)rank {
    self = [super init];
    if (self) {
        self.title = title;
        self.status = status;
        self.rank = rank;
    }
    return self;
}

- (id)initWithTitle:(NSString *)title andRank:(NSInteger)rank {
    return [self initWithTitle:title andStatus:UNSTARTED andRank:rank];
}

// Used for encoding.
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeInteger:self.status forKey:@"status"];
    [coder encodeInteger:self.rank forKey:@"rank"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        [self setTitle:[decoder decodeObjectForKey:@"title"]];
        [self setStatus:[decoder decodeIntegerForKey:@"status"]];
        [self setRank:[decoder decodeIntegerForKey:@"rank"]];
    }
    return self;
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"<Task: %@>", self.title];
}

@end
