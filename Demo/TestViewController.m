//
//  TestViewController.m
//  Demo
//
//  Created by Kenny on 2015/6/23.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    ContextViewController *contextViewController;
    NSMutableArray *layoutConstraints;
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
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = @"12345";
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

@end
