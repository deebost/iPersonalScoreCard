//
//  DBOnPuttingSurfaceViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DBOnPuttingSurfaceViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) NSString *passRoundDate;

@property (nonatomic) int totalShotsTaken;
@property (nonatomic) BOOL gir;
@property (nonatomic) BOOL scramble;
@property (nonatomic) int totalPenaltyStrokes;
@property(nonatomic) BOOL finalFairwayHit;
@property(nonatomic) BOOL finalMissRight;
@property(nonatomic) BOOL finalMissLeft;
@property(nonatomic) BOOL sandSavePossibility;
@property(nonatomic) BOOL successfulSandSave;
@property(nonatomic) BOOL failedScramble;
@property(nonatomic) BOOL successfulScramble;
@property(nonatomic) int totalPutts;
@property (nonatomic) int holeNumber;
@property (strong, nonatomic) NSString *currentParOfHole;
@property(nonatomic) BOOL failedBogeyScramble;
@property(nonatomic) BOOL successfulBogeyScramble;
@property (strong, nonatomic) NSString *roundDate;

@property (nonatomic) NSInteger howManyHoles;

@property (weak, nonatomic) NSString *lastHoleShotTotal;
@property (weak, nonatomic) NSString *lastHolePuttTotal;
@property (weak, nonatomic) NSString *lastHoleGIR;
@property (weak, nonatomic) NSString *lastHoleFairwayHitorMiss;
@property (weak, nonatomic) NSString *lastHoleSandSave;
@property (weak, nonatomic) NSString *lastHoleScamble;
@property (weak, nonatomic) NSString *lastHoleBogeyScramble;


@end
