//
//  ContextViewController.m
//  Demo
//
//  Created by Kenny on 2015/6/17.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "ContextViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ContextViewController ()<UIScrollViewDelegate>

@end

@implementation ContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view from its nib.
    _topPageControl.currentPage = 0;
    _topPageControl.numberOfPages = 5;
    
    _bottomPageControl.currentPage = 0;
    _bottomPageControl.numberOfPages = 5;
    
    [_topScrollView setContentSize:CGSizeMake(SCREEN_WIDTH * 6, 0)];
    [_bottomScrollView setContentSize:CGSizeMake(SCREEN_WIDTH * 5, 0)];
    
    [_topScrollView setContentOffset:CGPointMake(SCREEN_WIDTH , 0)];
    [_bottomScrollView setContentOffset:CGPointMake(SCREEN_WIDTH , 0)];
    
    
    for(int i = 0; i < 5; i++){
        UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, _topScrollView.frame.size.height)];
        if(i == 0){
        }
        topLabel.textAlignment = NSTextAlignmentCenter;
        topLabel.text = [NSString stringWithFormat:@"%d", i];
        [_topScrollView addSubview:topLabel];
        
        UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, _bottomScrollView.frame.size.height)];
        bottomLabel.textAlignment = NSTextAlignmentCenter;
        bottomLabel.text = [NSString stringWithFormat:@"%d", i];
        [_bottomScrollView addSubview:bottomLabel];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = scrollView.frame.size.width;
    NSInteger currentPage = ((scrollView.contentOffset.x - width / 2) / width) + 1;
    if([scrollView isEqual:_topScrollView]){
        [_topPageControl setCurrentPage:currentPage];
    }else if([scrollView isEqual:_bottomScrollView]){
        [_bottomPageControl setCurrentPage:currentPage];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.topScrollView.contentOffset.x == 0) {
        [self.topScrollView scrollRectToVisible:CGRectMake(5 * SCREEN_WIDTH, 0, _topScrollView.frame.size.width, _topScrollView.frame.size.height) animated:NO];
    }
    else if(self.topScrollView.contentOffset.x == 6 * SCREEN_WIDTH) {
        [self.topScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH, 0, _topScrollView.frame.size.width, _topScrollView.frame.size.height) animated:NO];
    }

}


@end
