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
NSMutableArray *hmmTRY;
NSMutableDictionary *lastTry;




@implementation DBEndOfRoundResultsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    allHolesData = [[NSMutableArray alloc] init];
    allHoleDetails = [[NSMutableArray alloc] init];
    [self loadIndividualHolesToDictionary];
    [self getholeTwoStatsOutOfDict];

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

    hole1Dict = [NSDictionary dictionaryWithObject:[hole1Array objectAtIndex:0] forKey:@"zoo"];
    hole2Dict = [NSDictionary dictionaryWithObject:[hole2Array objectAtIndex:0] forKey:@"zoo"];
    hole3Dict = [NSDictionary dictionaryWithObject:[hole3Array objectAtIndex:0] forKey:@"zoo"];
    hole4Dict = [NSDictionary dictionaryWithObject:[hole4Array objectAtIndex:0] forKey:@"zoo"];
    hole5Dict = [NSDictionary dictionaryWithObject:[hole5Array objectAtIndex:0] forKey:@"zoo"];
    hole6Dict = [NSDictionary dictionaryWithObject:[hole6Array objectAtIndex:0] forKey:@"zoo"];
    hole7Dict = [NSDictionary dictionaryWithObject:[hole7Array objectAtIndex:0] forKey:@"zoo"];
    hole8Dict = [NSDictionary dictionaryWithObject:[hole8Array objectAtIndex:0] forKey:@"zoo"];
    hole9Dict = [NSDictionary dictionaryWithObject:[hole9Array objectAtIndex:0] forKey:@"zoo"];
    hole10Dict = [NSDictionary dictionaryWithObject:[hole10Array objectAtIndex:0] forKey:@"zoo"];
    hole11Dict = [NSDictionary dictionaryWithObject:[hole11Array objectAtIndex:0] forKey:@"zoo"];
    hole12Dict = [NSDictionary dictionaryWithObject:[hole12Array objectAtIndex:0] forKey:@"zoo"];
    hole13Dict = [NSDictionary dictionaryWithObject:[hole13Array objectAtIndex:0] forKey:@"zoo"];
    hole14Dict = [NSDictionary dictionaryWithObject:[hole14Array objectAtIndex:0] forKey:@"zoo"];
    hole15Dict = [NSDictionary dictionaryWithObject:[hole15Array objectAtIndex:0] forKey:@"zoo"];
    hole16Dict = [NSDictionary dictionaryWithObject:[hole15Array objectAtIndex:0] forKey:@"zoo"];
    hole17Dict = [NSDictionary dictionaryWithObject:[hole17Array objectAtIndex:0] forKey:@"zoo"];
    hole18Dict = [NSDictionary dictionaryWithObject:[hole18Array objectAtIndex:0] forKey:@"zoo"];

    hmmTRY = [[NSMutableArray alloc] initWithObjects: hole1Dict, hole2Dict, hole3Dict, hole4Dict, hole5Dict, hole6Dict, hole7Dict, hole8Dict, hole9Dict, hole10Dict, hole11Dict, hole12Dict, hole13Dict, hole14Dict, hole15Dict, hole16Dict, hole17Dict, hole18Dict, nil];


}

- (void) getholeTwoStatsOutOfDict {

    NSUInteger index = 1;

    for (NSDictionary *hopeless2 in hmmTRY) {
        NSMutableDictionary *hopeless = [[NSMutableDictionary alloc] initWithDictionary:[hopeless2 objectForKey:@"zoo"]];

        NSString *line1= [NSString stringWithFormat:@"|index %i|Par: %@| Shots: %@| Gir: %@|", index, [hopeless objectForKey:@"currentPar"], [hopeless objectForKey:@"totalShots"], [hopeless objectForKey:@"gir"]];

        NSString *line2 = [NSString stringWithFormat:@"| MISS-R: %@| MISS-L: %@| Fairway-H: %@|", [hopeless objectForKey:@"missRight"], [hopeless objectForKey:@"missLeft"], [hopeless objectForKey:@"fairwayHits"]];

        NSString *line3 = [NSString stringWithFormat:@"|Hole# %@|Putts: %@|SSp: %@|SSs: %@|", [hopeless objectForKey:@"holeNumber"], [hopeless objectForKey:@"totalPutts"], [hopeless objectForKey:@"sandSavePossivility"], [hopeless objectForKey:@"successfulSandSave"]];

        NSString *line4 = [NSString stringWithFormat:@"|Scramble: %@|ScrambleFail: %@|BS: %@|BSf %@|", [hopeless objectForKey:@"successfulScramble"], [hopeless objectForKey:@"failedScramble"],[hopeless objectForKey:@"successfulBogeyScramble"] , [hopeless objectForKey:@"failedBogeyScramble"]];


//        NSString *detail1 = @"";
//        NSString *detail2 = @"";
//        NSString *detail3 = @"|Sandsave possibility|SSs = successful Sandsave|";
//        NSString *detail4 = @"|BS= bogey scramble | BSf= failed bogey scramble|";


        NSArray *allHoles = [[NSArray alloc] initWithObjects:line1, line2 ,line3, line4, nil];
//        NSArray *allHoleDetail = [[NSArray alloc] initWithObjects:detail1, detail2, detail3, detail4, nil];


        NSDictionary *diction = [NSDictionary dictionaryWithObject:allHoles forKey:@"yum"];
//        NSDictionary *detailDiction = [NSDictionary dictionaryWithObject:allHoleDetail forKey:@"mmm"];

        [allHolesData addObject:diction];
//        [allHoleDetails addObject:detailDiction];




        index++;
    }
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
    NSArray *array = [dictionary objectForKey:@"yum"];
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
    NSArray *holes = [dictionary objectForKey:@"yum"];
    NSLog(@"!!!!!!!!!!! %@",holes);
//    NSString *holeI = [holes objectAtIndex:indexPath.row];
//    NSLog(@"iiiiiiiiiiiiiiiiii  %@",holeI);

//    NSDictionary *detailDict = [allHoleDetails objectAtIndex:indexPath.row];
//    NSArray *detailHole = [detailDict objectForKey:@"mmm"];
//    NSString *holeD = [detailHole objectAtIndex:indexPath.row];

    cell.textLabel.font = [UIFont boldSystemFontOfSize:15.0];
    cell.textLabel.text = [holes objectAtIndex:indexPath.row];
//
//    cell.detailTextLabel.font = [UIFont italicSystemFontOfSize:10.0];
//    cell.detailTextLabel.text = holeD;
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
