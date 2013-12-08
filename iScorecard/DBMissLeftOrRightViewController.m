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
    greenHitVC.gir = _missGIR;
    greenHitVC.sandSaveOpportunity = _possibilityForSandSave;
    NSLog(@"shot takes =%i sand save = %hhd", _totalShotsTaken, _possibilityForSandSave);
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
