//
//  ViewController.h
//  provajson
//
//  Created by pierangelo on 11/04/15.
//  Copyright (c) 2015 pierangelo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    ///IBOutlet UITableView *tableData;
}

@property (weak, nonatomic) UITableView *tableData;


@end

