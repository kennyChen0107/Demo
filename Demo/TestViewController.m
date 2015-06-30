//
//  TestViewController.m
//  Demo
//
//  Created by Kenny on 2015/6/23.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TestViewController

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

-(void)viewDidLayoutSubviews
{
    NSDictionary *layoutDict = NSDictionaryOfVariableBindings(_mainTableView, _drawView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_drawView(230)][_mainTableView]|" options:NSLayoutFormatAlignAllRight | NSLayoutFormatAlignAllLeft metrics:nil views:layoutDict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_mainTableView]|" options:0 metrics:nil views:layoutDict]];
    
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
