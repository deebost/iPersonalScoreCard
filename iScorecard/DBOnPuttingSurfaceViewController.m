//
//  DBOnPuttingSurfaceViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBOnPuttingSurfaceViewController.h"
#import "DBGreenHitViewController.h"
#import <Parse/Parse.h>

@interface DBOnPuttingSurfaceViewController ()
@property (weak, nonatomic) IBOutlet UIButton *holeButton;
@property (weak, nonatomic) IBOutlet UIButton *missButton;
@property (weak, nonatomic) IBOutlet UIButton *finalResultsButton;
- (IBAction)finalResultsOnTouch:(id)sender;

@end
NSString *parOfHole;
NSNumber *totalShots;
NSNumber *gir;
NSNumber *fairwayHits;
NSNumber *missLeft;
NSNumber *missRight;
NSNumber *successfulSandSave;
NSNumber *sandSavePossibility;
NSNumber *successfulScramble;
NSNumber *failedScramble;
NSNumber *successfulBogeyScramble;
NSNumber *failedBogeyScramble;
NSString *currentPar;
NSNumber *totalPenaltyStroke;
NSNumber *totalPutts;
NSNumber *holeNumber;
//    NSString *dateOfRound = _roundDate;


NSMutableDictionary *holeDict;
@implementation DBOnPuttingSurfaceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self lastHoleLogic];

}

- (void) lastHoleLogic {
    if (_holeNumber <= 17) {
        _finalResultsButton.hidden = YES;
    } else {
        _finalResultsButton.hidden = NO;
        _holeButton.hidden = YES;
    }
}

- (void) sandSaveLogic {
    if (_currentParOfHole.integerValue == 3 && _totalShotsTaken <= 3 && _sandSavePossibility == YES ) {
        _successfulSandSave = YES;

    } else if (_currentParOfHole.integerValue == 4 && _totalShotsTaken <= 4 && _sandSavePossibility == YES ){
        _successfulSandSave = YES;
    } else if (_currentParOfHole.integerValue == 5 && _totalShotsTaken <= 5 && _sandSavePossibility == YES) {
        _successfulSandSave = YES;
    }
}


- (void) scramblingLogic {
    if (_currentParOfHole.integerValue == 3 && _gir == NO && _totalShotsTaken <= 3) {
        _successfulScramble = YES;
    } else     if (_currentParOfHole.integerValue == 4 && _gir == NO && _totalShotsTaken <= 4) {
        _successfulScramble = YES;
    } else     if (_currentParOfHole.integerValue == 5 && _gir == NO && _totalShotsTaken <= 5) {
        _successfulScramble = YES;
    }
}

- (void) failedTooScrambleLogic {
    if (_currentParOfHole.integerValue == 3 && _gir == NO && _totalShotsTaken > 3) {
        _failedScramble = YES;
    } else     if (_currentParOfHole.integerValue == 4 && _gir == NO && _totalShotsTaken > 4) {
        _failedScramble = YES;
    } else     if (_currentParOfHole.integerValue == 5 && _gir == NO && _totalShotsTaken > 5) {
        _failedScramble = YES;
    }
}

- (void) bogeyScrambleLogic {
    if (_currentParOfHole.integerValue == 3 && _totalPutts == 1 && _totalShotsTaken == 4 && _gir == NO) {
        _successfulBogeyScramble = YES;
    } else     if (_currentParOfHole.integerValue == 4 && _totalPutts == 1 && _totalShotsTaken == 5 && _gir == NO) {
        _successfulBogeyScramble = YES;
    } else     if (_currentParOfHole.integerValue == 5 && _totalPutts == 1 && _totalShotsTaken == 6 && _gir == NO) {
        _successfulBogeyScramble = YES;
    }
}

- (void) failedToBogeyScramble{
    if (_currentParOfHole.integerValue == 3 && _gir == NO && _totalShotsTaken >= 5) {
        _failedBogeyScramble = YES;
    } else     if (_currentParOfHole.integerValue == 4 && _gir == NO && _totalShotsTaken >= 6) {
        _failedBogeyScramble = YES;
    } else     if (_currentParOfHole.integerValue == 5 && _gir == NO && _totalShotsTaken >= 7) {
        _failedBogeyScramble = YES;
    }
}

- (void)allocAndInnitStats {
    totalShots = [[NSNumber alloc] initWithInt:_totalShotsTaken];
    gir = [[NSNumber alloc] initWithInt:_gir];
    fairwayHits = [[NSNumber alloc] initWithInt:_finalFairwayHit];
    missLeft = [[NSNumber alloc] initWithInt:_finalMissLeft];
    missRight = [[NSNumber alloc] initWithInt:_finalMissRight];
    successfulSandSave = [[NSNumber alloc] initWithInt:_successfulSandSave];
    sandSavePossibility = [[NSNumber alloc] initWithInt:_sandSavePossibility];
    successfulScramble = [[NSNumber alloc] initWithInt:_successfulScramble];
    failedScramble = [[NSNumber alloc] initWithInt:_failedScramble];
    successfulBogeyScramble = [[NSNumber alloc] initWithInt:_successfulBogeyScramble];
    failedBogeyScramble = [[NSNumber alloc] initWithInt:_failedBogeyScramble];
    currentPar = [NSString stringWithFormat:@"%@", _currentParOfHole];
    totalPenaltyStroke = [[NSNumber alloc] initWithInt:_totalPenaltyStrokes];
    totalPutts = [[NSNumber alloc] initWithInt:_totalPutts];
    holeNumber = [[NSNumber alloc] initWithInt:_holeNumber];
    //    NSString *dateOfRound = _roundDate;


    holeDict = [[NSMutableDictionary alloc] init];
}

- (void) saveHoleStatsToDictionary {

//    [holeDict setObject:dateOfRound forKey:@"dateOfRound"];

    [holeDict setObject:gir forKey:@"gir"];
    [holeDict setObject:totalShots forKey:@"totalShots"];
    [holeDict setObject:fairwayHits forKey:@"fairwayHits"];
    [holeDict setObject:missRight forKey:@"missRight"];
    [holeDict setObject:missLeft forKey:@"missLeft"];
    [holeDict setObject:successfulSandSave forKey:@"successfulSandSave"];
    [holeDict setObject:sandSavePossibility forKey:@"sandSavePossivility"];
    [holeDict setObject:successfulScramble forKey:@"successfulScramble"];
    [holeDict setObject:failedScramble forKey:@"failedScramble"];
    [holeDict setObject:successfulBogeyScramble forKey:@"successfulBogeyScramble"];
    [holeDict setObject:failedBogeyScramble forKey:@"failedBogeyScramble"];
    [holeDict setObject:currentPar forKey:@"currentPar"];
    [holeDict setObject:totalPenaltyStroke forKey:@"totalPenaltyStrokes"];
    [holeDict setObject:totalPutts forKey:@"totalPutts"];
    [holeDict setObject:holeNumber forKey:@"holeNumber"];

}

- (void)saveCurrentHoleToPList {

    NSUserDefaults *saveHole = [NSUserDefaults standardUserDefaults];
    [saveHole setObject:holeDict forKey:[NSString stringWithFormat:@"hole%iInfo",_holeNumber]];
    [saveHole synchronize];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"finalResultsSegue"]) {
        [self holeLogic];

    } else if ([segue.identifier isEqualToString:@"newHoleSegue"]) {
        [self holeLogic];
    }




}

- (void) holeLogic {
    if (_holeNumber <= 17) {
        _totalShotsTaken++;
        _totalPutts++;
        [self sandSaveLogic];
        [self scramblingLogic];
        [self failedTooScrambleLogic];
        [self bogeyScrambleLogic];
        [self failedToBogeyScramble];
        [self allocAndInnitStats];



        /// commit comment
        UIAlertView *holeFinished = [[UIAlertView alloc] initWithTitle:@"Hole complete!"
                                                               message:[NSString stringWithFormat:@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd total putts = %i hole number = %i sand save = %hhd par = %@ sandsaveopportunity = %hhd successfulScramp = %hhd failed scramble = %hhd failed bogey scramble = %hhd succesful bogey scramble = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _totalPutts, _holeNumber, _successfulSandSave,_currentParOfHole,_sandSavePossibility,_successfulScramble, _failedScramble, _failedBogeyScramble, _successfulBogeyScramble]
                                                              delegate:nil
                                                     cancelButtonTitle:nil
                                                     otherButtonTitles:@"save", nil];

        [holeFinished show];

        //        [self saveToParse];
        NSLog(@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd total putts = %i hole number = %i sand save = %hhd par = %@ sandsaveopportunity = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _totalPutts, _holeNumber, _successfulSandSave,_currentParOfHole,_sandSavePossibility);
        [self saveHoleStatsToDictionary];
        [self saveCurrentHoleToPList];
    }
    else if (_holeNumber == 18) {
        _totalShotsTaken++;
        _totalPutts++;
        [self sandSaveLogic];
        [self scramblingLogic];
        [self failedTooScrambleLogic];
        [self bogeyScrambleLogic];
        [self failedToBogeyScramble];
        [self allocAndInnitStats];

        NSLog(@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd total putts = %i hole number = %i sand save = %hhd par = %@ sandsaveopportunity = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _totalPutts, _holeNumber, _successfulSandSave,_currentParOfHole,_sandSavePossibility);


        UIAlertView *roundFinished = [[UIAlertView alloc] initWithTitle:@"Round Complete!"
                                                                message:@"Now saving your results!"
                                                               delegate:nil
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"Finish Round", nil];
        [self saveHoleStatsToDictionary];
        [self saveCurrentHoleToPList];
        [self saveAllHolesDoneToPList];
        [roundFinished show];
        [self deleteHoleInfoAfterRoundComplete];
    }
}

- (void) saveAllHolesDoneToPList {
    NSUserDefaults *allHoles = [NSUserDefaults standardUserDefaults];
    NSString *courseName = [allHoles objectForKey:@"courseName"];

    NSArray *holeOneDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole1Info"], nil];
    NSArray *holeTwoDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole2Info"], nil];
    NSArray *holeThreeDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole3Info"], nil];
    NSArray *holeFourDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole4Info"], nil];
    NSArray *holeFiveDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole5Info"], nil];
    NSArray *holeSixDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole6Info"], nil];
    NSArray *holeSevenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole7Info"], nil];
    NSArray *holeEightDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole8Info"], nil];
    NSArray *holeNineDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole9Info"], nil];
    NSArray *holeTenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole10Info"], nil];
    NSArray *holeElevenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole11Info"], nil];
    NSArray *holeTwelveDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole12Info"], nil];
    NSArray *holeThirteenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole13Info"], nil];
    NSArray *holeFourteenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole14Info"], nil];
    NSArray *holeFifthteenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole15Info"], nil];
    NSArray *holeSixthteenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole16Info"], nil];
    NSArray *holeSeventeenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole17Info"], nil];
    NSArray *holeEightteenDic = [[NSArray alloc] initWithObjects:[allHoles objectForKey:@"hole18Info"], nil];
    NSMutableDictionary *courseRoundStats = [[ NSMutableDictionary alloc] init];
    [courseRoundStats setObject:holeOneDic forKey:@"holeOneFinal"];
    [courseRoundStats setObject:holeTwoDic forKey:@"holeTwoFinal"];
    [courseRoundStats setObject:holeThreeDic forKey:@"holeThreeFinal"];
    [courseRoundStats setObject:holeFourDic forKey:@"holeFourFinal"];
    [courseRoundStats setObject:holeFiveDic forKey:@"holeFiveFinal"];
    [courseRoundStats setObject:holeSixDic forKey:@"holeSixFinal"];
    [courseRoundStats setObject:holeSevenDic forKey:@"holeSevenFinal"];
    [courseRoundStats setObject:holeEightDic forKey:@"holeEightFinal"];
    [courseRoundStats setObject:holeNineDic forKey:@"holeNineFinal"];
    [courseRoundStats setObject:holeTenDic forKey:@"holeTenFinal"];
    [courseRoundStats setObject:holeElevenDic forKey:@"holeElevenFinal"];
    [courseRoundStats setObject:holeTwelveDic forKey:@"holeTwelveFinal"];
    [courseRoundStats setObject:holeThirteenDic forKey:@"holeThirteenFinal"];
    [courseRoundStats setObject:holeFourteenDic forKey:@"holeFourteenFinal"];
    [courseRoundStats setObject:holeFifthteenDic forKey:@"holeFifthteenFinal"];
    [courseRoundStats setObject:holeSixthteenDic forKey:@"holeSixthteenFinal"];
    [courseRoundStats setObject:holeSeventeenDic forKey:@"holeSeventeenFinal"];
    [courseRoundStats setObject:holeEightteenDic forKey:@"holeEightteenFinal"];
    


    [allHoles setObject:courseRoundStats forKey:[NSString stringWithFormat:@"%@holeTotalStats", courseName ]];
    [allHoles synchronize];

    PFObject *myScore = [PFObject objectWithClassName:@"MyScores"];
    myScore[@"totalRoundScore"] = [[NSDictionary alloc] initWithDictionary:courseRoundStats];


}

- (void) deleteHoleInfoAfterRoundComplete {
    NSUserDefaults *clearHoleInfo = [NSUserDefaults standardUserDefaults];
    NSDictionary *emptyDict = [[NSDictionary alloc] init];
    [clearHoleInfo setObject:emptyDict forKey:@"hole1Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole2Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole3Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole4Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole5Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole6Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole7Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole8Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole9Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole10Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole11Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole12Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole13Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole14Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole15Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole16Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole17Info"];
    [clearHoleInfo setObject:emptyDict forKey:@"hole18Info"];
    [clearHoleInfo synchronize];
}

- (void) saveToParse {
    PFObject *myScore = [PFObject objectWithClassName:@"MyScores"];
    myScore[@"courseName"] =
    myScore[@"shotTotal"] = [NSString stringWithFormat:@"%i", _totalShotsTaken];
    myScore[@"totalScramble"] = [NSString stringWithFormat:@"%hhd", _successfulScramble];
    myScore[@"totalFailedScramble"] = [NSString stringWithFormat:@"%hhd", _failedScramble];
    myScore[@"totalBogeyScramble"] = [NSString stringWithFormat:@"%hhd", _successfulBogeyScramble];
    myScore[@"totalFailedBogeyScramble"] = [NSString stringWithFormat:@"%hhd", _failedBogeyScramble];
    myScore[@"gir"] = [NSString stringWithFormat:@"%hhd", _gir];
    myScore[@"totalPutts"] = [NSString stringWithFormat:@"%i", _totalPutts];
    myScore[@"totalPenaltyStrokes"] = [NSString stringWithFormat:@"%i", _totalPenaltyStrokes];
    myScore[@"fairwayHit"] = [NSString stringWithFormat:@"%hhd", _finalFairwayHit];
    myScore[@"missRight"] = [NSString stringWithFormat:@"%hhd", _finalMissRight];
    myScore[@"missLeft"] = [NSString stringWithFormat:@"%hhd", _finalMissLeft];
    myScore[@"holeNumber"] = [NSString stringWithFormat:@"%i", _holeNumber];
    [myScore saveInBackground];
}

- (IBAction)missOnTap:(id)sender {
    _totalShotsTaken++;
    _totalPutts++;
    NSLog(@"shots = %i", _totalShotsTaken);
}

- (IBAction)finalResultsOnTouch:(id)sender {
}
@end
