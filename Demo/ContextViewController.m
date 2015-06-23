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
#define RANGE 20
@interface ContextViewController ()<UIScrollViewDelegate>
{
    double touch1;
    double touch2;
    CGRect scrollBtnFrame;
    ScrollType scrollType;
}
@end

@implementation ContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    scrollType = NormalScrollView;
    // Do any additional setup after loading the view from its nib.
    _topPageControl.currentPage = 0;
    _topPageControl.numberOfPages = 5;
    
    _bottomPageControl.currentPage = 0;
    _bottomPageControl.numberOfPages = 5;
    
    [_topScrollView setContentSize:CGSizeMake(SCREEN_WIDTH * 5, 0)];
    [_bottomScrollView setContentSize:CGSizeMake(SCREEN_WIDTH * 5, 0)];
    
    
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
    
    _scrollBtn.backgroundColor = [UIColor grayColor];
    scrollBtnFrame = _scrollBtn.frame;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    _scrollBtn.userInteractionEnabled = YES;
    [_scrollBtn addGestureRecognizer:panGesture];
    
    UITapGestureRecognizer *topTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topTapGesture:)];
    _topScrollView.userInteractionEnabled = YES;
    [_topScrollView addGestureRecognizer:topTapGesture];
    topTapGesture.numberOfTapsRequired = 2;
    
    UITapGestureRecognizer *bottomTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bottomTapGesture:)];
    _bottomScrollView.userInteractionEnabled = YES;
    [_bottomScrollView addGestureRecognizer:bottomTapGesture];
    bottomTapGesture.numberOfTapsRequired = 2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
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

-(void)bottomTapGesture:(UITapGestureRecognizer *)gesture
{
    [UIView animateWithDuration:0.25 animations:^{
        if(scrollType == NormalScrollView){
            [_scrollBtn setFrame:CGRectMake(_scrollBtn.frame.origin.x,  _topScrollView.frame.origin.y - RANGE, _scrollBtn.frame.size.width, _scrollBtn.frame.size.height)];
            [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, 0)];
            [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _topScrollView.frame.origin.y, _bottomScrollView.frame.size.width, _bottomPageControl.frame.origin.y - _topScrollView.frame.origin.y)];
            scrollType = FullBottomScrollView;
        }else{
            [_scrollBtn setFrame:scrollBtnFrame];
            [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, _scrollBtn.frame.origin.y - _topScrollView.frame.origin.y)];
            [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _topScrollView.frame.origin.y + _topScrollView.frame.size.height + RANGE, _bottomScrollView.frame.size.width, _topScrollView.frame.size.height)];
            scrollType = NormalScrollView;
        }
    }];
}

-(void)topTapGesture:(UITapGestureRecognizer *)gesture
{
    [UIView animateWithDuration:0.25 animations:^{
        if(scrollType == NormalScrollView){
            [_scrollBtn setFrame:CGRectMake(_scrollBtn.frame.origin.x, _bottomPageControl.frame.origin.y, _scrollBtn.frame.size.width, _scrollBtn.frame.size.height)];
            [_topScrollView setFrame:CGRectMake(_scrollBtn.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, _scrollBtn.frame.origin.y - _topPageControl.frame.origin.y)];
            [_bottomScrollView setFrame:CGRectMake(_scrollBtn.frame.origin.x, _bottomPageControl.frame.origin.y, _scrollBtn.frame.size.width, 0)];
            scrollType = FullTopScrollView;
        }else{
            [_scrollBtn setFrame:scrollBtnFrame];
            [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, _scrollBtn.frame.origin.y - _topScrollView.frame.origin.y)];
            [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _topScrollView.frame.origin.y + _topScrollView.frame.size.height + RANGE, _bottomScrollView.frame.size.width, _topScrollView.frame.size.height)];
            scrollType = NormalScrollView;
        }
    }];
}

-(void)handlePanGesture:(UIPanGestureRecognizer *)gesture
{
    switch ((NSInteger)gesture.state) {
        case 1:
            touch1 = [gesture translationInView:self.view].y;
            break;
        case 2:
            touch2 = [gesture translationInView:self.view].y;
            if(_scrollBtn.frame.origin.y + (touch2 - touch1) < _topPageControl.frame.origin.y){
                [_scrollBtn setFrame:CGRectMake(_scrollBtn.frame.origin.x, _topPageControl.frame.origin.y, _scrollBtn.frame.size.width, _scrollBtn.frame.size.height)];
                [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, 0)];
                [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _topScrollView.frame.origin.y, _bottomScrollView.frame.size.width, _bottomPageControl.frame.origin.y - _topScrollView.frame.origin.y)];
                return;
            }
            if(_scrollBtn.frame.origin.y + (touch2 - touch1) > _bottomPageControl.frame.origin.y){
                [_scrollBtn setFrame:CGRectMake(_scrollBtn.frame.origin.x, _bottomPageControl.frame.origin.y, _scrollBtn.frame.size.width, _scrollBtn.frame.size.height)];
                
                [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, _scrollBtn.frame.origin.y - _topPageControl.frame.origin.y)];
                [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _bottomPageControl.frame.origin.y, _bottomScrollView.frame.size.width, 0)];
                return;
            }
            
            [_scrollBtn setFrame:CGRectMake(_scrollBtn.frame.origin.x, _scrollBtn.frame.origin.y + (touch2 - touch1), _scrollBtn.frame.size.width, _scrollBtn.frame.size.height)];
            
            if(_scrollBtn.frame.origin.y < _topPageControl.frame.origin.y + _topPageControl.frame.size.height){
                [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y , _topScrollView.frame.size.width, 0)];
            }else{
               [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y , _topScrollView.frame.size.width, _topScrollView.frame.size.height + (touch2 - touch1))];
            }
            
            if(_scrollBtn.frame.origin.y + _scrollBtn.frame.size.height > _bottomPageControl.frame.origin.y ){
                [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _bottomPageControl.frame.origin.y, _bottomScrollView.frame.size.width, 0)];
                
            }else{
                [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _scrollBtn.frame.origin.y + _scrollBtn.frame.size.height, _bottomScrollView.frame.size.width, _bottomPageControl.frame.origin.y - (_scrollBtn.frame.origin.y + _scrollBtn.frame.size.height))];
            }
            
            touch1 = touch2;
            break;
        case 3:
            [UIView animateWithDuration:0.25 animations:^{
                if(_scrollBtn.frame.origin.y > scrollBtnFrame.origin.y + (SCREEN_HEIGHT - 150 - 45) / 4){
                    [_scrollBtn setFrame:CGRectMake(_scrollBtn.frame.origin.x, _bottomPageControl.frame.origin.y, _scrollBtn.frame.size.width, _scrollBtn.frame.size.height)];
                    [_topScrollView setFrame:CGRectMake(_scrollBtn.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, _scrollBtn.frame.origin.y - _topPageControl.frame.origin.y)];
                    [_bottomScrollView setFrame:CGRectMake(_scrollBtn.frame.origin.x, _bottomPageControl.frame.origin.y, _scrollBtn.frame.size.width, 0)];
                    scrollType = FullTopScrollView;
                }else if(_scrollBtn.frame.origin.y < scrollBtnFrame.origin.y - (SCREEN_HEIGHT - 150 - 45) / 4){
                    [_scrollBtn setFrame:CGRectMake(_scrollBtn.frame.origin.x,  _topScrollView.frame.origin.y - RANGE, _scrollBtn.frame.size.width, _scrollBtn.frame.size.height)];
                    [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, 0)];
                    [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _topScrollView.frame.origin.y, _bottomScrollView.frame.size.width, _bottomPageControl.frame.origin.y - _topScrollView.frame.origin.y)];
                    scrollType = FullBottomScrollView;
                }else{
                    [_scrollBtn setFrame:scrollBtnFrame];
                    [_topScrollView setFrame:CGRectMake(_topScrollView.frame.origin.x, _topScrollView.frame.origin.y, _topScrollView.frame.size.width, _scrollBtn.frame.origin.y - _topScrollView.frame.origin.y)];
                    [_bottomScrollView setFrame:CGRectMake(_bottomScrollView.frame.origin.x, _topScrollView.frame.origin.y + _topScrollView.frame.size.height + RANGE, _bottomScrollView.frame.size.width, _topScrollView.frame.size.height)];
                    scrollType = NormalScrollView;
                }
            }];
            break;
    }
}


@end
