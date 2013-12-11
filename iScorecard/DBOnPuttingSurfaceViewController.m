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

@end

@implementation DBOnPuttingSurfaceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) sandSaveLogic {
    if (_currentParOfHole.integerValue == 3 && _totalShotsTaken == 3 && _sandSavePossibility == YES ) {
        _successfulSandSave = YES;

    } else if (_currentParOfHole.integerValue == 4 && _totalShotsTaken == 4 && _sandSavePossibility == YES ){
        _successfulSandSave = YES;
    } else if (_currentParOfHole.integerValue == 5 && _totalShotsTaken == 5 && _sandSavePossibility == YES) {
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
    if (_currentParOfHole.integerValue == 3 && _totalShotsTaken - _totalPutts == 3 && _gir == NO && _totalShotsTaken >= 5) {
        _failedBogeyScramble = YES;
    } else     if (_currentParOfHole.integerValue == 4 && _totalShotsTaken - _totalPutts == 4 && _gir == NO && _totalShotsTaken >= 6) {
        _failedBogeyScramble = YES;
    } else     if (_currentParOfHole.integerValue == 5 && _totalShotsTaken - _totalPutts == 5 && _gir == NO && _totalShotsTaken >= 7) {
        _failedBogeyScramble = YES;
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (_holeNumber <= 17) {
        _totalShotsTaken++;
        _totalPutts++;
        [self sandSaveLogic];
        [self scramblingLogic];
        [self failedTooScrambleLogic];
        [self bogeyScrambleLogic];
        [self failedToBogeyScramble];


/// commit comment
    UIAlertView *holeFinished = [[UIAlertView alloc] initWithTitle:@"Hole complete!"
                                                           message:[NSString stringWithFormat:@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd total putts = %i hole number = %i sand save = %hhd par = %@ sandsaveopportunity = %hhd successfulScramp = %hhd failed scramble = %hhd failed bogey scramble = %hhd succesful bogey scramble = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _totalPutts, _holeNumber, _successfulSandSave,_currentParOfHole,_sandSavePossibility,_successfulScramble, _failedScramble, _failedBogeyScramble, _successfulBogeyScramble]
                                                          delegate:nil
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"save", nil];
    [holeFinished show];
        [self saveToParse];
    NSLog(@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd total putts = %i hole number = %i sand save = %hhd par = %@ sandsaveopportunity = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _totalPutts, _holeNumber, _successfulSandSave,_currentParOfHole,_sandSavePossibility);
    }
     else if (_holeNumber == 18) {
         _totalShotsTaken++;
         _totalPutts++;
         [self sandSaveLogic];
        [self scramblingLogic];
         [self failedTooScrambleLogic];
         [self bogeyScrambleLogic];
         [self failedToBogeyScramble];
//        UIAlertView *roundFinished = [[UIAlertView alloc] initWithTitle:@"Round Complete!"
//                                                                message:@"Now saving your results!"
//                                                               delegate:nil
//                                                      cancelButtonTitle:nil
//                                                      otherButtonTitles:@"Finish Round", nil];
//        [roundFinished show];
    }

}

- (void) saveToParse {
    PFObject *myScore = [PFObject objectWithClassName:@"MyScores"];
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



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 0) {
        /// save to parse / plist!

    } else  {
        [self saveToParse];

    }

        // save to parse

}
- (IBAction)missOnTap:(id)sender {
    _totalShotsTaken++;
    _totalPutts++;
    NSLog(@"shots = %i", _totalShotsTaken);
}

@end
