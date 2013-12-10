//
//  DBOnPuttingSurfaceViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBOnPuttingSurfaceViewController.h"
#import "DBGreenHitViewController.h"

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (_holeNumber <= 17) {
        _totalShotsTaken++;
        _totalPutts++;
        [self sandSaveLogic];


/// commit comment
    UIAlertView *holeFinished = [[UIAlertView alloc] initWithTitle:@"Hole complete!"
                                                           message:[NSString stringWithFormat:@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd total putts = %i hole number = %i sand save = %hhd par = %@ sandsaveopportunity = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _totalPutts, _holeNumber, _successfulSandSave,_currentParOfHole,_sandSavePossibility]
                                                          delegate:nil
                                                 cancelButtonTitle:@"cancel"
                                                 otherButtonTitles:@"save", nil];
    [holeFinished show];
    NSLog(@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd total putts = %i hole number = %i sand save = %hhd par = %@ sandsaveopportunity = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _totalPutts, _holeNumber, _successfulSandSave,_currentParOfHole,_sandSavePossibility);
    }
     else if (_holeNumber == 18) {
         _totalShotsTaken++;
         _totalPutts++;
         [self sandSaveLogic];
        UIAlertView *roundFinished = [[UIAlertView alloc] initWithTitle:@"Round Complete!"
                                                                message:@"Now saving your results!"
                                                               delegate:nil
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"Finish Round", nil];
        [roundFinished show];
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"save"]) {
        /// save to parse / plist!
        
    } else if ([title isEqualToString:@"Finish Round"]) {

        // save to parse

    }
}
- (IBAction)missOnTap:(id)sender {
    _totalShotsTaken++;
    _totalPutts++;
    NSLog(@"shots = %i", _totalShotsTaken);
}

@end
