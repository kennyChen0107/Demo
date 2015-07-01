//
//  TestViewController.h
//  Demo
//
//  Created by Kenny on 2015/6/23.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestView.h"
#import "ContextViewController.h"

@interface TestViewController : UIViewController
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) TestView *drawView;
-(instancetype)initWithController:(ContextViewController *)controller;
@end
