//
//  DBFairwayHitViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/6/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBFairwayHitViewController : UIViewController
@property(nonatomic) int shotTotalForHole;
@property(nonatomic) BOOL isFirstSwing;
@property(nonatomic) BOOL fairwayHit;
@property(nonatomic) BOOL missRight;
@property(nonatomic) BOOL missLeft;
@property(nonatomic) BOOL greensInRegulation;

@end

