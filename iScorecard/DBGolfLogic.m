//
//  DBGolfLogic.m
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/11/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import "DBGolfLogic.h"

@implementation DBGolfLogic

- (void) sandSaveLogicTwo:(NSNumber *)parOfHole totalShotsTaken:(NSNumber *)shotsTake sandSaveIsPossible:(BOOL)sandSavePossible   {

    if (parOfHole.integerValue == 3 && shotsTake.integerValue <=3 && sandSavePossible == YES) {

        _successOnSandSave = YES;
    } else if (parOfHole.integerValue == 4 && shotsTake.integerValue < 5 && sandSavePossible == YES ){

        _successOnSandSave = YES;
    } else if (parOfHole.integerValue == 5 && shotsTake.integerValue <= 5 && sandSavePossible == YES) {
        _successOnSandSave = YES;
    }

}

- (void) scrambleLogic:(NSNumber *)parOfHole totalShots:(NSNumber *)shotTotal greenInReg:(BOOL)gir {
    if (parOfHole.integerValue == 3 && gir == NO && shotTotal.integerValue <=3) {
        _scrambleYES = YES;
    } else     if (parOfHole.integerValue == 4 && gir == NO && shotTotal.integerValue <=4) {
        _scrambleYES = YES;
    } else     if (parOfHole.integerValue == 5 && gir == NO && shotTotal.integerValue <=5) {
        _scrambleYES = YES;
    }
}

- (void) failScrambleLogic:(NSNumber *)parOfHole totalShots:(NSNumber *)shotTotal greenInreg:(BOOL)gir {
    if (parOfHole.integerValue == 3 && gir == NO && shotTotal.integerValue  > 3) {
        _scrambleNO = YES;
    } else     if (parOfHole.integerValue == 4 && gir == NO && shotTotal.integerValue  > 4) {
        _scrambleNO = YES;
    } else     if (parOfHole.integerValue == 5 && gir == NO && shotTotal.integerValue  > 5) {
        _scrambleNO = YES;
    }
}

- (void) bogeyscrambleLogic:(NSNumber *)parOfHole totalShots:(NSNumber *)shotTotal greenInReg:(BOOL)gir {
    if (parOfHole.integerValue == 3 && gir == NO && shotTotal.integerValue ==4) {
        _bogeyScrambleYES = YES;
    } else     if (parOfHole.integerValue == 4 && gir == NO && shotTotal.integerValue ==5) {
        _bogeyScrambleYES = YES;
    } else     if (parOfHole.integerValue == 5 && gir == NO && shotTotal.integerValue ==6) {
        _bogeyScrambleYES = YES;
    }
}

- (void) failedBogeyScrambleLogic:(NSNumber *) parOfHole totalShots:(NSNumber *)shotTotal greenInReg:(BOOL)gir {
    if (parOfHole.integerValue == 3 && gir == NO && shotTotal.integerValue  > 4) {
        _bogeyScrambleNO = YES;
    } else     if (parOfHole.integerValue == 4 && gir == NO && shotTotal.integerValue > 5) {
        _bogeyScrambleNO = YES;
    } else     if (parOfHole.integerValue == 5 && gir == NO && shotTotal.integerValue > 6) {
        _bogeyScrambleNO = YES;
    }
}

- (void) totalShotsToFigureOutGir:(NSNumber *) shotTotal par:(NSNumber *)parOfHole {
    if (parOfHole.integerValue == 3 && shotTotal.integerValue < 2) {
        _greenInRegulation = YES;
    } else     if (parOfHole.integerValue == 4 && shotTotal.integerValue < 3) {
        _greenInRegulation = YES;
    } else     if (parOfHole.integerValue == 5 && shotTotal.integerValue < 4) {
        _greenInRegulation = YES;
    }
}

//- (void) scramblingLogic {
//    if (_currentParOfHole.integerValue == 3 && _gir == NO && _totalShotsTaken <= 3) {
//        _successfulScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 4 && _gir == NO && _totalShotsTaken <= 4) {
//        _successfulScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 5 && _gir == NO && _totalShotsTaken <= 5) {
//        _successfulScramble = YES;
//    }
//}
//
//- (void) failedTooScrambleLogic {
//    if (_currentParOfHole.integerValue == 3 && _gir == NO && _totalShotsTaken > 3) {
//        _failedScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 4 && _gir == NO && _totalShotsTaken > 4) {
//        _failedScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 5 && _gir == NO && _totalShotsTaken > 5) {
//        _failedScramble = YES;
//    }
//}
//
//- (void) bogeyScrambleLogic {
//    if (_currentParOfHole.integerValue == 3 && _totalPutts == 1 && _totalShotsTaken == 4 && _gir == NO) {
//        _successfulBogeyScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 4 && _totalPutts == 1 && _totalShotsTaken == 5 && _gir == NO) {
//        _successfulBogeyScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 5 && _totalPutts == 1 && _totalShotsTaken == 6 && _gir == NO) {
//        _successfulBogeyScramble = YES;
//    }
//}
//
//- (void) failedToBogeyScramble{
//    if (_currentParOfHole.integerValue == 3 && _totalShotsTaken - _totalPutts == 3 && _gir == NO && _totalShotsTaken >= 5) {
//        _failedBogeyScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 4 && _totalShotsTaken - _totalPutts == 4 && _gir == NO && _totalShotsTaken >= 6) {
//        _failedBogeyScramble = YES;
//    } else     if (_currentParOfHole.integerValue == 5 && _totalShotsTaken - _totalPutts == 5 && _gir == NO && _totalShotsTaken >= 7) {
//        _failedBogeyScramble = YES;
//    }
//}

@end
