//
//  DBFairwayHitViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBFairwayHitViewController.h"
#import "DBGreenHitViewController.h"
#import "DBMissLeftOrRightViewController.h"
#import "DBOnPuttingSurfaceViewController.h"

@interface DBFairwayHitViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fairwayHitButton;
@property (weak, nonatomic) IBOutlet UIButton *missRightButton;
@property (weak, nonatomic) IBOutlet UIButton *missLeftButton;


@end


@implementation DBFairwayHitViewController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    DBMissLeftOrRightViewController *missRightVC = (DBMissLeftOrRightViewController *) segue.destinationViewController;
                DBGreenHitViewController *greenHitVC = (DBGreenHitViewController *) segue.destinationViewController;

        if ([segue.identifier isEqualToString:@"driveToFairway"]) {
            if (_isFirstSwing == YES) {
                _fairwayHit = YES;
                _shotTotalForHole++;
                _isFirstSwing = NO;
                
            } else {
                _shotTotalForHole++;
            }

            greenHitVC.gir = NO;
            greenHitVC.totalShotsTaken = _shotTotalForHole;
        } else if ([segue.identifier isEqualToString:@"missLeftSegue"]) {
            if (_isFirstSwing == YES) {
                _missLeft = YES;
                _shotTotalForHole++;
                _isFirstSwing = NO;
            } else {
                _shotTotalForHole++;
            }

            missRightVC.totalShotsTaken = _shotTotalForHole;
            missRightVC.possibilityForSandSave = NO;
            missRightVC.numberOfPenaltyStrokes = 0;
            missRightVC.chanceToScramble = NO;

        } else if ([segue.identifier isEqualToString:@"missRightSegue"]) {
            if (_isFirstSwing == YES) {
                _isFirstSwing = NO;
                _missRight = YES;
                _shotTotalForHole++;
            } else {
                _shotTotalForHole++;
            }
            missRightVC.totalShotsTaken = _shotTotalForHole;
            missRightVC.possibilityForSandSave = NO;
            missRightVC.numberOfPenaltyStrokes = 0;
            missRightVC.chanceToScramble = NO;
        }
        NSLog(@"total for hole = %i fairway hit = %hhd  miss right = %hhd miss left = %hhd", _shotTotalForHole, _fairwayHit, _missRight, _missLeft);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isFirstSwing = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
