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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    _totalShotsTaken++;
    UIAlertView *holeFinished = [[UIAlertView alloc] initWithTitle:@"Hole complete!"
                                                           message:@"Would you like to save the results?"
                                                          delegate:nil
                                                 cancelButtonTitle:@"cancel"
                                                 otherButtonTitles:@"save", nil];
    [holeFinished show];
    NSLog(@"shots = %i total penaltys = %i fairwayhit = %hhd missleft = %hhd missright = %hhd gir = %hhd sandave = %hhd", _totalShotsTaken, _totalPenaltyStrokes, _finalFairwayHit, _finalMissLeft, _finalMissRight, _gir, _sandSave);
}

- (IBAction)missOnTap:(id)sender {
    _totalShotsTaken++;
    NSLog(@"shots = %i", _totalShotsTaken);
}

@end
