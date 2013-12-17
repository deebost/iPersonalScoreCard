//
//  DBGreenHitViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBGreenHitViewController.h"
#import "DBMissLeftOrRightViewController.h"
#import "DBFairwayHitViewController.h"
#import "DBOnPuttingSurfaceViewController.h"
#import "DBGolfLogic.h"

@interface DBGreenHitViewController ()
@property (weak, nonatomic) IBOutlet UIButton *greenHitButton;
@property (weak, nonatomic) IBOutlet UIButton *missRightButton;
@property (weak, nonatomic) IBOutlet UIButton *missLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *missShortButton;
@property (weak, nonatomic) IBOutlet UILabel *shotTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *parLabel;
@property (weak, nonatomic) IBOutlet UILabel *holeNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *holeButton;
- (IBAction)onTapHole:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *mistakeButton;
- (IBAction)onTapGoBackMistake:(id)sender;


@end
NSString *tempString;
NSString *title;
UIAlertView *inTheHole ;
DBGolfLogic *golfLogic;
BOOL successSandSave;
@implementation DBGreenHitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        [_parLabel setText:_currentParOfHole];
    
    

}



- (void)viewWillAppear:(BOOL)animated{



}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)holeParLogic {

    if (_currentParOfHole.integerValue == 3 && _totalShotsTaken == 1) {
        _gir = YES;
    }else if (_currentParOfHole.integerValue == 4 && _totalShotsTaken == 2) {
        _gir = YES;
    } else if (_currentParOfHole.integerValue == 5 && _totalShotsTaken == 3) {
        _gir = YES;
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
            DBMissLeftOrRightViewController *missHitVC = (DBMissLeftOrRightViewController *) segue.destinationViewController;
    DBOnPuttingSurfaceViewController *feltVC = (DBOnPuttingSurfaceViewController *) segue.destinationViewController;

    if ([segue.identifier isEqualToString:@"missShortSegue"]) {
        _totalShotsTaken++;

        missHitVC.totalShotsTaken = _totalShotsTaken;
        missHitVC.missLeftVCFairwayHit = _greenHitFairwayHit;
        missHitVC.missLeftVCMissLeft = _greenHitMissLeft;
        missHitVC.missLeftVCMissRight = _greenHitMissRight;
        missHitVC.holeNumber = _holeNumber;
        missHitVC.currentParOfHole = _currentParOfHole;
        missHitVC.possibilityForSandSave = _sandSaveOpportunity;
        missHitVC.roundDate = _roundDate;
    } else if ([segue.identifier isEqualToString:@"missLeftSegue"]) {
        _totalShotsTaken++;
        missHitVC.totalShotsTaken = _totalShotsTaken;
        missHitVC.missLeftVCFairwayHit = _greenHitFairwayHit;
        missHitVC.missLeftVCMissLeft = _greenHitMissLeft;
        missHitVC.missLeftVCMissRight = _greenHitMissRight;
        missHitVC.holeNumber = _holeNumber;
        missHitVC.currentParOfHole = _currentParOfHole;
        missHitVC.possibilityForSandSave = _sandSaveOpportunity;
        missHitVC.roundDate = _roundDate;
    } else if ([segue.identifier isEqualToString:@"missRightSegue"]) {
        _totalShotsTaken++;
        missHitVC.totalShotsTaken = _totalShotsTaken;
        missHitVC.missLeftVCFairwayHit = _greenHitFairwayHit;
        missHitVC.missLeftVCMissLeft = _greenHitMissLeft;
        missHitVC.missLeftVCMissRight = _greenHitMissRight;
        missHitVC.holeNumber = _holeNumber;
        missHitVC.possibilityForSandSave = _sandSaveOpportunity;
        missHitVC.currentParOfHole = _currentParOfHole;
        missHitVC.roundDate = _roundDate;
    } else if ([segue.identifier isEqualToString:@"greenHitSegue"]) {
                _totalShotsTaken++;
                [self holeParLogic];

        feltVC.gir = _gir;
        feltVC.totalPenaltyStrokes = _penaltyStrokes;
        feltVC.sandSavePossibility = _sandSaveOpportunity;
        feltVC.totalShotsTaken = _totalShotsTaken;
        feltVC.finalFairwayHit = _greenHitFairwayHit;
        feltVC.finalMissLeft = _greenHitMissLeft;
        feltVC.finalMissRight = _greenHitMissRight;
        feltVC.holeNumber = _holeNumber;
        feltVC.currentParOfHole = _currentParOfHole;
        feltVC.roundDate = _roundDate;
    }
    NSLog(@"total shot = %i  gir = %hhd fairway hit = %hhd par of hole = %@ hole number = %i success sand save = %hhd", _totalShotsTaken, _gir, _greenHitFairwayHit, _currentParOfHole, _holeNumber, _successfulSandSaveWORKPLEASE);
}

- (void) saveHoleStatsToDictionary {

    NSNumber *totalShots = [[NSNumber alloc] initWithInt:_totalShotsTaken];
    NSNumber *gir = [[NSNumber alloc] initWithInt:_gir];
    NSNumber *fairwayHits = [[NSNumber alloc] initWithInt:_greenHitFairwayHit];
    NSNumber *missLeft = [[NSNumber alloc] initWithInt:_greenHitMissLeft];
    NSNumber *missRight = [[NSNumber alloc] initWithInt:_greenHitMissRight];
    NSNumber *saveSandOpportunity = [[NSNumber alloc] initWithInt:_sandSaveOpportunity];
    NSNumber *holeNumber = [[NSNumber alloc] initWithInt:_holeNumber];
    NSNumber *succesSandSave = [[NSNumber alloc] initWithInt:_successfulSandSaveWORKPLEASE];
    NSNumber *puts = [[NSNumber alloc] initWithInt:_totalPutts];
    NSNumber *scrambleYES = [[NSNumber alloc] initWithInt:_successScramble];
        NSNumber *scrambleNO = [[NSNumber alloc] initWithInt:_failScramble];
        NSNumber *bogeyScrambleYES = [[NSNumber alloc] initWithInt:_successBogeyScramble];
        NSNumber *bogeyScrambleNO = [[NSNumber alloc] initWithInt:_failBogeyScrabmle];



    NSMutableDictionary *holeDict = [[NSMutableDictionary alloc] init];
    //    [holeDict setObject:dateOfRound forKey:@"dateOfRound"];
    [holeDict setObject:gir forKey:@"gir"];
    [holeDict setObject:totalShots forKey:@"totalShots"];
    [holeDict setObject:fairwayHits forKey:@"fairwayHits"];
    [holeDict setObject:missRight forKey:@"missRight"];
    [holeDict setObject:missLeft forKey:@"missLeft"];
    [holeDict setObject:saveSandOpportunity forKey:@"saveSandOpportunity"];
    [holeDict setObject:succesSandSave forKey:@"successSandSave"];
    [holeDict setObject:puts forKey:@"totalPutts"];
    [holeDict setObject:scrambleYES forKey:@"scrambleYes"];
        [holeDict setObject:scrambleNO forKey:@"scrambleNo"];
    [holeDict setObject:bogeyScrambleYES forKey:@"bogeyScrambleYes"];
    [holeDict setObject:bogeyScrambleNO forKey:@"bogeyScrambleNo"];








    [holeDict setObject:holeNumber forKey:@"holeNumber"];

    NSUserDefaults *saveHole = [NSUserDefaults standardUserDefaults];
    [saveHole setObject:holeDict forKey:[NSString stringWithFormat:@"hole%iInfo",_holeNumber]];
    [saveHole synchronize];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {


    title = [alertView buttonTitleAtIndex:buttonIndex];

    if ([title isEqualToString:@"No"]) {
        _totalShotsTaken--;


    } else if ([title isEqualToString:@"Yes"])  {

        int par = _currentParOfHole.integerValue;

        golfLogic = [[DBGolfLogic alloc] init];
        NSNumber *tempShotsTake = [[NSNumber alloc] initWithInt:_totalShotsTaken];
        NSNumber *tempPar = [[NSNumber alloc] initWithInt:par];

//        _gir = YES;
        _totalPutts = 0;
        [golfLogic sandSaveLogicTwo:tempPar totalShotsTaken:tempShotsTake sandSaveIsPossible:_sandSaveOpportunity];
        [golfLogic scrambleLogic:tempPar totalShots:tempShotsTake greenInReg:_gir];
        [golfLogic failScrambleLogic:tempPar totalShots:tempShotsTake greenInreg:_gir];
        [golfLogic bogeyscrambleLogic:tempPar totalShots:tempShotsTake greenInReg:_gir];
        [golfLogic failedBogeyScrambleLogic:tempPar totalShots:tempShotsTake greenInReg:_gir];
        [golfLogic totalShotsToFigureOutGir:tempShotsTake par:tempPar];
        _gir = golfLogic.greenInRegulation;
        _failBogeyScrabmle = golfLogic.bogeyScrambleNO;
        _successBogeyScramble = golfLogic.bogeyScrambleYES;
        _failScramble = golfLogic.scrambleNO;
        _successfulSandSaveWORKPLEASE = golfLogic.successOnSandSave;
        _successScramble = golfLogic.scrambleYES;

//        golfLogic.successOnSandSave = _successfulSandSaveWORKPLEASE;
        NSLog(@"%hhd",_successfulSandSaveWORKPLEASE);
        [self saveHoleStatsToDictionary];

        // save to plist
                [self performSegueWithIdentifier:@"yesHoleExit" sender:self];
    }
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    inTheHole.delegate = nil;
}
- (IBAction)onTapHole:(id)sender {
    inTheHole = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
                                                        message:@"Did you really put that one in?" 
                                                       delegate:self
                                              cancelButtonTitle:@"No"
                                              otherButtonTitles:@"Yes", nil];
            _totalShotsTaken++;

    [inTheHole show];

    
}
- (IBAction)onTapGoBackMistake:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
    @end
