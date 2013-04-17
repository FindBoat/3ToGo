//
//  TaskViewCell.m
//  3ToGo
//
//  Created by Hang Zhao on 4/14/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "TaskViewCell.h"

@implementation TaskViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStatus:(TaskStatus)status {
    if (status == DONE) {
        [self.textTitle setTextColor:[UIColor colorWithRed:(0/255.f) green:(255/255.f) blue:(0/255.f) alpha:1.0f]];
        [self.imageStatus setImage:[UIImage imageNamed:@"done.png"]];
    } else {
        [self.textTitle setTextColor:[UIColor colorWithRed:(0/255.f) green:(0/255.f) blue:(0/255.f) alpha:1.0f]];
        [self.imageStatus setImage:[UIImage imageNamed:@"not-done.png"]];
    }
}


@end
