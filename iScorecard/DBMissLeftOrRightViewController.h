//
//  DBMissLeftOrRightViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBMissLeftOrRightViewController : UIViewController

@property (nonatomic) int totalShotsTaken;
@property (nonatomic) BOOL possibilityForSandSave;
@property (nonatomic) BOOL chanceToScramble;
@property (nonatomic) int numberOfPenaltyStrokes;
@property (nonatomic) BOOL missGIR;
@property (nonatomic) BOOL missLeftVCMissRight;
@property (nonatomic) BOOL missLeftVCMissLeft;
@property (nonatomic) BOOL missLeftVCFairwayHit;
@property (nonatomic) int holeNumber;
@property (strong, nonatomic) NSString *currentParOfHole;
@property (strong, nonatomic) NSString *roundDate;

@property (nonatomic) NSInteger howManyHoles;

@property (strong, nonatomic) NSString *passRoundDate;
@property (weak, nonatomic) NSString *lastHoleShotTotal;
@property (weak, nonatomic) NSString *lastHolePuttTotal;
@property (weak, nonatomic) NSString *lastHoleGIR;
@property (weak, nonatomic) NSString *lastHoleFairwayHitorMiss;
@property (weak, nonatomic) NSString *lastHoleSandSave;
@property (weak, nonatomic) NSString *lastHoleScamble;
@property (weak, nonatomic) NSString *lastHoleBogeyScramble;
@end
