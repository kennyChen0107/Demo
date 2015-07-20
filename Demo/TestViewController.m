//
//  TestViewController.m
//  Demo
//
//  Created by Kenny on 2015/6/23.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "TestViewController.h"
#import "MainHeaderView.h"
#import "MainTableViewCell.h"

@interface TestViewController ()<UITableViewDataSource, UITableViewDelegate, headerDelegate, scrollDelegate>
{
    double scrollX;
    ContextViewController *contextViewController;
    NSMutableArray *layoutConstraints;
    MainHeaderView *headerView;
    NSMutableArray *headerTitle;
}
@end

@implementation TestViewController


-(instancetype)initWithController:(ContextViewController *)controller
{
    self = [super init];
    if(self){
        contextViewController = controller;
        layoutConstraints = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeaderView];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    _mainTableView.delegate = nil;
    [super viewWillDisappear:animated];
}

-(void)initHeaderView
{
    headerTitle = [[NSMutableArray alloc] initWithObjects:@"第一項", @"第二項", @"第三項", @"第四項", @"第五項", @"第六項", @"第七項", @"第八項", @"第九項", @"第十項", nil];
    headerView = [[MainHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44) contextArray:headerTitle];
    headerView.title.text = @"項目";
    headerView.title.textColor = [UIColor whiteColor];
    headerView.headerDelegate = self;
}

-(void)initView
{
    self.mainTableView = [[UITableView alloc] init];
    _mainTableView.translatesAutoresizingMaskIntoConstraints = NO;
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.backgroundColor= [UIColor blackColor];
    [self.view addSubview:_mainTableView];
    
    self.drawView = [[TestView alloc] initWithColor:self.color];
    _drawView.backgroundColor = [UIColor blackColor];
    _drawView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_drawView];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    [self.view removeConstraints:layoutConstraints];
    [layoutConstraints removeAllObjects];
    NSDictionary *layoutDict = NSDictionaryOfVariableBindings(_mainTableView, _drawView);
    if(contextViewController.scrollType == FullBottomScrollView || contextViewController.scrollType == FullTopScrollView){
        [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_drawView][_mainTableView(==_drawView)]|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:nil views:layoutDict]];
        [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_mainTableView]|" options:0 metrics:nil views:layoutDict]];
    }else{
        [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_drawView][_mainTableView(0)]|" options:0 metrics:nil views:layoutDict]];
        [layoutConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_drawView]|" options:0 metrics:nil views:layoutDict]];
    }
    [self.view addConstraints:layoutConstraints];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainIdentifier"];
    if(cell == nil){
        [tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainIdentifier"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MainIdentifier"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    [cell.collectionView setContentOffset:CGPointMake(scrollX, 0)];
    cell.scrollDelegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return headerView;
}

-(void)didSelectItem
{
    NSLog(@"selectItem");
}

-(void)allScroll:(double)contentoffset
{
    NSArray *cells = _mainTableView.visibleCells;
    for(MainTableViewCell *cell in cells){
        [cell.collectionView setContentOffset:CGPointMake(contentoffset, 0)];
        scrollX = contentoffset;
        [headerView.collectionView setContentOffset:CGPointMake(contentoffset, 0)];
    }
}

-(void)headerScroll:(double)contentoffset
{
    [self allScroll:contentoffset];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([scrollView isEqual:headerView.collectionView]){
        [self allScroll:scrollView.contentOffset.x];
    }
}

@end
