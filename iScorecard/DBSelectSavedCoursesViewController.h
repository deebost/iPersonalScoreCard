//
//  DBSelectSavedCoursesViewController.h
//  iScorecard
//
//  Created by Daniel Bostjancic on 12/11/13.
//  Copyright (c) 2013 deebost. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBSelectSavedCoursesViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *passRoundDate;

@end
