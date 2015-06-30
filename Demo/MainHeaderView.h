//
//  MainHeaderView.h
//  Demo
//
//  Created by Kenny on 2015/6/17.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol headerDelegate <NSObject>
-(void)headerScroll:(double)contentoffset;
@end

@interface MainHeaderView : UIView<UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *titleArray;
-(instancetype)initWithFrame:(CGRect)frame contextArray:(NSMutableArray *)array;
@property (weak) id<headerDelegate> headerDelegate;
@end
