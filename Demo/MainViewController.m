//
//  MainViewController.m
//  
//
//  Created by Kenny on 2015/6/16.
//
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "MainHeaderView.h"
#import "ContextViewController.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, scrollDelegate, UICollectionViewDelegate, headerDelegate>
{
    double scrollX;
    MainHeaderView *headerView;
    NSMutableArray *a;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    a = [[NSMutableArray alloc] init];
    [a addObject:@"第一項"];
    [a addObject:@"第二項"];
    [a addObject:@"第三項"];
    [a addObject:@"第四項"];
    [a addObject:@"第五項"];
    [a addObject:@"第六項"];
    [a addObject:@"第七項"];
    [a addObject:@"第八項"];
    [a addObject:@"第九項"];
    [a addObject:@"第十項"];
    headerView = [[MainHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44) contextArray:a];
    headerView.title.text = @"項目";
    headerView.title.textColor = [UIColor whiteColor];
    headerView.headerDelegate = self;
    _mainTableview.tableHeaderView = headerView;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainIdentifier"];
    if(cell == nil){
        [tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainIdentifier"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MainIdentifier"];
    }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.title.text = [_dataArray objectAtIndex:indexPath.row];
        [cell.collectionView setContentOffset:CGPointMake(scrollX, 0)];
        cell.scrollDelegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 44.0f;
//}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return _collectionView;
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[ContextViewController alloc]init] animated:YES];
}

-(void)didSelectItem
{
    [self.navigationController pushViewController:[[ContextViewController alloc]init] animated:YES];
}

-(void)allScroll:(double)contentoffset
{
    NSArray *cells = _mainTableview.visibleCells;
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

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if([scrollView isEqual:headerView.scrollView]){
//        [self allScroll:scrollView.contentOffset.x];
//    }
//}
@end
