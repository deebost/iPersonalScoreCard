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

@end

@implementation DBMissLeftOrRightViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        DBGreenHitViewController *greenHitVC = (DBGreenHitViewController *) segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"sandSegue"]) {
        _possibilityForSandSave = YES;
    }
    else if ([segue.identifier isEqualToString:@"obSegue"]) {
        _missGIR = NO;
        _numberOfPenaltyStrokes++;
    }
    else if ([segue.identifier isEqualToString:@"roughSegue"]) {
    } else if ([segue.identifier isEqualToString:@"waterSegue"]) {
        _missGIR = NO;
        _numberOfPenaltyStrokes++;
    } else if ([segue.identifier isEqualToString:@"inFairwaySegue"]) {
        _missGIR = NO;
    }

    greenHitVC.totalShotsTaken = _totalShotsTaken + _numberOfPenaltyStrokes;
    greenHitVC.penaltyStrokes = _numberOfPenaltyStrokes;
    greenHitVC.gir = _missGIR;
    greenHitVC.sandSaveOpportunity = _possibilityForSandSave;
    greenHitVC.greenHitFairwayHit = _missLeftVCFairwayHit;
    greenHitVC.greenHitMissLeft = _missLeftVCMissLeft;
    greenHitVC.greenHitMissRight = _missLeftVCMissRight;
    greenHitVC.currentParOfHole = _currentParOfHole;
    greenHitVC.holeNumber = _holeNumber;


    NSLog(@"shot takes =%i sand save = %i, miss left = %hhd miss right = %hhd", _totalShotsTaken, _numberOfPenaltyStrokes, _missLeftVCMissLeft, _missLeftVCMissRight);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
