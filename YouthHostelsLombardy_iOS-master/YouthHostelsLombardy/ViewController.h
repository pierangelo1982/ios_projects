//
//  ViewController.h
//  YouthHostelsLombardy
//
//  Created by pierangelo on 16/05/15.
//  Copyright (c) 2015 pierangelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableData;

@end

