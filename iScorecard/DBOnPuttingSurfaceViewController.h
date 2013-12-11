//
//  DBOnPuttingSurfaceViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DBOnPuttingSurfaceViewController : UIViewController <UIAlertViewDelegate>

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


@end
