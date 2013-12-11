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
@property (weak, nonatomic) IBOutlet UILabel *shotTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *parLabel;
@property (weak, nonatomic) IBOutlet UILabel *holeNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *holeButton;
- (IBAction)onTapHole:(id)sender;


@end
NSString *tempString;
NSString *title;
UIAlertView *inTheHole ;
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
    NSLog(@"total shot = %i  gir = %hhd fairway hit = %hhd par of hole = %@ hole number = %i currentParOfHole = %@", _totalShotsTaken, _gir, _greenHitFairwayHit, _currentParOfHole, _holeNumber, _currentParOfHole);
}

- (void) saveHoleStatsToDictionary {
    NSNumber *totalShots = [[NSNumber alloc] initWithInt:_totalShotsTaken];
    NSNumber *gir = [[NSNumber alloc] initWithBool:_gir];
    NSNumber *fairwayHits = [[NSNumber alloc] initWithBool:_greenHitFairwayHit];
    NSNumber *missLeft = [[NSNumber alloc] initWithBool:_greenHitMissLeft];
    NSNumber *missRight = [[NSNumber alloc] initWithBool:_greenHitMissRight];
    NSNumber *saveSandOpportunity = [[NSNumber alloc] initWithBool:_sandSaveOpportunity];
    NSNumber *holeNumber = [[NSNumber alloc] initWithInt:_holeNumber];


    NSMutableDictionary *holeDict = [[NSMutableDictionary alloc] init];
    //    [holeDict setObject:dateOfRound forKey:@"dateOfRound"];
    [holeDict setObject:gir forKey:@"gir"];
    [holeDict setObject:totalShots forKey:@"totalShots"];
    [holeDict setObject:fairwayHits forKey:@"fairwayHits"];
    [holeDict setObject:missRight forKey:@"missRight"];
    [holeDict setObject:missLeft forKey:@"missLeft"];
    [holeDict setObject:saveSandOpportunity forKey:@"saveSandOpportunity"];








    [holeDict setObject:holeNumber forKey:@"holeNumber"];

    NSUserDefaults *saveHole = [NSUserDefaults standardUserDefaults];
    [saveHole setObject:holeDict forKey:[NSString stringWithFormat:@"hole%iInfo",_holeNumber]];
    [saveHole synchronize];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {


    title = [alertView buttonTitleAtIndex:buttonIndex];

    if ([title isEqualToString:@"No"]) {
        


    } else if ([title isEqualToString:@"Yes"])  {
        _gir = YES;
        _totalShotsTaken++;
        [self saveHoleStatsToDictionary];
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

    [inTheHole show];

    
}
    @end
