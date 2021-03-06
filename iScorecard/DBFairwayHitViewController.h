//
//  DBFairwayHitViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBOnPuttingSurfaceViewController.h"

@interface DBFairwayHitViewController : UIViewController <UIAlertViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(strong, nonatomic) NSMutableDictionary *passedCourseInfoDict;
@property(strong, nonatomic) NSString *passedCourseName;
@property(nonatomic) int shotTotalForHole;
@property(nonatomic) BOOL fairwayHit;
@property(nonatomic) BOOL missRight;
@property(nonatomic) BOOL missLeft;
@property(nonatomic) BOOL greensInRegulation;
@property(nonatomic) int holeNumber;
@property(nonatomic, strong) NSString *currentParOfhole;
@property (strong, nonatomic) NSString *tempString;
@property (strong, nonatomic) NSMutableArray *currentHoleInfos;
@property (strong, nonatomic) NSString *roundDate;
@property (nonatomic) int totalPutts;
@property (nonatomic) BOOL newCourseOrOldCourse;

@property (nonatomic) NSInteger howManyHoles;
@property (strong, nonatomic) NSString *passRoundDate;
// last hole stats to pass to ALL VC
@property (weak, nonatomic) IBOutlet UILabel *lastHoleShotsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHolePuttsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleGIRLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleFairwaysHitLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleSandSaveLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleScrambleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastHoleBogeyScrambleLabel;
@property (weak, nonatomic) IBOutlet UIView *entireLastHoleView;

@property (weak, nonatomic) NSString *lastHoleShotTotal;
@property (weak, nonatomic) NSString *lastHolePuttTotal;
@property (weak, nonatomic) NSString *lastHoleGIR;
@property (weak, nonatomic) NSString *lastHoleFairwayHitorMiss;
@property (weak, nonatomic) NSString *lastHoleSandSave;
@property (weak, nonatomic) NSString *lastHoleScamble;
@property (weak, nonatomic) NSString *lastHoleBogeyScramble;

@property (weak, nonatomic) NSString *passedLastHoleShotTotal;
@property (weak, nonatomic) NSString *passedLastHolePuttTotal;
@property (weak, nonatomic) NSString *passedLastHoleGIR;
@property (weak, nonatomic) NSString *passedLastHoleFairwayHitorMiss;
@property (weak, nonatomic) NSString *passedLastHoleSandSave;
@property (weak, nonatomic) NSString *passedLastHoleScamble;
@property (weak, nonatomic) NSString *passedLastHoleBogeyScramble;



@end

