//
//  MainHeaderView.m
//  Demo
//
//  Created by Kenny on 2015/6/17.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "MainHeaderView.h"

@implementation MainHeaderView

-(instancetype)initWithFrame:(CGRect)frame contextArray:(NSMutableArray *)array
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor yellowColor];
        self.title = [[UILabel alloc] init];
        _title.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_title];
        
        self.scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_scrollView];
        
        for(int i = 0; i < [array count]; i++){
            UILabel *context = [[UILabel alloc] initWithFrame:CGRectMake(80 * i + i * 10, 0, 80, 35)];
            context.text = [array objectAtIndex:i];
            [_scrollView addSubview:context];
        }
        
        [self updateConstraintsIfNeeded];
    }
    
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    NSDictionary *layoutDict = NSDictionaryOfVariableBindings(_title, _scrollView);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_title(100)]-10-[_scrollView]|" options:0 metrics:nil views:layoutDict]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_title]|" options:0 metrics:nil views:layoutDict]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:0 metrics:nil views:layoutDict]];
}

@end
