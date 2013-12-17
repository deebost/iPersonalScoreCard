//
//  DBEndOfRoundResultsViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/16/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBEndOfRoundResultsViewController.h"

@interface DBEndOfRoundResultsViewController ()
@property (strong, nonatomic) NSString *firstHole1stLine;
@property (strong, nonatomic) NSString *firstHole2ndLine;
@property (strong, nonatomic) NSString *firstHole3rdLine;

@end
NSArray *hole1Array, *hole2Array, *hole3Array, *hole4Array, *hole5Array, *hole6Array, *hole7Array, *hole8Array, *hole9Array, *hole10Array, *hole11Array, *hole12Array, *hole13Array, *hole14Array, *hole15Array, *hole16Array, *hole17Array, *hole18Array;
NSDictionary *hole1Dict, *hole2Dict, *hole3Dict, *hole4Dict, *hole5Dict, *hole6Dict, *hole6Dict, *hole7Dict, *hole8Dict, *hole9Dict, *hole10Dict, *hole11Dict, *hole12Dict, *hole13Dict, *hole14Dict, *hole15Dict, *hole16Dict, *hole17Dict, *hole18Dict;
NSMutableArray *allHolesData;
NSMutableArray *allHoleDetails;




@implementation DBEndOfRoundResultsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    allHolesData = [[NSMutableArray alloc] init];
    allHoleDetails = [[NSMutableArray alloc] init];
    [self loadIndividualHolesToDictionary];
    [self getholeOneStatsOutOfDict];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadIndividualHolesToDictionary {
    NSUserDefaults *loadHole = [NSUserDefaults standardUserDefaults];

    NSString *courseName = [loadHole objectForKey:@"courseName"];
    NSDictionary *everyHoleDict= [loadHole objectForKey:[NSString stringWithFormat:@"%@holeTotalStats", courseName]];

    hole1Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeOneFinal"]];
    hole2Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeTwoFinal"]];
    hole3Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeThreeFinal"]];
    hole4Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeFourFinal"]];
    hole5Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeFiveFinal"]];
    hole6Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeSixFinal"]];
    hole7Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeSevenFinal"]];
    hole8Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeEightFinal"]];
    hole9Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeNineFinal"]];
    hole10Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeTenFinal"]];
    hole11Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeElevenFinal"]];
    hole12Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeTwelveFinal"]];
    hole13Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeThirteenFinal"]];
    hole14Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeFourteenFinal"]];
    hole15Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeFifthteenFinal"]];
    hole16Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeSixthteenFinal"]];
    hole17Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeSeventeenFinal"]];
    hole18Array = [[NSArray alloc] initWithArray:[everyHoleDict objectForKey:@"holeEightteenFinal"]];

    hole1Dict = [hole1Array objectAtIndex:0];
    hole2Dict = [hole2Array objectAtIndex:0];
    hole3Dict = [hole3Array objectAtIndex:0];
    hole4Dict = [hole4Array objectAtIndex:0];
    hole5Dict = [hole5Array objectAtIndex:0];
    hole6Dict = [hole6Array objectAtIndex:0];
    hole7Dict = [hole7Array objectAtIndex:0];
    hole8Dict = [hole8Array objectAtIndex:0];
    hole9Dict = [hole9Array objectAtIndex:0];
    hole10Dict = [hole10Array objectAtIndex:0];
    hole11Dict = [hole11Array objectAtIndex:0];
    hole12Dict = [hole12Array objectAtIndex:0];
    hole13Dict = [hole13Array objectAtIndex:0];
    hole14Dict = [hole14Array objectAtIndex:0];
    hole15Dict = [hole15Array objectAtIndex:0];
    hole16Dict = [hole16Array objectAtIndex:0];
    hole17Dict = [hole17Array objectAtIndex:0];
    hole18Dict = [hole18Array objectAtIndex:0];
}

- (void) getholeOneStatsOutOfDict {

    NSString *firstHoleShots = [hole1Dict objectForKey:@"totalShots"];
    NSString *firstHolePar = [hole1Dict objectForKey:@"currentPar"];
    NSString *firstHoleGIR = [hole1Dict objectForKey:@"gir"];

    NSString *missRight = [hole1Dict objectForKey:@"missRight"];
    NSString *missLeft = [hole1Dict objectForKey:@"missLeft"];
    NSString *fairwayHit = [hole1Dict objectForKey:@"fairwayHits"];
    NSString *hitOrMissFairWay;

    if (fairwayHit.integerValue == 1) {
        hitOrMissFairWay = @"YES";
    } else if (fairwayHit.integerValue == 0 && missLeft.integerValue == 0 && missRight.integerValue == 1) {
        hitOrMissFairWay = @"MISS R";
    } else {
        hitOrMissFairWay = @"MISS L";
    }

    NSString *parScrambleYES = [hole1Dict objectForKey:@"successfulScramble"];
    NSString *failedParScramble = [hole1Dict objectForKey:@"failedScramble"];

    NSString *parScrambleYesOrNO;

    if (parScrambleYES.integerValue == 1 ) {
        parScrambleYesOrNO = @"YES";
    } else if (failedParScramble.integerValue == 1) {
        parScrambleYesOrNO = @"NO";
    } else {
        parScrambleYesOrNO = @"N/A";
    }

    NSString *bogeyScrambleYES = [hole1Dict objectForKey:@"successfulBogeyScramble"];
    NSString *failedBogeyScramble = [hole1Dict objectForKey:@"failedBogeyScramble"];

    NSString *bogeyScrambleYesOrNO;

    if (bogeyScrambleYES.integerValue == 1 ) {
        bogeyScrambleYesOrNO = @"YES";
    } else if (failedBogeyScramble.integerValue == 1) {
        bogeyScrambleYesOrNO = @"NO";
    } else {
        bogeyScrambleYesOrNO = @"N/A";
    }

    NSString *successSandSave = [hole1Dict objectForKey:@"successfulSandSave"];
    NSString *sandSavePossibility = [hole1Dict objectForKey:@"sandSavePossivility"];

    NSString *successOrFailSandSave;
    if (successSandSave.integerValue == 1) {
        successOrFailSandSave = @"YES";
    }else if (sandSavePossibility.integerValue == 1 && successSandSave.integerValue == 0) {
        successOrFailSandSave = @"NO";
    } else {
        successOrFailSandSave = @"N/A";
    }

    _firstHole1stLine = [NSString stringWithFormat:@"Par: %@ | Shots: %@ | Fairwayhit: %@ | GIR: %@", firstHolePar, firstHoleShots, hitOrMissFairWay, firstHoleGIR];
    _firstHole2ndLine = [NSString stringWithFormat:@"Sand Save: %@ | Scramble: %@ | Bogey Scramble: %@", successOrFailSandSave, parScrambleYesOrNO, bogeyScrambleYesOrNO];

    NSArray *firstHoleInfos = [[NSArray alloc] initWithObjects:_firstHole1stLine, nil];
    NSArray *firstHoleDetail = [[NSArray alloc] initWithObjects:_firstHole2ndLine, nil];
    NSDictionary *firstHoleDict = [NSDictionary dictionaryWithObject:firstHoleInfos forKey:@"hole"];
    NSDictionary *firstHoleDetailDic = [NSDictionary dictionaryWithObject:firstHoleDetail forKey:@"hole"];

    [allHolesData addObject:firstHoleDict];
    [allHoleDetails addObject:firstHoleDetailDic];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return [allHolesData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dictionary = [allHolesData objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"hole"];
    return [array count];
    // Return the number of rows in the section.
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
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dictionary = [allHolesData objectAtIndex:indexPath.row];
    NSArray *holes = [dictionary objectForKey:@"hole"];
    NSString *holeI = [holes objectAtIndex:indexPath.row];

    NSDictionary *detailDic = [allHoleDetails objectAtIndex:indexPath.row];
    NSArray *detailHoles = [detailDic objectForKey:@"hole"];
    NSString *holeD = [detailHoles objectAtIndex:indexPath.row];

    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    cell.textLabel.text = holeI;

    cell.detailTextLabel.font = [UIFont systemFontOfSize:10.0];
    cell.detailTextLabel.text = holeD;



    return cell;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
