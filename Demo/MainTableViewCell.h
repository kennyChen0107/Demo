//
//  MainTableViewCell.h
//  Demo
//
//  Created by Kenny on 2015/6/17.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol scrollDelegate <NSObject>
-(void)allScroll:(double)contentoffset;
@end

@interface MainTableViewCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak) id<scrollDelegate> scrollDelegate;
@end
