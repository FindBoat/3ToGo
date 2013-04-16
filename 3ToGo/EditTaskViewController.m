////
////  EditTaskViewController.m
////  3ToGo
////
////  Created by Hang Zhao on 2/19/13.
////  Copyright (c) 2013 Hang Zhao. All rights reserved.
////
//
//#import "EditTaskViewController.h"
//#import "Task.h"
//#import "Utility.h"
//#import <QuartzCore/QuartzCore.h>
//
//@interface EditTaskViewController ()
//
//@end
//
//@implementation EditTaskViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//    [self initViews];
//    [self.titleTextField addTarget:self action:@selector(checkTitleTextField:) forControlEvents:UIControlEventEditingChanged];
//}
//
//- (void)checkTitleTextField:(id)sender {
//    UITextField *textField = (UITextField *)sender;
//    if ([textField.text length] > 0) {
//        textField.layer.borderColor = [[UIColor clearColor] CGColor];
//        [self.saveButton setEnabled:YES];
//    } else {
//        textField.layer.borderWidth= 1.0f;
//        textField.layer.cornerRadius=8.0f;
//        textField.layer.borderColor = [[UIColor redColor] CGColor];
//        [self.saveButton setEnabled:NO];
//    }
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"SaveEdit"]) {
//        if ([self.titleTextField.text length]) {
//            self.editTask.title = self.titleTextField.text;
//            self.editTask.detail = self.detailTextField.text;
//            self.editTask.completion = (int)self.completionSlider.value;
//        }
//    }
//}
//
//- (void)initViews {
//    if (self.editTask) {
//        [self.titleTextField setText:self.editTask.title];
//        [self.detailTextField setText:self.editTask.detail];
//        [self.completionSlider setValue:(float)self.editTask.completion];
//        [self.completionLabel setText:[[NSString alloc] initWithFormat:@"%d%%", self.editTask.completion]];
//        [self.completionLabel setTextColor:[Utility getColorFromCompletion:self.editTask.completion andTotal:100]];
//    }
//}
//
//- (IBAction)completionSliderChanged:(id)sender {
//    UISlider *slider = (UISlider *)sender;
//    int completion = (int)slider.value;
//    [self.completionLabel setText:[[NSString alloc] initWithFormat:@"%d%%", completion]];
//    [self.completionLabel setTextColor:[Utility getColorFromCompletion:completion andTotal:100]];
//}
//
//- (BOOL) textFieldShouldReturn:(UITextField *)textField {
//    if ((textField == self.titleTextField) || (textField == self.detailTextField)) {
//        [textField resignFirstResponder];
//    }
//    return YES;
//}
//
//@end
