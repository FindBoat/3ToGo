//
//  Task.m
//  3ToGo
//
//  Created by Hang Zhao on 2/18/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "Task.h"

@implementation Task

- (id)initWithTitle:(NSString *)title andDetail:(NSString *)detail andStatus:(TaskStatus)status andRank:(NSInteger)rank {
    self = [super init];
    if (self) {
        self.title = title;
        self.detail = detail;
        self.status = status;
        self.rank = rank;
    }
    return self;
}

- (id)initWithTitle:(NSString *)title andRank:(NSInteger)rank {
    return [self initWithTitle:title andDetail:nil andStatus:UNSTARTED andRank:rank];
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.detail forKey:@"detail"];
    [coder encodeInteger:self.status forKey:@"status"];
    [coder encodeInteger:self.rank forKey:@"rank"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        [self setTitle:[decoder decodeObjectForKey:@"title"]];
        [self setDetail:[decoder decodeObjectForKey:@"detail"]];
        [self setStatus:[decoder decodeIntegerForKey:@"status"]];
        [self setRank:[decoder decodeIntegerForKey:@"rank"]];
    }
    return self;
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"<Task: %@>", self.title];
}

@end
