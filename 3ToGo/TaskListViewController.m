//
//  TaskListViewController.m
//  3ToGo
//
//  Created by Hang Zhao on 2/18/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "TaskListViewController.h"
#import "EditTaskViewController.h"
#import "Task.h"
#import "Mission.h"
#import "Constants.h"
#import "MissionHistory.h"
#import "Utility.h"
#import "ColorAlertView.h"
#import "TaskViewCell.h"
#import "ActionSheetPicker.h"

@interface TaskListViewController ()

@end

@implementation TaskListViewController

NSDate *deadline;
NSArray *timerOptions;
NSInteger selectedIndex;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.missionToday = [MissionHistory missionForToday];
    NSLog(@"load mission: %@", self.missionToday);
    
    timerOptions = [NSArray arrayWithObjects:@"1 Hour", @"1.5 Hour", @"2 Hour", @"2.5 Hour", @"3 Hour", @"3.5 Hour", @"4 Hour", @"4.5 Hour", @"5 Hour", @"5.5 Hour", @"6 Hour", @"6.5 Hour", @"7 Hour", @"7.5 Hour", @"8 Hour", @"8.5 Hour", @"9 Hour", @"9.5 Hour", @"10 Hour", nil];
    
    UITapGestureRecognizer *gestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timerTextViewTapped:)];
    [self.textSecondLeft addGestureRecognizer:gestureRecognizer1];
    UITapGestureRecognizer *gestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timerTextViewTapped:)];
    [self.textHourLeft addGestureRecognizer:gestureRecognizer2];
    UITapGestureRecognizer *gestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timerTextViewTapped:)];
    [self.textMinuteLeft addGestureRecognizer:gestureRecognizer3];
    UITapGestureRecognizer *gestureRecognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timerTextViewTapped:)];
    [self.textColon1 addGestureRecognizer:gestureRecognizer4];
    UITapGestureRecognizer *gestureRecognizer5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timerTextViewTapped:)];
    [self.textColon2 addGestureRecognizer:gestureRecognizer5];
    
    [self countdownTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.missionToday.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskCell";
    TaskViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[TaskViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TaskCell"];
    }
    
    Task *task = [self.missionToday.tasks objectAtIndex:[indexPath row]];
    [cell.textTitle setText:task.title];
    [cell setStatus:task.status];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    return 44;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskViewCell *cell = (TaskViewCell *)[tableView cellForRowAtIndexPath:indexPath];

    Task *task = [self.missionToday.tasks objectAtIndex:[indexPath row]];
    if (task.status == DONE) {
        task.status = UNSTARTED;
    } else {
        task.status = DONE;
    }
    [cell setStatus:task.status];
    [[self tableView] reloadData];
    [MissionHistory saveMissionHistory];
}

- (void) textViewDidEndEditing:(UITextView *)textView {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(TaskViewCell*)[[textView superview] superview]];
    Task *task = [self.missionToday.tasks objectAtIndex:[indexPath row]];
    task.title = textView.text;
    [MissionHistory saveMissionHistory];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake (18,25,100,30)];
    title.text = @"Today Task";
    [title setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [title setTextColor:[UIColor colorWithRed:(38/255.f) green:(171/255.f) blue:(255/255.f) alpha:1.0f]];
    [title setBackgroundColor:[UIColor clearColor]];

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    [headerView addSubview:title];
    [headerView setBackgroundColor:[UIColor clearColor]];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 70;
}

- (IBAction)addMoreTask:(id)sender {
    ColorAlertView *message = [[ColorAlertView alloc] initWithTitle:@"To Be Productive"
                                                      message:@"Just pick THREE big things and NO MORE!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    UIColor *alertColor = [UIColor colorWithRed:(10/255.f) green:(100/255.f) blue:(10/255.f) alpha:1.0f];
    [ColorAlertView setBackgroundColor:alertColor withStrokeColor:alertColor];
    [message show];
}

- (void)timerTextViewTapped:(UIGestureRecognizer *)gestureRecognizer {
    [ActionSheetStringPicker showPickerWithTitle:@"Set Timer" rows:timerOptions initialSelection:selectedIndex target:self successAction:@selector(animalWasSelected:element:) cancelAction:@selector(actionPickerCancelled:) origin:self.textSecondLeft];

}

- (void)animalWasSelected:(NSNumber *)index element:(id)element {
    selectedIndex = [index intValue];
    NSDate *now = [NSDate date];
    NSTimeInterval seconds = (selectedIndex + 2) * 30 * 60;
    deadline = [now dateByAddingTimeInterval:seconds];
}

- (void)actionPickerCancelled:(id)sender {
}


- (void)updateCounter:(NSTimer *)theTimer {
    int secondsLeft = [deadline timeIntervalSinceNow];
    if (secondsLeft > 0 ) {
        int hours = secondsLeft / 3600;
        int minutes = (secondsLeft % 3600) / 60;
        int seconds = (secondsLeft %3600) % 60;
        self.textHourLeft.text = [NSString stringWithFormat:@"%02d", hours];
        self.textMinuteLeft.text = [NSString stringWithFormat:@"%02d", minutes];
        self.textSecondLeft.text = [NSString stringWithFormat:@"%02d", seconds];
    }
}

- (void)countdownTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

@end
