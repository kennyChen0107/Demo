//
//  ContextViewController.h
//  Demo
//
//  Created by Kenny on 2015/6/17.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContextViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *bottomScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *topPageControl;
@property (weak, nonatomic) IBOutlet UIPageControl *bottomPageControl;
@end
