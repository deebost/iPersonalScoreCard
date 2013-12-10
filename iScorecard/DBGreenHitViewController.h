//
//  DBGreenHitViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBFairwayHitViewController.h"

@interface DBGreenHitViewController : UIViewController
@property (nonatomic) int totalShotsTaken;
@property (nonatomic) BOOL gir;
@property (nonatomic) BOOL sandSaveOpportunity;
@property (nonatomic) BOOL greenHitFairwayHit;
@property (nonatomic) BOOL greenHitMissLeft;
@property (nonatomic) BOOL greenHitMissRight;
@property (nonatomic) int holeNumber;
@property (strong, nonatomic) NSString *currentParOfHole;
@property (nonatomic) int penaltyStrokes;




@end
