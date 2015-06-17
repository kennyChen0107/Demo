//
//  MainHeaderView.h
//  Demo
//
//  Created by Kenny on 2015/6/17.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainHeaderView : UIView
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UIScrollView *scrollView;
-(instancetype)initWithFrame:(CGRect)frame contextArray:(NSMutableArray *)array;
@end
