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
@property (weak, nonatomic) IBOutlet UIButton *mistakeButton;
- (IBAction)onTapGoBackMistake:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *lastHoleView;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleShotsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHolePuttsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleGIRLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleFairwayHitLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleSandSaveLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleScrambleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleBogeyScrambleLabel;

@end
NSString *parOfHole;
NSString *totalShots;
NSString *gir;
NSString *fairwayHits;
NSString *missLeft;
NSString *missRight;
NSString *successfulSandSave;
NSString *sandSavePossibility;
NSString *successfulScramble;
NSString *failedScramble;
NSString *successfulBogeyScramble;
NSString *failedBogeyScramble;
NSString *currentPar;
NSString *totalPenaltyStroke;
NSString *totalPutts;
NSString *holeNumber;
//    NSString *dateOfRound = _roundDate;


NSMutableDictionary *holeDict;
@implementation DBOnPuttingSurfaceViewController


- (void) lastHoleStatsView {
    if (_holeNumber == 1) {
        _lastHoleView.hidden = YES;
    } else {
        _lastHoleView.hidden = NO;
        _lastHoleShotsLabel.text = _lastHoleShotTotal;
        _lastHoleScrambleLabel.text = _lastHoleScamble;
        _lastHolePuttsLabel.text = _lastHolePuttTotal;
        _lastHoleGIRLabel.text = _lastHoleGIR;
        _lastHoleBogeyScrambleLabel.text = _lastHoleBogeyScramble;
        _lastHoleFairwayHitLabel.text = _lastHoleFairwayHitorMiss;
        _lastHoleSandSaveLabel.text = _lastHoleSandSave;
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self lastHoleLogic];
    [self lastHoleStatsView];

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
    totalShots = [NSString stringWithFormat:@"%i", _totalShotsTaken];
    gir =  [NSString stringWithFormat:@"%i",_gir];
    fairwayHits = [NSString stringWithFormat:@"%i",_finalFairwayHit];
    missLeft =  [NSString stringWithFormat:@"%i",_finalMissLeft];
    missRight =  [NSString stringWithFormat:@"%i",_finalMissRight];
    successfulSandSave =  [NSString stringWithFormat:@"%i",_successfulSandSave];
    sandSavePossibility =  [NSString stringWithFormat:@"%i",_sandSavePossibility];
    successfulScramble = [NSString stringWithFormat:@"%i",_successfulScramble];
    failedScramble = [NSString stringWithFormat:@"%i",_failedScramble];
    successfulBogeyScramble =  [NSString stringWithFormat:@"%i",_successfulBogeyScramble];
    failedBogeyScramble =  [NSString stringWithFormat:@"%i",_failedBogeyScramble];
    currentPar = [NSString stringWithFormat:@"%@", _currentParOfHole];
    totalPenaltyStroke = [NSString stringWithFormat:@"%i",_totalPenaltyStrokes];
    totalPutts =  [NSString stringWithFormat:@"%i",_totalPutts];
    holeNumber =  [NSString stringWithFormat:@"%i",_holeNumber];
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

    NSArray *courseHoles = [NSArray arrayWithObjects:
                            [allHoles objectForKey:@"hole1Info"],
                            [allHoles objectForKey:@"hole2Info"],
                            [allHoles objectForKey:@"hole3Info"],
                            [allHoles objectForKey:@"hole4Info"],
                            [allHoles objectForKey:@"hole5Info"],
                            [allHoles objectForKey:@"hole6Info"],
                            [allHoles objectForKey:@"hole7Info"],
                            [allHoles objectForKey:@"hole8Info"],
                            [allHoles objectForKey:@"hole9Info"],
                            [allHoles objectForKey:@"hole10Info"],
                            [allHoles objectForKey:@"hole11Info"],
                            [allHoles objectForKey:@"hole12Info"],
                            [allHoles objectForKey:@"hole13Info"],
                            [allHoles objectForKey:@"hole14Info"],
                            [allHoles objectForKey:@"hole15Info"],
                            [allHoles objectForKey:@"hole16Info"],
                            [allHoles objectForKey:@"hole17Info"],
                            [allHoles objectForKey:@"hole18Info"], nil];

    


    [allHoles setObject:courseHoles forKey:[NSString stringWithFormat:@"%@holeTotalStats", courseName ]];
    [allHoles synchronize];
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
- (IBAction)onTapGoBackMistake:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
