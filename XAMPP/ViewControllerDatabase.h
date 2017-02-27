//
//  ViewControllerDatabase.h
//  XAMPP
//
//  Created by chaitanya on 12/10/16.
//  Copyright © 2016 chaitanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

#define kGETUrl @"http://localhost/json.php"


@interface ViewControllerDatabase : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *getjson;

@property(strong,nonatomic)NSArray *userId;
@property(strong,nonatomic)NSArray *userName;

@property(strong,nonatomic)NSArray *userMsg;


@end
