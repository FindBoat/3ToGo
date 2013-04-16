//
//  Task.h
//  3ToGo
//
//  Created by Hang Zhao on 2/18/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject <NSCoding>

typedef enum {
    UNSTARTED,
    DONE
} TaskStatus;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic) TaskStatus status;
@property (nonatomic) NSInteger rank;

- (id)initWithTitle:(NSString *)title andDetail:(NSString *)detail andStatus:(TaskStatus)status andRank:(NSInteger)rank;
- (id)initWithTitle:(NSString *)title andRank:(NSInteger)rank;

@end
