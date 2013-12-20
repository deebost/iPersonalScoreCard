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
#import <Parse/Parse.h>
#import <AVFoundation/AVFoundation.h>

@interface DBFairwayHitViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fairwayHitButton;
@property (weak, nonatomic) IBOutlet UIButton *missRightButton;
@property (weak, nonatomic) IBOutlet UIButton *missLeftButton;
@property (strong, nonatomic) IBOutlet UILabel *parLabel;
@property (weak, nonatomic) IBOutlet UILabel *holeNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *yourStrokesLabel;
@property (weak, nonatomic) IBOutlet UIButton *missShortButton;
@property (weak, nonatomic) IBOutlet UIButton *holeInOneButton;
- (IBAction)onTapHoleInOne:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *greenHitButton;




@end
NSString *title;

@implementation DBFairwayHitViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    DBMissLeftOrRightViewController *missRightVC = (DBMissLeftOrRightViewController *) segue.destinationViewController;
    DBGreenHitViewController *greenHitVC = (DBGreenHitViewController *) segue.destinationViewController;
    DBOnPuttingSurfaceViewController *onFeltVc = (DBOnPuttingSurfaceViewController *) segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"greenHitSegue"]) {

        _fairwayHit = YES;
        _shotTotalForHole++;
        greenHitVC.gir = _greensInRegulation;
        greenHitVC.totalShotsTaken = _shotTotalForHole;
        greenHitVC.greenHitFairwayHit = _fairwayHit;
        greenHitVC.holeNumber = _holeNumber;
        greenHitVC.currentParOfHole = _currentParOfhole;
        greenHitVC.roundDate = _roundDate;
        greenHitVC.lastHoleBogeyScramble = _passedLastHoleBogeyScramble;
        greenHitVC.lastHoleFairwayHitorMiss = _passedLastHoleFairwayHitorMiss;
        greenHitVC.lastHoleGIR = _passedLastHoleGIR;
        greenHitVC.lastHolePuttTotal = _passedLastHolePuttTotal;
        greenHitVC.lastHoleSandSave = _passedLastHoleSandSave;
        greenHitVC.lastHoleShotTotal = _passedLastHoleShotTotal;
        greenHitVC.lastHoleScamble = _passedLastHoleScamble;


    } else if ([segue.identifier isEqualToString:@"missLeftSegue"]) {


            _missLeft = YES;
            _shotTotalForHole++;


            missRightVC.totalShotsTaken = _shotTotalForHole;
            missRightVC.possibilityForSandSave = NO;
            missRightVC.numberOfPenaltyStrokes = 0;
            missRightVC.chanceToScramble = NO;
            missRightVC.missLeftVCMissLeft = _missLeft;
            missRightVC.missLeftVCFairwayHit = _fairwayHit;
            missRightVC.holeNumber = _holeNumber;
            missRightVC.currentParOfHole = _currentParOfhole;
        missRightVC.roundDate = _roundDate;
        missRightVC.lastHoleBogeyScramble = _passedLastHoleBogeyScramble;
        missRightVC.lastHoleFairwayHitorMiss = _passedLastHoleFairwayHitorMiss;
        missRightVC.lastHoleGIR = _passedLastHoleGIR;
        missRightVC.lastHolePuttTotal = _passedLastHolePuttTotal;
        missRightVC.lastHoleSandSave = _passedLastHoleSandSave;
        missRightVC.lastHoleShotTotal = _passedLastHoleShotTotal;
        missRightVC.lastHoleScamble = _passedLastHoleScamble;

        } else if ([segue.identifier isEqualToString:@"missRightSegue"]) {
            _missRight = YES;
            _shotTotalForHole++;

            missRightVC.totalShotsTaken = _shotTotalForHole;
            missRightVC.possibilityForSandSave = NO;
            missRightVC.numberOfPenaltyStrokes = 0;
            missRightVC.chanceToScramble = NO;
            missRightVC.missLeftVCMissRight = _missRight;
            missRightVC.missLeftVCFairwayHit = _fairwayHit;
            missRightVC.holeNumber = _holeNumber;
            missRightVC.currentParOfHole = _currentParOfhole;
            missRightVC.roundDate = _roundDate;
            missRightVC.lastHoleBogeyScramble = _passedLastHoleBogeyScramble;
            missRightVC.lastHoleFairwayHitorMiss = _passedLastHoleFairwayHitorMiss;
            missRightVC.lastHoleGIR = _passedLastHoleGIR;
            missRightVC.lastHolePuttTotal = _passedLastHolePuttTotal;
            missRightVC.lastHoleSandSave = _passedLastHoleSandSave;
            missRightVC.lastHoleShotTotal = _passedLastHoleShotTotal;
            missRightVC.lastHoleScamble = _passedLastHoleScamble;
        } else if ([segue.identifier isEqualToString:@"onFeltVC"]) {
            _shotTotalForHole++;
            onFeltVc.gir = YES;
            onFeltVc.holeNumber = _holeNumber;
            onFeltVc.totalShotsTaken = _shotTotalForHole;
            onFeltVc.currentParOfHole = _currentParOfhole;
            onFeltVc.roundDate = _roundDate;
            onFeltVc.lastHoleBogeyScramble = _passedLastHoleBogeyScramble;
            onFeltVc.lastHoleFairwayHitorMiss = _passedLastHoleFairwayHitorMiss;
            onFeltVc.lastHoleGIR = _passedLastHoleGIR;
            onFeltVc.lastHolePuttTotal = _passedLastHolePuttTotal;
            onFeltVc.lastHoleSandSave = _passedLastHoleSandSave;
            onFeltVc.lastHoleShotTotal = _passedLastHoleShotTotal;
            onFeltVc.lastHoleScamble = _passedLastHoleScamble;
            
        } else if ([segue.identifier isEqualToString:@"missShort"]) {
            _shotTotalForHole++;
            missRightVC.totalShotsTaken = _shotTotalForHole;
            missRightVC.possibilityForSandSave = NO;
            missRightVC.numberOfPenaltyStrokes = 0;
            missRightVC.chanceToScramble = NO;
            missRightVC.missLeftVCMissRight = _missRight;
            missRightVC.missLeftVCFairwayHit = _fairwayHit;
            missRightVC.holeNumber = _holeNumber;
            missRightVC.currentParOfHole = _currentParOfhole;
            missRightVC.lastHoleBogeyScramble = _passedLastHoleBogeyScramble;
            missRightVC.lastHoleFairwayHitorMiss = _passedLastHoleFairwayHitorMiss;
            missRightVC.lastHoleGIR = _passedLastHoleGIR;
            missRightVC.lastHolePuttTotal = _passedLastHolePuttTotal;
            missRightVC.lastHoleSandSave = _passedLastHoleSandSave;
            missRightVC.lastHoleShotTotal = _passedLastHoleShotTotal;
            missRightVC.lastHoleScamble = _passedLastHoleScamble;

        }
        NSLog(@"total for hole = %i fairway hit = %hhd  miss right = %hhd miss left = %hhd hole number = %i par = %@", _shotTotalForHole, _fairwayHit, _missRight, _missLeft, _holeNumber, _currentParOfhole);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _missShortButton.hidden = YES;
    _newCourseOrOldCourse = NO;
    _holeInOneButton.hidden = YES;
    [self figureOutDateOfRoundStart];
    _holeNumber = 1;
    }



- (void)viewWillAppear:(BOOL)animated {
    _shotTotalForHole = 0;
    _holeNumberLabel.text = [NSString stringWithFormat:@"%i", _holeNumber];
    _tempString = [NSString stringWithFormat:@"%i",_shotTotalForHole];
    _yourStrokesLabel.text = _tempString;
    _fairwayHit = NO;
    [self findHolePar];
    [self showHoleScores];
    [self passedThings];

}

- (void) parForHoleLogic {
    if (_parLabel.text.integerValue == 3) {
        _fairwayHitButton.hidden= YES;
        _greenHitButton.hidden = NO;
        _missShortButton.hidden = NO;
        _holeInOneButton.hidden = NO;
    } else {
        _greenHitButton.hidden = YES;
        _fairwayHitButton.hidden = NO;
        _missShortButton.hidden = YES;
        _holeInOneButton.hidden = YES;

    }
}

- (void) passedThings {
    _passedLastHoleBogeyScramble = _lastHoleBogeyScrambleLabel.text;
    _passedLastHoleScamble = _lastHoleScrambleLabel.text;
    _passedLastHoleGIR = _lastHoleGIRLabel.text;
    _passedLastHolePuttTotal = _lastHolePuttsLabel.text;
    _passedLastHoleShotTotal = _lastHoleShotsLabel.text;
    _passedLastHoleSandSave = _lastHoleSandSaveLabel.text;
    _passedLastHoleFairwayHitorMiss = _lastHoleFairwaysHitLabel.text;

}

- (void) findHolePar {
    NSUserDefaults *loadParOfCurrentHole = [NSUserDefaults standardUserDefaults];
    NSString *currentCourseName = [loadParOfCurrentHole objectForKey:@"courseName"];


    NSMutableDictionary *loadDict = [[NSMutableDictionary alloc] initWithDictionary:[loadParOfCurrentHole objectForKey:[NSString stringWithFormat:@"%@", currentCourseName]]];
    NSString *parString = [NSString stringWithFormat:@"%@", [loadDict objectForKey:[NSString stringWithFormat:@"hole%i", _holeNumber]]];

    _currentParOfhole = parString;

    _parLabel.text = _currentParOfhole;

    [self parForHoleLogic];

}

- (void) figureOutDateOfRoundStart {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy hh:mma"];
    NSString *dateString = [dateFormat stringFromDate:today];

    dateString = _roundDate;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)segue {
    DBOnPuttingSurfaceViewController *numberOfHole = segue.sourceViewController;
    DBGreenHitViewController *numberHole = segue.sourceViewController;
    if ([segue.identifier isEqualToString:@"Yes"]) {
        _holeNumber = numberHole.holeNumber;
        _holeNumber = numberOfHole.holeNumber;
        
        _holeNumber++;
    } else if ([segue.identifier isEqualToString:@"No"]) {
        
        
    } else {
        _holeNumber = numberOfHole.holeNumber;
        _holeNumber= numberHole.holeNumber;
        _holeNumber++;
    }

}

- (void) videoCaptureStuff {
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];

    // You have the image. You can use this to present the image in the next view like you require in `#3`.

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dismissAlert:(UIAlertView *)message {
    [message dismissWithClickedButtonIndex:0 animated:YES];
}

- (IBAction)onTapHoleInOne:(id)sender {

/// need to save to parse! and update hole info just like onfeltvc

    _greensInRegulation = YES;
    UIAlertView *areYouSure = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
                                                         message:@"Are you serious? Ace?"
                                                        delegate:self cancelButtonTitle:@"No, I lied"
                                               otherButtonTitles:@"Hole in One!", nil];

    [areYouSure show];

}

- (void) saveHoleStatsToDictionary {
    NSNumber *totalShots = [[NSNumber alloc] initWithInt:_shotTotalForHole];
    NSNumber *gir = [[NSNumber alloc] initWithInt:_greensInRegulation];
    NSNumber *fairwayHits = [[NSNumber alloc] initWithInt:_fairwayHit];
    NSNumber *missLeft = [[NSNumber alloc] initWithInt:_missLeft];
    NSNumber *missRight = [[NSNumber alloc] initWithInt:_missRight];
    NSNumber *holeNumber = [[NSNumber alloc] initWithInt:_holeNumber];


    NSNumber *puts = [[NSNumber alloc] initWithInt:_totalPutts];
    NSMutableDictionary *holeDict = [[NSMutableDictionary alloc] init];
    //    [holeDict setObject:dateOfRound forKey:@"dateOfRound"];
    [holeDict setObject:gir forKey:@"gir"];
    [holeDict setObject:totalShots forKey:@"totalShots"];
    [holeDict setObject:fairwayHits forKey:@"fairwayHits"];
    [holeDict setObject:missRight forKey:@"missRight"];
    [holeDict setObject:missLeft forKey:@"missLeft"];
    [holeDict setObject:puts forKey:@"totalPutts"];
    [holeDict setObject:holeNumber forKey:@"holeNumber"];

    NSUserDefaults *saveHole = [NSUserDefaults standardUserDefaults];
    [saveHole setObject:holeDict forKey:[NSString stringWithFormat:@"hole%iInfo",_holeNumber]];
    [saveHole synchronize];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"No, I lied"]) {
        _shotTotalForHole = 0;
        _greensInRegulation = NO;

    } else if ([title isEqualToString:@"Hole in One!"]) {
        _shotTotalForHole++;
        _totalPutts = 0;
        _holeNumber++;
        _greensInRegulation = YES;
        NSLog(@"hmmm %i",_shotTotalForHole);
        UIAlertView *sayCheese = [[UIAlertView alloc] initWithTitle:@"Say Cheese!"
                                                            message:@"Take a picture of your ball in the hole!"
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
        [self saveHoleStatsToDictionary];
        [sayCheese show];
            [self performSelector:@selector(dismissAlert:) withObject:sayCheese afterDelay:4.5f];
        [self videoCaptureStuff];
        [self dismissViewControllerAnimated:YES completion:^{
            DBFairwayHitViewController *fhVC = [DBFairwayHitViewController new];
            [self presentViewController:fhVC animated:YES completion:nil];
        }];
        _holeNumberLabel.text = [NSString stringWithFormat:@"%i",_holeNumber];
        [self showHoleScores];

        // save hole in one to parse / plist update hole number;

    }
}

//- (void) lastHoleStatsView {
//    if (_holeNumber == 1) {
//        _entireLastHoleView.hidden = YES;
//    } else {
//        _lastHoleShotTotal = _lastHoleShotsLabel.text;
//        _lastHoleScamble =_lastHoleScrambleLabel.text;
//         _lastHolePuttTotal = _lastHolePuttsLabel.text;
//         _lastHoleGIR = _lastHoleGIRLabel.text;
//         _lastHoleBogeyScramble = _lastHoleBogeyScrambleLabel.text;
//         _lastHoleFairwayHitorMiss =  _lastHoleFairwaysHitLabel.text;
//         _lastHoleSandSave = _lastHoleSandSaveLabel.text;
//    }
//}
- (void)showHoleScores {
    NSUserDefaults *lastHoleI = [NSUserDefaults standardUserDefaults];
    NSDictionary *lastHoleDic;
    if (_holeNumber == 1) {
        _entireLastHoleView.hidden = YES;
    } else if (_holeNumber > 1){
        _entireLastHoleView.hidden = NO;
    for (int i = _holeNumber - 1; i <= 18; i++) {
        lastHoleDic = [lastHoleI objectForKey:[NSString stringWithFormat:@"hole%iInfo", i]];


    _lastHoleShotTotal = [lastHoleDic objectForKey:@"totalShots"];
    _lastHoleShotsLabel.text = [NSString stringWithFormat:@"%i",_lastHoleShotTotal.integerValue];

    _lastHolePuttTotal = [lastHoleDic objectForKey:@"totalPutts"];
    _lastHolePuttsLabel.text = [NSString stringWithFormat:@"%i",_lastHolePuttTotal.integerValue];

    _lastHoleGIR = [lastHoleDic objectForKey:@"gir"];
        if (_lastHoleGIR.integerValue == 1) {
            _lastHoleGIRLabel.text = @"YES";
        } else {
            _lastHoleGIRLabel.text = @"NO";
        }

        NSString *yesSandSave = [lastHoleDic objectForKey:@"successfulSandSave"];
        NSString *chanceToSandSave = [lastHoleDic objectForKey:@"sandSavePossivility"];
        if (chanceToSandSave.integerValue == 1 && yesSandSave.integerValue == 1) {
            _lastHoleSandSave = @"YES";
        } else if (chanceToSandSave.integerValue == 0 && yesSandSave.integerValue == 0){
            _lastHoleSandSave = @"N/A";
        }else {
            _lastHoleSandSave = @"NO";
        }
        _lastHoleSandSaveLabel.text = _lastHoleSandSave;

        NSString *yesScramble = [lastHoleDic objectForKey:@"successfulScramble"];
        NSString *chanceToScramble = [lastHoleDic objectForKey:@"failedScramble"];

        if (yesScramble.integerValue == 1) {
            _lastHoleScamble = @"YES";
        } else if (yesScramble.integerValue == 0 && chanceToScramble.integerValue == 0) {
            _lastHoleScamble = @"N/A";

        } else {
            _lastHoleScamble = @"NO";
        }
        _lastHoleScrambleLabel.text = _lastHoleScamble;

        NSString *yesBogeyScramble = [lastHoleDic objectForKey:@"successfulBogeyScramble"];
        NSString *chanceToBogeyScamble = [lastHoleDic objectForKey:@"failedBogeyScramble"];

        if (yesBogeyScramble.integerValue == 1) {
            _lastHoleBogeyScramble = @"YES";
        } else if (yesBogeyScramble.integerValue == 0 && chanceToBogeyScamble.integerValue == 0) {
            _lastHoleBogeyScramble = @"N/A";
        } else {
            _lastHoleBogeyScramble = @"NO";
        }
        _lastHoleBogeyScrambleLabel.text = _lastHoleBogeyScramble;
        NSString *fairwayHit = [lastHoleDic objectForKey:@"fairwayHits"];
        NSString *missRight = [lastHoleDic objectForKey:@"missRight"];
        NSString *missLeft = [lastHoleDic objectForKey:@"missLeft"];

        if (fairwayHit.integerValue == 1) {
            _lastHoleFairwayHitorMiss = @"HIT";
        } else if (missLeft.integerValue == 1) {
            _lastHoleFairwayHitorMiss = @"MISS L";
        } else if (missRight.integerValue == 1) {
            _lastHoleFairwayHitorMiss = @"MISS R";
        } else {
            _lastHoleFairwayHitorMiss = @"N/A";
        }

         _lastHoleFairwaysHitLabel.text = _lastHoleFairwayHitorMiss;
        break;
    }
    }
}

@end
