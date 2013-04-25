//
//  TaskListViewController.h
//  3ToGo
//
//  Created by Hang Zhao on 2/18/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Mission;
@class AbstractActionSheetPicker;
@interface TaskListViewController : UITableViewController <UITextViewDelegate>

@property (nonatomic) Mission *missionToday;
@property (weak) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UITextView *textHourLeft;
@property (weak, nonatomic) IBOutlet UITextView *textMinuteLeft;
@property (weak, nonatomic) IBOutlet UITextView *textSecondLeft;
@property (weak, nonatomic) IBOutlet UITextView *textColon1;
@property (weak, nonatomic) IBOutlet UITextView *textColon2;

@property (nonatomic, strong) AbstractActionSheetPicker *actionSheetPicker;

- (IBAction)saveEdit:(UIStoryboardSegue *)segue;
- (IBAction)cancelEdit:(UIStoryboardSegue *)segue;
- (IBAction)addMoreTask:(id)sender;

@end
