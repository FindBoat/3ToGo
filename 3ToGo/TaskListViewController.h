//
//  TaskListViewController.h
//  3ToGo
//
//  Created by Hang Zhao on 2/18/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Mission;
@interface TaskListViewController : UITableViewController

@property (nonatomic) Mission *missionToday;

- (IBAction)saveEdit:(UIStoryboardSegue *)segue;
- (IBAction)cancelEdit:(UIStoryboardSegue *)segue;

@end
