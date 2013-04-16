//
//  TaskViewCell.h
//  3ToGo
//
//  Created by Hang Zhao on 4/14/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface TaskViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageStatus;
@property (weak, nonatomic) IBOutlet UITextView *textTitle;

- (void)setStatus:(TaskStatus)status;

@end
