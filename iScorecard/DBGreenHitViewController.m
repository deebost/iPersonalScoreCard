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

@interface DBGreenHitViewController ()
@property (weak, nonatomic) IBOutlet UIButton *greenHitButton;
@property (weak, nonatomic) IBOutlet UIButton *missRightButton;
@property (weak, nonatomic) IBOutlet UIButton *missLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *missShortButton;


@end

@implementation DBGreenHitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
            DBMissLeftOrRightViewController *missHitVC = (DBMissLeftOrRightViewController *) segue.destinationViewController;
    DBOnPuttingSurfaceViewController *feltVC = (DBOnPuttingSurfaceViewController *) segue.destinationViewController;

    if ([segue.identifier isEqualToString:@"missShortSegue"]) {
        _totalShotsTaken++;

        missHitVC.totalShotsTaken = _totalShotsTaken;
    } else if ([segue.identifier isEqualToString:@"missLeftSegue"]) {
        _totalShotsTaken++;
        missHitVC.totalShotsTaken = _totalShotsTaken;
    } else if ([segue.identifier isEqualToString:@"missRightSegue"]) {
        _totalShotsTaken++;
        missHitVC.totalShotsTaken = _totalShotsTaken;
    } else if ([segue.identifier isEqualToString:@"greenHitSegue"]) {
        _totalShotsTaken++;
        _gir = YES;
        feltVC.totalShotsTaken = _totalShotsTaken;
    }
    NSLog(@"total shot = %i  gir = %hhd", _totalShotsTaken, _gir);
}

@end
