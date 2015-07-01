//
//  MainHeaderView.m
//  Demo
//
//  Created by Kenny on 2015/6/17.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "MainHeaderView.h"
#import "LabelCollectionViewCell.h"

@implementation MainHeaderView

-(instancetype)initWithFrame:(CGRect)frame contextArray:(NSMutableArray *)array
{
    self = [super initWithFrame:frame];
    if(self){
        layoutConstraints = [[NSMutableArray alloc] init];
        self.titleArray = array;
        
        self.backgroundColor = [UIColor darkGrayColor];
        self.title = [[UILabel alloc] init];
        _title.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_title];
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44) collectionViewLayout:flowLayout];
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"LabelCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LabelIdentifier"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor darkGrayColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_collectionView];

        [self updateConstraintsIfNeeded];
    }
    
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    [self removeConstraints:layoutConstraints];
    [layoutConstraints removeAllObjects];
    
    NSDictionary *layoutDict = NSDictionaryOfVariableBindings(_title, _collectionView);
    [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_title(60)]-10-[_collectionView]|" options:0 metrics:nil views:layoutDict]];
    [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_title]|" options:0 metrics:nil views:layoutDict]];
    [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:nil views:layoutDict]];
    
    [self addConstraints:layoutConstraints];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 35);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LabelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LabelIdentifier" forIndexPath:indexPath];
    cell.context.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor darkGrayColor];
    cell.context.text = [_titleArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_headerDelegate headerScroll:scrollView.contentOffset.x];
}
@end
