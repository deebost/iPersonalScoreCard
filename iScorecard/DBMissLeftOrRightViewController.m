//
//  DBMissLeftOrRightViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBMissLeftOrRightViewController.h"
#import "DBGreenHitViewController.h"
#import "DBOnPuttingSurfaceViewController.h"

@interface DBMissLeftOrRightViewController ()
@property (weak, nonatomic) IBOutlet UIButton *roughButton;
@property (weak, nonatomic) IBOutlet UIButton *sandButton;
@property (weak, nonatomic) IBOutlet UIButton *waterButton;
@property (weak, nonatomic) IBOutlet UIButton *obButton;
@property (weak, nonatomic) IBOutlet UIButton *mistakeButton;
- (IBAction)onTapGoBackMistake:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *lastHoleView;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleShotsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHolePuttsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleGIRLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleFairwayhitLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleSandSaveLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleScrambleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleBogeyScrambleLabel;

@end

@implementation DBMissLeftOrRightViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        DBGreenHitViewController *greenHitVC = (DBGreenHitViewController *) segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"sandSegue"]) {
        _possibilityForSandSave = YES;
    }
    else if ([segue.identifier isEqualToString:@"obSegue"]) {

        _totalShotsTaken++;
    }
    else if ([segue.identifier isEqualToString:@"roughSegue"]) {
    } else if ([segue.identifier isEqualToString:@"waterSegue"]) {

        _totalShotsTaken++;
    } else if ([segue.identifier isEqualToString:@"inFairwaySegue"]) {

    }
    greenHitVC.totalShotsTaken = _totalShotsTaken + _numberOfPenaltyStrokes;
    greenHitVC.gir = _missGIR;
    greenHitVC.sandSaveOpportunity = _possibilityForSandSave;
    greenHitVC.greenHitFairwayHit = _missLeftVCFairwayHit;
    greenHitVC.greenHitMissLeft = _missLeftVCMissLeft;
    greenHitVC.greenHitMissRight = _missLeftVCMissRight;
    greenHitVC.currentParOfHole = _currentParOfHole;
    greenHitVC.holeNumber = _holeNumber;
    greenHitVC.lastHoleBogeyScramble = _lastHoleBogeyScramble;
    greenHitVC.lastHoleFairwayHitorMiss = _lastHoleFairwayHitorMiss;
    greenHitVC.lastHoleGIR = _lastHoleGIR;
    greenHitVC.lastHolePuttTotal = _lastHolePuttTotal;
    greenHitVC.lastHoleSandSave = _lastHoleSandSave;
    greenHitVC.lastHoleShotTotal = _lastHoleShotTotal;
    greenHitVC.lastHoleScamble = _lastHoleScamble;
    greenHitVC.howManyHoles = _howManyHoles;


    NSLog(@"shot takes =%i sand save = %i, miss left = %hhd miss right = %hhd", _totalShotsTaken, _numberOfPenaltyStrokes, _missLeftVCMissLeft, _missLeftVCMissRight);
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
        _lastHoleFairwayhitLabel.text = _lastHoleFairwayHitorMiss;
        _lastHoleSandSaveLabel.text = _lastHoleSandSave;
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self lastHoleStatsView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapGoBackMistake:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
