//
//  DBSubmitCourseViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/11/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBSubmitCourseViewController.h"
#import "DBFairwayHitViewController.h"
#import <Parse/Parse.h>

@interface DBSubmitCourseViewController ()
@property (weak, nonatomic) IBOutlet UITextField *courseNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalParTextField;
@property (weak, nonatomic) IBOutlet UITextField *hole1TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole2TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole3TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole4TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole5TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole6TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole7TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole8TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole9TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole10TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole11TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole12TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole13TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole14TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole15TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole16TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole17TextField;
@property (weak, nonatomic) IBOutlet UITextField *hole18TextField;
@property (weak, nonatomic) IBOutlet UIButton *submitCourseButton;
@property (weak, nonatomic) IBOutlet UITextField *cityTextfield;
@property (weak, nonatomic) IBOutlet UIView *topHoleView;
@property (weak, nonatomic) IBOutlet UITextField *enterStateTextField;
@property (weak, nonatomic) IBOutlet UIView *allHoleView;
- (IBAction)courseNameAction:(id)sender;
- (IBAction)courseStateAction:(id)sender;
- (IBAction)courseCityAction:(id)sender;

- (IBAction)hole1EditAction:(id)sender;
- (IBAction)hole2editAction:(id)sender;
- (IBAction)hole3editAction:(id)sender;
- (IBAction)hole4editAction:(id)sender;
- (IBAction)hole5editAction:(id)sender;
- (IBAction)hole6editAction:(id)sender;
- (IBAction)hole7editAction:(id)sender;
- (IBAction)hole8editAction:(id)sender;
- (IBAction)hole9editAction:(id)sender;

- (IBAction)hole10editAction:(id)sender;
- (IBAction)hole11editAction:(id)sender;
- (IBAction)hole12editAction:(id)sender;
- (IBAction)hole13editAction:(id)sender;
- (IBAction)hole14editAction:(id)sender;
- (IBAction)hole15editAction:(id)sender;
- (IBAction)hole16editAction:(id)sender;
- (IBAction)hole17editAction:(id)sender;
- (IBAction)hole18editAction:(id)sender;







@end

NSMutableArray *statesArray;

NSString *courseName;
NSString *totalParForCourse;
NSString *courseState;
NSString *courseCity;
NSString *holeOne;
NSString *holeTwo;
NSString *holeThree;
NSString *holeFour;
NSString *holeFive;
NSString *holeSix;
NSString *holeSeven;
NSString *holeEight;
NSString *holeNine;
NSString *holeTen;
NSString *holeEleven;
NSString *holeTwelve;
NSString *holeThirteen;
NSString *holeFourteen;
NSString *holeFifthteen;
NSString *holeSixteen;
NSString *holeSeventeen;
NSString *holeEightteen;
NSUserDefaults *saveCourseInfo;
CGRect bottomOrigin;
BOOL enteredValidState;

@implementation DBSubmitCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        _allHoleView.backgroundColor = [UIColor whiteColor];
    statesArray = [[NSMutableArray alloc] init];
    bottomOrigin = _allHoleView.frame;

    [statesArray addObjectsFromArray:@[@"Alabama", @"Alaska",  @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Flordia", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon",@"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"]];
}



- (void) addALLPar {
    NSUInteger result = _hole1TextField.text.integerValue + _hole2TextField.text.integerValue + _hole3TextField.text.integerValue + _hole4TextField.text.integerValue + _hole5TextField.text.integerValue + _hole6TextField.text.integerValue + _hole7TextField.text.integerValue + _hole8TextField.text.integerValue + _hole9TextField.text.integerValue + _hole10TextField.text.integerValue + _hole11TextField.text.integerValue + _hole12TextField.text.integerValue + _hole13TextField.text.integerValue + _hole14TextField.text.integerValue + _hole15TextField.text.integerValue + _hole16TextField.text.integerValue + _hole17TextField.text.integerValue + _hole18TextField.text.integerValue;
        _totalParTextField.text = [NSString stringWithFormat:@"%i", result];

}


- (void) getTextOfTextFields {
    courseName = _courseNameTextField.text;
    courseCity = _cityTextfield.text;
    courseState = _enterStateTextField.text;
    totalParForCourse = _totalParTextField.text;
    holeOne = _hole1TextField.text;
    holeTwo = _hole2TextField.text;
    holeThree = _hole3TextField.text;
    holeFour = _hole4TextField.text;
    holeFive = _hole5TextField.text;
    holeSix = _hole6TextField.text;
    holeSeven = _hole7TextField.text;
    holeEight = _hole8TextField.text;
    holeNine = _hole9TextField.text;
    holeTen = _hole10TextField.text;
    holeEleven = _hole11TextField.text;
    holeTwelve = _hole12TextField.text;
    holeThirteen = _hole13TextField.text;
    holeFourteen = _hole14TextField.text;
    holeFifthteen = _hole15TextField.text;
    holeSixteen = _hole16TextField.text;
    holeSeventeen = _hole17TextField.text;
    holeEightteen = _hole18TextField.text;
    [self addALLPar];
    NSMutableDictionary *courseInfo = [[NSMutableDictionary alloc] init];
    [courseInfo setObject:holeOne forKey:@"hole1"];
    [courseInfo setObject:holeTwo forKey:@"hole2"];
    [courseInfo setObject:holeThree forKey:@"hole3"];
    [courseInfo setObject:holeFour forKey:@"hole4"];
    [courseInfo setObject:holeFive forKey:@"hole5"];
    [courseInfo setObject:holeSix forKey:@"hole6"];
    [courseInfo setObject:holeSeven forKey:@"hole7"];
    [courseInfo setObject:holeEight forKey:@"hole8"];
    [courseInfo setObject:holeNine forKey:@"hole9"];
    [courseInfo setObject:holeTen forKey:@"hole10"];
    [courseInfo setObject:holeEleven forKey:@"hole11"];
    [courseInfo setObject:holeTwelve forKey:@"hole12"];
    [courseInfo setObject:holeThirteen forKey:@"hole13"];
    [courseInfo setObject:holeFourteen forKey:@"hole14"];
    [courseInfo setObject:holeFifthteen forKey:@"hole15"];
    [courseInfo setObject:holeSixteen forKey:@"hole16"];
    [courseInfo setObject:holeSeventeen forKey:@"hole17"];
    [courseInfo setObject:holeEightteen forKey:@"hole18"];
    [courseInfo setObject:courseName forKey:@"courseName"];
    [courseInfo setObject:totalParForCourse forKey:@"totalParForCourse"];
    NSArray *tempArray = [[NSArray alloc] initWithObjects:courseInfo, nil];


    saveCourseInfo = [NSUserDefaults standardUserDefaults];
    [saveCourseInfo setObject:tempArray forKey:@"allCourses"];
    [saveCourseInfo setObject:courseInfo forKey:[NSString stringWithFormat:@"%@",courseName]];
    [saveCourseInfo setObject:courseName forKey:@"courseName"];
    courseName = _passCourseName;

    [saveCourseInfo synchronize];
    PFUser *user = [PFUser currentUser];
    PFObject *myScore = [PFObject objectWithClassName:@"Courses"];




    myScore[@"courseInfo"] = courseInfo;
    myScore[@"courseState"] = courseState;
    myScore[@"courseCity"] = courseCity;
    myScore[@"courseName"] = _courseNameTextField.text;
    myScore[@"coursePar"] = totalParForCourse;
    myScore[@"user"] = user;
    [myScore saveInBackground];


    UIAlertView *startRoundAlert = [[UIAlertView alloc] initWithTitle:@"Start Round"
                                                              message:@"Round will begin! "
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"Start Round", nil];
    [startRoundAlert show];


}


- (void)moveViewUpForKeyBoard {


    [UIView animateWithDuration:1.0 animations:^{
        _allHoleView.backgroundColor = [UIColor whiteColor];

        _allHoleView.frame = CGRectMake(0, _topHoleView.frame.origin.y, _allHoleView.frame.size.width, _allHoleView.frame.size.width);
        _topHoleView.alpha = 0.0f;
    }];
}

- (void)helpUser:(int)holeValue textField:(UITextField *)holeNumber {


    if (holeValue <= 2 ) {
        holeNumber.text = @"3";
    } else if (holeValue >= 6) {
        holeNumber.text = @"5";
    }
}

- (void)moveViewDownForKeyBoard {
            _topHoleView.hidden = NO;

    [UIView animateWithDuration:1.0 animations:^{
        _allHoleView.backgroundColor = [UIColor whiteColor];
        _allHoleView.frame = bottomOrigin;
        _topHoleView.alpha = 1.0f;

    }];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

        [self getTextOfTextFields];
    DBFairwayHitViewController *fhVC = segue.destinationViewController;
    fhVC.passedCourseName = _passCourseName;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (IBAction)courseNameAction:(id)sender {
        [self addALLPar];
    [_courseNameTextField resignFirstResponder];
}

- (IBAction)courseStateAction:(id)sender {
        [self addALLPar];
    [_enterStateTextField resignFirstResponder];
}

- (IBAction)courseCityAction:(id)sender {
        [self addALLPar];
    [_cityTextfield resignFirstResponder];
}

- (IBAction)hole1EditAction:(id)sender {
    [self helpUser:_hole1TextField.text.integerValue textField:_hole1TextField];
        [self addALLPar];
    [_hole1TextField resignFirstResponder];
}
- (IBAction)hole2editAction:(id)sender {
    [self helpUser:_hole2TextField.text.integerValue textField:_hole2TextField];
    [self addALLPar];
    [_hole2TextField resignFirstResponder];

}
- (IBAction)hole3editAction:(id)sender {
    [self helpUser:_hole3TextField.text.integerValue textField:_hole3TextField];
    [self addALLPar];
    [_hole3TextField resignFirstResponder];

}
- (IBAction)hole4editAction:(id)sender {
    [self helpUser:_hole4TextField.text.integerValue textField:_hole4TextField];
    [self addALLPar];
    [_hole4TextField resignFirstResponder];

}
- (IBAction)hole5editAction:(id)sender{
    [self helpUser:_hole5TextField.text.integerValue textField:_hole5TextField];
    [self addALLPar];
    [_hole5TextField resignFirstResponder];
}
- (IBAction)hole6editAction:(id)sender{
    [self helpUser:_hole6TextField.text.integerValue textField:_hole6TextField];
    [self addALLPar];
    [self moveViewUpForKeyBoard];
       [_hole6TextField resignFirstResponder];
}
- (IBAction)hole7editAction:(id)sender{
    [self helpUser:_hole7TextField.text.integerValue textField:_hole7TextField];
    [self addALLPar];
    [self moveViewUpForKeyBoard];
    [_hole7TextField resignFirstResponder];
}
- (IBAction)hole8editAction:(id)sender{
    [self helpUser:_hole8TextField.text.integerValue textField:_hole8TextField];
    [self addALLPar];
    [self moveViewUpForKeyBoard];
    [_hole8TextField resignFirstResponder];
}
- (IBAction)hole9editAction:(id)sender {
    [self helpUser:_hole9TextField.text.integerValue textField:_hole9TextField];
    [self addALLPar];
    [self moveViewDownForKeyBoard];
    [_hole9TextField resignFirstResponder];
}

- (IBAction)hole10editAction:(id)sender {
    [self helpUser:_hole10TextField.text.integerValue textField:_hole10TextField];
    [self addALLPar];
    [_hole10TextField resignFirstResponder];
}
- (IBAction)hole11editAction:(id)sender {
    [self helpUser:_hole11TextField.text.integerValue textField:_hole11TextField];
    [self addALLPar];
    [_hole11TextField resignFirstResponder];
}
- (IBAction)hole12editAction:(id)sender {
    [self helpUser:_hole12TextField.text.integerValue textField:_hole12TextField];
    [self addALLPar];
    [_hole12TextField resignFirstResponder];
}
- (IBAction)hole13editAction:(id)sender {
    [self helpUser:_hole13TextField.text.integerValue textField:_hole13TextField];
    [self addALLPar];
    [_hole13TextField resignFirstResponder];
}
- (IBAction)hole14editAction:(id)sender {
    [self helpUser:_hole14TextField.text.integerValue textField:_hole14TextField];
    [self addALLPar];
    [_hole14TextField resignFirstResponder];

}
- (IBAction)hole15editAction:(id)sender {
    [self helpUser:_hole15TextField.text.integerValue textField:_hole15TextField];
    [self addALLPar];
    [self moveViewUpForKeyBoard];
    [_hole15TextField resignFirstResponder];

}
- (IBAction)hole16editAction:(id)sender {
    [self helpUser:_hole16TextField.text.integerValue textField:_hole16TextField];
    [self addALLPar];
    [self moveViewUpForKeyBoard];
    [_hole16TextField resignFirstResponder];

}
- (IBAction)hole17editAction:(id)sender {
    [self helpUser:_hole17TextField.text.integerValue textField:_hole17TextField];
    [self addALLPar];
    [self moveViewUpForKeyBoard];
    [_hole17TextField resignFirstResponder];
}
- (IBAction)hole18editAction:(id)sender {
    [self helpUser:_hole18TextField.text.integerValue textField:_hole18TextField];
    [self addALLPar];
    [self moveViewDownForKeyBoard];
    [_hole18TextField resignFirstResponder];
}

@end
