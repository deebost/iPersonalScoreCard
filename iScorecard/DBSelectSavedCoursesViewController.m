//
//  DBSelectSavedCoursesViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/11/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBSelectSavedCoursesViewController.h"
#import "DBFairwayHitViewController.h"
#import <Parse/Parse.h>

@interface DBSelectSavedCoursesViewController ()

@property (strong, nonatomic) NSString *courseNameFromParse;
@property (strong, nonatomic) NSString *totalCourseParFromParse;
@property (strong, nonatomic) NSMutableDictionary *infoForSelectedCourse;
@end
NSMutableArray *totalCourses;
NSMutableArray *totalCourseNames;
NSMutableArray *totalParsForCourse;
NSMutableArray *courseCitys;
NSMutableArray *courseStates;
NSMutableSet *courseStatesSet;
NSMutableDictionary *stateDictionary;

BOOL found;
BOOL savedCourse;


@implementation DBSelectSavedCoursesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    totalCourses = [[NSMutableArray alloc] init];
    totalCourseNames  = [[NSMutableArray alloc] init];
    totalParsForCourse = [[NSMutableArray alloc] init];
    courseCitys = [[NSMutableArray alloc] init];
    courseStates = [[NSMutableArray alloc] init];
    courseStatesSet = [[NSMutableSet alloc] init];
    _infoForSelectedCourse = [[NSMutableDictionary alloc] init];
}



- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    savedCourse = YES;
    //    [self queryForCourses];
    [self findCoursesOnPlist];
}

- (void)findCoursesOnPlist {
    NSUserDefaults *loadCourseToPlist = [NSUserDefaults standardUserDefaults];
    NSArray *allKeys = [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys];
    NSLog(@"%@",allKeys);
    [loadCourseToPlist synchronize];
}

- (void) queryForCourses {
    PFQuery *query = [PFQuery queryWithClassName:@"Courses"];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {

        // iterate through the objects array, which contains PFObjects for each Student

        for (NSDictionary *tempDic in objects) {

            NSString *nameString = [tempDic objectForKey:@"courseName"];
            NSString *parString = [tempDic objectForKey:@"coursePar"];
            NSString *cityString = [tempDic objectForKey:@"courseCity"];
            NSString *stateString = [tempDic objectForKey:@"courseState"];
            NSString *user = [tempDic objectForKey:@"user"];
            [totalCourseNames addObject:nameString];
            [totalParsForCourse addObject:parString];
            [courseStates addObject:stateString];
            [courseCitys addObject:cityString];
            [courseStatesSet addObject:stateString];
            [self.tableView reloadData];
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSString *selectedCourse = [[[self.tableView cellForRowAtIndexPath: indexPath] textLabel] text];
    DBFairwayHitViewController *controller = segue.destinationViewController;
    controller.passedCourseName = [NSString stringWithFormat:@"%@", selectedCourse];
    controller.newCourseOrOldCourse = savedCourse;
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
    return totalCourseNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *courseNameValue = [totalCourseNames objectAtIndex:indexPath.row];
    NSString *totalParValue = [totalParsForCourse objectAtIndex:indexPath.row];
    NSString *stateValue = [courseStates objectAtIndex:indexPath.row];
    NSString *cityValue = [courseCitys objectAtIndex:indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"%@", courseNameValue];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@ Total Par = %@", cityValue, stateValue, totalParValue];
    return cell;
}

@end
