//
//  DBGreenHitViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBFairwayHitViewController.h"


@interface DBGreenHitViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic) int totalShotsTaken;
@property (nonatomic) BOOL gir;
@property (nonatomic) BOOL sandSaveOpportunity;
@property (nonatomic) BOOL greenHitFairwayHit;
@property (nonatomic) BOOL greenHitMissLeft;
@property (nonatomic) BOOL greenHitMissRight;
@property (nonatomic) int holeNumber;
@property (strong, nonatomic) NSString *currentParOfHole;
@property (nonatomic) int penaltyStrokes;
@property (nonatomic) BOOL successfulSandSaveWORKPLEASE;
@property (strong, nonatomic) NSString *roundDate;
@property (nonatomic) int totalPutts;
@property (nonatomic) BOOL successScramble;
@property (nonatomic) BOOL failScramble;
@property (nonatomic) BOOL successBogeyScramble;
@property (nonatomic) BOOL failBogeyScrabmle;

@property (strong, nonatomic) NSString *passRoundDate;

@property (nonatomic) NSInteger howManyHoles;

@property (weak, nonatomic) NSString *lastHoleShotTotal;
@property (weak, nonatomic) NSString *lastHolePuttTotal;
@property (weak, nonatomic) NSString *lastHoleGIR;
@property (weak, nonatomic) NSString *lastHoleFairwayHitorMiss;
@property (weak, nonatomic) NSString *lastHoleSandSave;
@property (weak, nonatomic) NSString *lastHoleScamble;
@property (weak, nonatomic) NSString *lastHoleBogeyScramble;





@end
