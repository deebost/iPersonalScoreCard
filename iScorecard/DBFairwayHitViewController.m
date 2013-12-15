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
@property (weak, nonatomic) IBOutlet UILabel *parLabel;
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
        } else if ([segue.identifier isEqualToString:@"onFeltVC"]) {
            _shotTotalForHole++;
            onFeltVc.gir = YES;
            onFeltVc.holeNumber = _holeNumber;
            onFeltVc.totalShotsTaken = _shotTotalForHole;
            onFeltVc.currentParOfHole = _currentParOfhole;
            onFeltVc.roundDate = _roundDate;
            
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
            missRightVC.roundDate = _roundDate;

        }
        NSLog(@"total for hole = %i fairway hit = %hhd  miss right = %hhd miss left = %hhd hole number = %i par = %@", _shotTotalForHole, _fairwayHit, _missRight, _missLeft, _holeNumber, _currentParOfhole);
}


- (void)viewDidLoad
{


    [super viewDidLoad];

    _missShortButton.hidden = YES;
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
    [self newCourseOrOldCourse];

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

- (void)newCourseOrOldCourseLogic {
    if (_newCourseOrOldCourse == YES) {
        NSUserDefaults *getParFromSavedList = [NSUserDefaults standardUserDefaults];
        [getParFromSavedList setObject:_passedCourseInfoDict forKey:@"oldCourseSavedInfo"];
        NSLog(@"%@", _passedCourseInfoDict);
        [getParFromSavedList synchronize];

    } else {
        [self findHolePar];
    }
}

- (void) findHolePar {
    NSUserDefaults *loadParOfCurrentHole = [NSUserDefaults standardUserDefaults];
    NSString *currentCourseName = [loadParOfCurrentHole objectForKey:@"courseName"];


    NSMutableDictionary *loadDict = [[NSMutableDictionary alloc] initWithDictionary:[loadParOfCurrentHole objectForKey:[NSString stringWithFormat:@"%@", currentCourseName]]];
    NSString *parString = [NSString stringWithFormat:@"%@", [loadDict objectForKey:[NSString stringWithFormat:@"hole%i", _holeNumber]]];
    _parLabel.text = parString;
    _currentParOfhole = parString;

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
            [self performSelector:@selector(dismissAlert:) withObject:sayCheese afterDelay:3.5f];
        [self videoCaptureStuff];
        _holeNumberLabel.text = [NSString stringWithFormat:@"%i",_holeNumber];

        // save hole in one to parse / plist update hole number;

    }
}
@end
