//
//  MasterViewController.h
//  BookShelf
//
//  Created by Duc Nguyen on 5/15/14.
//  Copyright (c) 2014 Duc Nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQGridView.h"

@interface MasterViewController : UIViewController<AQGridViewDataSource, AQGridViewDelegate>
@property (weak, nonatomic) IBOutlet AQGridView *gridView;

@end
