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
@end

