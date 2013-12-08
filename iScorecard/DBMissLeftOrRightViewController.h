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

@end
