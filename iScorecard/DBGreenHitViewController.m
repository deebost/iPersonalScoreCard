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
@property (weak, nonatomic) IBOutlet UIView *lastHoleView;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleShotsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHolePuttsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleGIRLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleFairwayHitLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleSandSavesLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleScrambleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleBogeyScrambleLabel;


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
    [super viewWillAppear:animated];
    [self lastHoleStatsView];

}

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
        _lastHoleSandSavesLabel.text = _lastHoleSandSave;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)holeParLogic {

    if (_currentParOfHole.integerValue == 3 && _totalShotsTaken <= 1) {
        _gir = YES;
    }else if (_currentParOfHole.integerValue == 4 && _totalShotsTaken <= 2) {
        _gir = YES;
    } else if (_currentParOfHole.integerValue == 5 && _totalShotsTaken <= 3) {
        _gir = YES;
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
            DBMissLeftOrRightViewController *missHitVC = (DBMissLeftOrRightViewController *) segue.destinationViewController;
    DBOnPuttingSurfaceViewController *feltVC = (DBOnPuttingSurfaceViewController *) segue.destinationViewController;

    if ([segue.identifier isEqualToString:@"missShortSegue"]) {
        _totalShotsTaken++;
                [self holeParLogic];
        missHitVC.missGIR = _gir;

        missHitVC.totalShotsTaken = _totalShotsTaken;
        missHitVC.missLeftVCFairwayHit = _greenHitFairwayHit;
        missHitVC.missLeftVCMissLeft = _greenHitMissLeft;
        missHitVC.missLeftVCMissRight = _greenHitMissRight;
        missHitVC.holeNumber = _holeNumber;
        missHitVC.currentParOfHole = _currentParOfHole;
        missHitVC.possibilityForSandSave = _sandSaveOpportunity;
        missHitVC.roundDate = _roundDate;
        missHitVC.lastHoleBogeyScramble = _lastHoleBogeyScramble;
        missHitVC.lastHoleFairwayHitorMiss = _lastHoleFairwayHitorMiss;
        missHitVC.lastHoleGIR = _lastHoleGIR;
        missHitVC.lastHolePuttTotal = _lastHolePuttTotal;
        missHitVC.lastHoleSandSave = _lastHoleSandSave;
        missHitVC.lastHoleShotTotal = _lastHoleShotTotal;
        missHitVC.lastHoleScamble = _lastHoleScamble;
                missHitVC.howManyHoles = _howManyHoles;
    } else if ([segue.identifier isEqualToString:@"missLeftSegue"]) {
        _totalShotsTaken++;
                [self holeParLogic];
                missHitVC.missGIR = _gir;
        missHitVC.howManyHoles = _howManyHoles;
        missHitVC.totalShotsTaken = _totalShotsTaken;
        missHitVC.missLeftVCFairwayHit = _greenHitFairwayHit;
        missHitVC.missLeftVCMissLeft = _greenHitMissLeft;
        missHitVC.missLeftVCMissRight = _greenHitMissRight;
        missHitVC.holeNumber = _holeNumber;
        missHitVC.currentParOfHole = _currentParOfHole;
        missHitVC.possibilityForSandSave = _sandSaveOpportunity;
        missHitVC.roundDate = _roundDate;
        missHitVC.lastHoleBogeyScramble = _lastHoleBogeyScramble;
        missHitVC.lastHoleFairwayHitorMiss = _lastHoleFairwayHitorMiss;
        missHitVC.lastHoleGIR = _lastHoleGIR;
        missHitVC.lastHolePuttTotal = _lastHolePuttTotal;
        missHitVC.lastHoleSandSave = _lastHoleSandSave;
        missHitVC.lastHoleShotTotal = _lastHoleShotTotal;
        missHitVC.lastHoleScamble = _lastHoleScamble;
    } else if ([segue.identifier isEqualToString:@"missRightSegue"]) {
        _totalShotsTaken++;
                [self holeParLogic];
                missHitVC.missGIR = _gir;
        missHitVC.totalShotsTaken = _totalShotsTaken;
        missHitVC.missLeftVCFairwayHit = _greenHitFairwayHit;
        missHitVC.missLeftVCMissLeft = _greenHitMissLeft;
        missHitVC.missLeftVCMissRight = _greenHitMissRight;
        missHitVC.holeNumber = _holeNumber;
        missHitVC.howManyHoles = _howManyHoles;
        missHitVC.possibilityForSandSave = _sandSaveOpportunity;
        missHitVC.currentParOfHole = _currentParOfHole;
        missHitVC.roundDate = _roundDate;
        missHitVC.lastHoleBogeyScramble = _lastHoleBogeyScramble;
        missHitVC.lastHoleFairwayHitorMiss = _lastHoleFairwayHitorMiss;
        missHitVC.lastHoleGIR = _lastHoleGIR;
        missHitVC.lastHolePuttTotal = _lastHolePuttTotal;
        missHitVC.lastHoleSandSave = _lastHoleSandSave;
        missHitVC.lastHoleShotTotal = _lastHoleShotTotal;
        missHitVC.lastHoleScamble = _lastHoleScamble;
    } else if ([segue.identifier isEqualToString:@"greenHitSegue"]) {
                _totalShotsTaken++;
        [self holeParLogic];
        feltVC.howManyHoles = _howManyHoles;
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
        feltVC.lastHoleBogeyScramble = _lastHoleBogeyScramble;
        feltVC.lastHoleFairwayHitorMiss = _lastHoleFairwayHitorMiss;
        feltVC.lastHoleGIR = _lastHoleGIR;
        feltVC.lastHolePuttTotal = _lastHolePuttTotal;
        feltVC.lastHoleSandSave = _lastHoleSandSave;
        feltVC.lastHoleShotTotal = _lastHoleShotTotal;
        feltVC.lastHoleScamble = _lastHoleScamble;
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
    NSNumber *succesSandSave = [[NSNumber alloc] initWithInt:_successfulSandSaveWORKPLEASE];
    NSNumber *puts = [[NSNumber alloc] initWithInt:_totalPutts];
    NSNumber *scrambleYES = [[NSNumber alloc] initWithInt:_successScramble];
        NSNumber *scrambleNO = [[NSNumber alloc] initWithInt:_failScramble];
        NSNumber *bogeyScrambleYES = [[NSNumber alloc] initWithInt:_successBogeyScramble];
        NSNumber *bogeyScrambleNO = [[NSNumber alloc] initWithInt:_failBogeyScrabmle];
    NSString *par = _currentParOfHole;
    NSNumber *penalty = [[NSNumber alloc] initWithInt:_penaltyStrokes];
    NSNumber *hole = [[NSNumber alloc] initWithInt:_holeNumber];



    NSMutableDictionary *holeDict = [[NSMutableDictionary alloc] init];
    //    [holeDict setObject:dateOfRound forKey:@"dateOfRound"];
    [holeDict setObject:gir forKey:@"gir"];
    [holeDict setObject:totalShots forKey:@"totalShots"];
    [holeDict setObject:fairwayHits forKey:@"fairwayHits"];
    [holeDict setObject:missRight forKey:@"missRight"];
    [holeDict setObject:missLeft forKey:@"missLeft"];
    [holeDict setObject:saveSandOpportunity forKey:@"sandSavePossivility"];
    [holeDict setObject:succesSandSave forKey:@"successfulSandSave"];
    [holeDict setObject:puts forKey:@"totalPutts"];
    [holeDict setObject:scrambleYES forKey:@"successfulScramble"];
    [holeDict setObject:scrambleNO forKey:@"failedScramble"];
    [holeDict setObject:bogeyScrambleYES forKey:@"successfulBogeyScramble"];
    [holeDict setObject:bogeyScrambleNO forKey:@"failedBogeyScramble"];
    [holeDict setObject:par forKey:@"currentPar"];
    [holeDict setObject:penalty forKey:@"totalPenaltyStrokes"];
    [holeDict setObject:hole forKey:@"holeNumber"];

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
    DLog(@"Bye bye %@", _currentParOfHole);
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
