//
//  SummaryViewController.m
//  3ToGo
//
//  Created by Hang Zhao on 2/20/13.
//  Copyright (c) 2013 Hang Zhao. All rights reserved.
//

#import "SummaryViewController.h"
#import "WeekSummary.h"
#import "MissionHistory.h"
#import "Utility.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

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
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    [self evaluateAndSetLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake (18,15,300,30)];
    title.text = @"This Week You Get";
    [title setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [title setTextColor:[UIColor colorWithRed:(38/255.f) green:(171/255.f) blue:(255/255.f) alpha:1.0f]];
    [title setBackgroundColor:[UIColor clearColor]];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    [headerView addSubview:title];
    [headerView setBackgroundColor:[UIColor clearColor]];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 57;
}


- (void)evaluateAndSetLabels {
    NSArray *missions = [MissionHistory missionsForThisWeek];
    int weekScore = [WeekSummary getWeekScore:missions];
    int numAccomplishedTasks = [WeekSummary getNumAccomplishedTasks:missions];
    int numTasks = [WeekSummary getNumTasksThisWeek:missions];
    NSDate *worstPerformDate = [WeekSummary getWorstPerformDateThisWeek:missions];
    NSDate *bestPerformDate = [WeekSummary getBestPerformDateThisWeek:missions];
    
    [self.scoreLabel setText:[[NSString alloc] initWithFormat:@"%d/%d", weekScore, 100]];
    [self.scoreLabel setTextColor:[Utility getColorFromNum:weekScore andTotal:100]];
    
    [self.achievementLabel setText:[[NSString alloc] initWithFormat:@"%d/%d", numAccomplishedTasks, numTasks]];
    [self.achievementLabel setTextColor:[Utility getColorFromNum:numAccomplishedTasks andTotal:numTasks]];

    [self.bestPerformLabel setText:[Utility getWeekdayString:bestPerformDate andShortForm:YES]];
    [self.worstPerformLabel setText:[Utility getWeekdayString:worstPerformDate andShortForm:YES]];
}

@end
