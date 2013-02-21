//
//  SummaryViewController.h
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *worstPerformLabel;
@property (weak, nonatomic) IBOutlet UILabel *bestPerformLabel;
@property (weak, nonatomic) IBOutlet UILabel *achievementLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
