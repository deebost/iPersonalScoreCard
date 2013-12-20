//
//  DBEndOfRoundResultsViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/16/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBEndOfRoundResultsViewController.h"

@interface DBEndOfRoundResultsViewController ()
@property (weak, nonatomic) NSString *firstHole1stLine;
@property (weak, nonatomic) NSString *firstHole2ndLine;
@property (weak, nonatomic) NSString *firstHole3rdLine;

@end

NSMutableArray *allHolesData;
NSMutableArray *allHoleDetails;
NSMutableArray *hmmTRY;
NSUInteger I;
NSDictionary *allHoleFinalDict;




@implementation DBEndOfRoundResultsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    allHolesData = [[NSMutableArray alloc] init];

    [self loadHoleFinalsFromDictionaryStuffInArray];

}

- (void)loadHoleFinalsFromDictionaryStuffInArray {
    NSUserDefaults *loadHole = [NSUserDefaults standardUserDefaults];

    NSString *courseName = [loadHole objectForKey:@"courseName"];
    NSArray *holeData = [loadHole objectForKey:[NSString stringWithFormat:@"%@holeTotalStats", courseName]];
    NSMutableArray *holeNumber1 = [NSMutableArray array];
    NSMutableArray *holeNumber2 = [NSMutableArray array];
    NSMutableArray *holeNumber3 = [NSMutableArray array];
    NSMutableArray *holeNumber4 = [NSMutableArray array];
    NSMutableArray *holeNumber5 = [NSMutableArray array];
    NSMutableArray *holeNumber6 = [NSMutableArray array];
    NSMutableArray *holeNumber7 = [NSMutableArray array];
    NSMutableArray *holeNumber8 = [NSMutableArray array];
    NSMutableArray *holeNumber9 = [NSMutableArray array];
    NSMutableArray *holeNumber10 = [NSMutableArray array];
    NSMutableArray *holeNumber11 = [NSMutableArray array];
    NSMutableArray *holeNumber12 = [NSMutableArray array];
    NSMutableArray *holeNumber13 = [NSMutableArray array];
    NSMutableArray *holeNumber14 = [NSMutableArray array];
    NSMutableArray *holeNumber15 = [NSMutableArray array];
    NSMutableArray *holeNumber16 = [NSMutableArray array];
    NSMutableArray *holeNumber17 = [NSMutableArray array];
    NSMutableArray *holeNumber18 = [NSMutableArray array];
    for (NSDictionary *dict in holeData) {
        if ([dict[@"holeNumber"] isEqualToString:@"1"]) {
            [holeNumber1 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"2"]) {
            [holeNumber2 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"3"]) {
            [holeNumber3 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"4"]) {
            [holeNumber4 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"5"]) {
            [holeNumber5 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"6"]) {
            [holeNumber6 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"7"]) {
            [holeNumber7 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"8"]) {
            [holeNumber8 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"9"]) {
            [holeNumber9 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"10"]) {
            [holeNumber10 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"11"]) {
            [holeNumber11 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"12"]) {
            [holeNumber12 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"13"]) {
            [holeNumber13 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"14"]) {
            [holeNumber14 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"15"]) {
            [holeNumber15 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"16"]) {
            [holeNumber16 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"17"]) {
            [holeNumber17 addObject:dict];
        } else if ([dict[@"holeNumber"] isEqualToString:@"18"]) {
            [holeNumber18 addObject:dict];
        }
    }
    allHolesData = [NSMutableArray arrayWithObjects:
                    holeNumber1,
                    holeNumber2,
                    holeNumber3,
                    holeNumber4,
                    holeNumber5,
                    holeNumber6,
                    holeNumber7,
                    holeNumber8,
                    holeNumber9,
                    holeNumber10,
                    holeNumber11,
                    holeNumber12,
                    holeNumber13,
                    holeNumber14,
                    holeNumber15,
                    holeNumber16,
                    holeNumber17,
                    holeNumber18, nil];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return allHolesData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [allHolesData [section] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section == 0) {
        return @"Hole Number One";
    }else if(section == 1)  {
        return @"Hole Number Two";
    }else   if(section == 2){
        return @"Hole Number Three";
    }else if(section == 3){
        return @"Hole Number Four";
    }else if(section == 4){
        return @"Hole Number Five";
    }else if(section == 5){
        return @"Hole Number Six";
    }else if(section == 6){
        return @"Hole Number Seven";
    }else if(section == 7){
        return @"Hole Number Eight";
    }else if(section == 8){
        return @"Hole Number Nine";
    }else if(section == 9){
        return @"Hole Number Ten";
    }else if(section == 10){
        return @"Hole Number Eleven";
    }else if(section == 11){
        return @"Hole Number Twelve";
    }else if(section == 12){
        return @"Hole Number Thirteen";
    }else if(section == 13){
        return @"Hole Number Fourteen";
    }else if(section == 14){
        return @"Hole Number Fifthteen";
    }else if(section == 15){
        return @"Hole Number Sixteen";
    }else if(section == 16){
        return @"Hole Number Seventeen";
    }else {
        return @"Hole Number Eighteen";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSString *bigLongSentence = [NSString stringWithFormat:@"#%@ Par:%@ Shots: %@ Gir:%@",
                                 allHolesData[indexPath.section][indexPath.row][@"holeNumber"],
                                 allHolesData[indexPath.section][indexPath.row][@"currentPar"],
                                 allHolesData[indexPath.section][indexPath.row][@"totalShots"],
                                 allHolesData[indexPath.section][indexPath.row][@"gir"]];
    NSString *fairwayID;
    if ([allHolesData[indexPath.section][indexPath.row][@"fairwayHits"]integerValue] == 1) {
        fairwayID = @"Fairway Hit";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"missRight"]integerValue] == 1) {
        fairwayID = @"Miss Right";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"missLeft"]integerValue] == 1) {
        fairwayID = @"Miss Left";
    } else {
        fairwayID = @"";
    }

    NSString *scrambleID;
    if ([allHolesData[indexPath.section][indexPath.row][@"successfulScramble"]integerValue] == 1) {
        scrambleID = @"YES";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"failedScramble"]integerValue] == 1) {
        scrambleID = @"NO";
    } else {
        scrambleID = @"N/A";
    }

    NSString *sandSaveID;

    if ([allHolesData[indexPath.section][indexPath.row][@"successfulSandSave"]integerValue] == 1) {
        sandSaveID = @"YES";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"successfulSandSave"]integerValue] == 0 && [allHolesData[indexPath.section][indexPath.row][@"sandSavePossivility"]integerValue] == 1) {
        sandSaveID = @"NO";
    } else {
        sandSaveID = @"N/A";
    }
    NSString *bogeyScrambleID;
    if ([allHolesData[indexPath.section][indexPath.row][@"successfulBogeyScramble"]integerValue] == 1) {
        bogeyScrambleID = @"YES";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"fairwayHits"]integerValue] == 1) {
        bogeyScrambleID = @"NO";
    } else {
        bogeyScrambleID = @"N/A";
    }
    NSString *detailLongSentce = [NSString stringWithFormat:@"SS: %@ Drive Accu: %@ S: %@ B-S: %@", sandSaveID, fairwayID, scrambleID, bogeyScrambleID];

    cell.textLabel.text = bigLongSentence;
    cell.detailTextLabel.text = detailLongSentce;
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedCell = nil;
    NSString *detailCell = nil;
    selectedCell = [NSString stringWithFormat:@"#%@ Par:%@ Shots: %@ Gir:%@",
                    allHolesData[indexPath.section][indexPath.row][@"holeNumber"],
                    allHolesData[indexPath.section][indexPath.row][@"currentPar"],
                    allHolesData[indexPath.section][indexPath.row][@"totalShots"],
                    allHolesData[indexPath.section][indexPath.row][@"gir"]];

    NSString *fairwayID;
    if ([allHolesData[indexPath.section][indexPath.row][@"fairwayHits"]integerValue] == 1) {
        fairwayID = @"Fairway Hit";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"missRight"]integerValue] == 1) {
        fairwayID = @"Miss Right";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"missLeft"]integerValue] == 1) {
        fairwayID = @"Miss Left";
    } else {
        fairwayID = @"";
    }

    NSString *scrambleID;
    if ([allHolesData[indexPath.section][indexPath.row][@"successfulScramble"]integerValue] == 1) {
        scrambleID = @"YES";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"failedScramble"]integerValue] == 1) {
        scrambleID = @"NO";
    } else {
        scrambleID = @"N/A";
    }

    NSString *sandSaveID;

    if ([allHolesData[indexPath.section][indexPath.row][@"successfulSandSave"]integerValue] == 1) {
        sandSaveID = @"YES";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"successfulSandSave"]integerValue] == 0 && [allHolesData[indexPath.section][indexPath.row][@"sandSavePossivility"]integerValue] == 1) {
        sandSaveID = @"NO";
    } else {
        sandSaveID = @"N/A";
    }
    NSString *bogeyScrambleID;
    if ([allHolesData[indexPath.section][indexPath.row][@"successfulBogeyScramble"]integerValue] == 1) {
        bogeyScrambleID = @"YES";
    } else if ([allHolesData[indexPath.section][indexPath.row][@"failedBogeyScramble"]integerValue] == 1) {
        bogeyScrambleID = @"NO";
    } else {
        bogeyScrambleID = @"N/A";
    }

    detailCell = [NSString stringWithFormat:@"SS: %@ Drive Accu: %@ S: %@ B-S: %@", sandSaveID, fairwayID, scrambleID, bogeyScrambleID];
    DLog(@"%@",selectedCell);
    DLog(@"%@",detailCell);

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
