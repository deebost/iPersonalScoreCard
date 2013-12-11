//
//  DBGolfLogic.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/11/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBGolfLogic : NSObject

- (void) sandSaveLogicTwo:(NSNumber *)parOfHole totalShotsTaken:(NSNumber *)shotsTake sandSaveIsPossible:(BOOL)sandSavePossible;
- (void) failedBogeyScrambleLogic:(NSNumber *) parOfHole totalShots:(NSNumber *)shotTotal greenInReg:(BOOL)gir;
- (void) bogeyscrambleLogic:(NSNumber *)parOfHole totalShots:(NSNumber *)shotTotal greenInReg:(BOOL)gir;
- (void) failScrambleLogic:(NSNumber *)parOfHole totalShots:(NSNumber *)shotTotal greenInreg:(BOOL)gir;
- (void) scrambleLogic:(NSNumber *)parOfHole totalShots:(NSNumber *)shotTotal greenInReg:(BOOL)gir;
- (void) totalShotsToFigureOutGir:(NSNumber *) shotTotal par:(NSNumber *)parOfHole;


@property (nonatomic) BOOL successOnSandSave;
@property (nonatomic) BOOL scrambleYES;
@property (nonatomic) BOOL scrambleNO;
@property (nonatomic) BOOL bogeyScrambleYES;
@property (nonatomic) BOOL bogeyScrambleNO;
@property (nonatomic) BOOL greenInRegulation;


@end
