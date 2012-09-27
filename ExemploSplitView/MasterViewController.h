//
//  MasterViewController.h
//  ExemploSplitView
//
//  Created by Rafael Brigagão Paulino on 27/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
