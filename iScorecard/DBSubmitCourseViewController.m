//
//  DBSubmitCourseViewController.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/11/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBSubmitCourseViewController.h"
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
- (IBAction)onTouchSaveCourse:(id)sender;

@end

NSString *courseName;
NSString *totalParForCourse;
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

@implementation DBSubmitCourseViewController


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

- (void) saveToParse {
    PFObject *myScore = [PFObject objectWithClassName:@"Courses"];
    NSMutableArray *currentCourseInfo = [[NSMutableArray alloc] init];
    [currentCourseInfo addObject:courseName];
        [currentCourseInfo addObject:totalParForCourse];
        [currentCourseInfo addObject:holeOne];
    [currentCourseInfo addObject:holeTwo];
        [currentCourseInfo addObject:holeThree];
        [currentCourseInfo addObject:holeFour];
        [currentCourseInfo addObject:holeFive];
        [currentCourseInfo addObject:holeSix];
    [currentCourseInfo addObject:holeSeven];
        [currentCourseInfo addObject:holeEight];
        [currentCourseInfo addObject:holeNine];
        [currentCourseInfo addObject:holeTen];
        [currentCourseInfo addObject:holeEleven];
    [currentCourseInfo addObject:holeTwelve];
        [currentCourseInfo addObject:holeThirteen];
        [currentCourseInfo addObject:holeFourteen];
        [currentCourseInfo addObject:holeFifthteen];
        [currentCourseInfo addObject:holeSixteen];
        [currentCourseInfo addObject:holeSeventeen];
        [currentCourseInfo addObject:holeEightteen];
    myScore[@"courseInfo"] = currentCourseInfo;
    myScore[@"courseName"] = courseName;
    myScore[@"coursePar"] = totalParForCourse;
    [myScore saveInBackground];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}


- (IBAction)onTouchSaveCourse:(id)sender {
    courseName = _courseNameTextField.text;
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


    NSUserDefaults *saveCourseInfo = [NSUserDefaults standardUserDefaults];
    [saveCourseInfo setObject:courseInfo forKey:[NSString stringWithFormat:@"%@",courseName]];
    [saveCourseInfo setObject:courseName forKey:@"courseName"];
    [self saveToParse];


    UIAlertView *startRoundAlert = [[UIAlertView alloc] initWithTitle:@"Start Round"
                                                              message:@"Round will begin! "
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"Start Round", nil];
    [startRoundAlert show];
    [saveCourseInfo synchronize];
    
}
@end
