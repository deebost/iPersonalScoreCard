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
        } else if ([segue.identifier isEqualToString:@"onfeltVC"]) {

            _shotTotalForHole++;
            onFeltVc.gir = YES;
            onFeltVc.holeNumber = _holeNumber;
            onFeltVc.totalShotsTaken = _shotTotalForHole;
            
        }
        NSLog(@"total for hole = %i fairway hit = %hhd  miss right = %hhd miss left = %hhd hole number = %i par = %@", _shotTotalForHole, _fairwayHit, _missRight, _missLeft, _holeNumber, _currentParOfhole);
}


- (void)viewDidLoad
{


    [super viewDidLoad];
    _tempString = [NSString stringWithFormat:@"%i",_shotTotalForHole];
    _missShortButton.hidden = YES;
    _holeInOneButton.hidden = YES;
        _holeNumber = 1;


    _yourStrokesLabel.text = _tempString;
    [self findHolePar];


    }



- (void)viewWillAppear:(BOOL)animated {


    _fairwayHit = NO;
        _shotTotalForHole = 0;

    _holeNumberLabel.text = [NSString stringWithFormat:@"%i", _holeNumber];


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

- (void) findHolePar {

    PFQuery *query = [PFQuery queryWithClassName:@"Golf_Course"];
    PFObject *currentParOfHole = [query getObjectWithId:@"1PtbUKOuaU"];
    _parLabel.text = [currentParOfHole objectForKey:@"parForHole"];
    _currentParOfhole = _parLabel.text;
    [self parForHoleLogic];



}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)segue {
    DBOnPuttingSurfaceViewController *numberOfHole = segue.sourceViewController;
    _holeNumber = numberOfHole.holeNumber;
    _holeNumber++;

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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];

    // You have the image. You can use this to present the image in the next view like you require in `#3`.

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dismissAlert:(UIAlertView *)message {
    [message dismissWithClickedButtonIndex:0 animated:YES];
}

- (IBAction)onTapHoleInOne:(id)sender {
    UIAlertView *areYouSure = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
                                                         message:@"Are you serious? Ace?"
                                                        delegate:self cancelButtonTitle:@"No, I lied"
                                               otherButtonTitles:@"Hole in One!", nil];

    [areYouSure show];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"No, I lied"]) {
        _shotTotalForHole = 0;

    } else if ([title isEqualToString:@"Hole in One!"]) {
        _shotTotalForHole++;
        _holeNumber++;
        NSLog(@"hmmm %i",_shotTotalForHole);
        UIAlertView *sayCheese = [[UIAlertView alloc] initWithTitle:@"Say Cheese!" message:@"Take a picture of your ball in the hole!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [sayCheese show];
            [self performSelector:@selector(dismissAlert:) withObject:sayCheese afterDelay:3.5f];
        [self videoCaptureStuff];
        _holeNumberLabel.text = [NSString stringWithFormat:@"%i",_holeNumber];

        // save hole in one to parse / plist update hole number;

    }
}
@end
