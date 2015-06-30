//
//  GroupViewController.m
//  Demo
//
//  Created by Kenny on 2015/6/23.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "GroupViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
#import "GroupModel.h"


@interface GroupViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"群組%ld", (long)indexPath.row + 1];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupModel *model = [GroupModel sharedInstance];
    MainViewController *mainViewController = [[MainViewController alloc] init];
    
    switch (indexPath.row) {
        case 0:
            mainViewController.dataArray = model.group1;
            mainViewController.title = @"群組1";
            break;
        case 1:
            mainViewController.dataArray = model.group2;
            mainViewController.title = @"群組2";
            break;
        case 2:
            mainViewController.dataArray = model.group3;
            mainViewController.title = @"群組3";
            break;
        case 3:
            mainViewController.dataArray = model.group4;
            mainViewController.title = @"群組4";
            break;
        case 4:
            mainViewController.dataArray = model.group5;
            mainViewController.title = @"群組5";
            break;
    }
    [self.navigationController pushViewController:mainViewController animated:YES];
}

@end
