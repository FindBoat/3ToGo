//
//  EditTaskViewController.h
//  3ToGo
//
//  Created by Hang Zhao on 2/19/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Task;
@interface EditTaskViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) Task *editTask;
@property (weak, nonatomic) IBOutlet UISlider *completionSlider;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *completionLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

- (IBAction)completionSliderChanged:(id)sender;

@end
