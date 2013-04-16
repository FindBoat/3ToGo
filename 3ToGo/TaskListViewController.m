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

@interface TaskListViewController ()

@end

@implementation TaskListViewController

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
    TaskViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
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

//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"TaskDetail"]) {
//        EditTaskViewController *editController = [segue destinationViewController];
//        editController.editTask = [self.missionToday.tasks objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
//    }
//}
//
//- (IBAction)saveEdit:(UIStoryboardSegue *)segue {
//    if ([[segue identifier] isEqualToString:@"SaveEdit"]) {
//        EditTaskViewController *editController = [segue sourceViewController];
//        if (editController.editTask) {
//            [self.missionToday.tasks replaceObjectAtIndex:[[self.tableView indexPathForSelectedRow] row] withObject:editController.editTask];
//            [[self tableView] reloadData];
//        }
//        [self dismissViewControllerAnimated:YES completion:NULL];
//        [MissionHistory saveMissionHistory];
//    }
//
//}
//
//- (IBAction)cancelEdit:(UIStoryboardSegue *)segue {
//    if ([[segue identifier] isEqualToString:@"CancelEdit"]) {
//        [self dismissViewControllerAnimated:YES completion:NULL];
//    }
//}

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

@end
