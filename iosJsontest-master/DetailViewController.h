//
//  DetailViewController.h
//  provajson
//
//  Created by pierangelo on 09/05/15.
//  Copyright (c) 2015 pierangelo. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;

@property (weak, nonatomic) NSMutableArray *setTitle;


@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end
