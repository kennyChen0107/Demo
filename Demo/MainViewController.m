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

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, scrollDelegate, UICollectionViewDelegate>
{
    double scrollX;
    MainHeaderView *headerView;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *a = [[NSMutableArray alloc] init];
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
    headerView.scrollView.delegate = self;
    
    _mainTableview.delegate = self;
    _mainTableview.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
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
    cell.title.text = @"項目名稱";
    [cell.collectionView setContentOffset:CGPointMake(scrollX, 0)];
    cell.scrollDelegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return headerView;
}


-(void)allScroll:(double)contentoffset
{
    NSArray *cells = _mainTableview.visibleCells;
    for(MainTableViewCell *cell in cells){
        [cell.collectionView setContentOffset:CGPointMake(contentoffset, 0)];
        scrollX = contentoffset;
        [headerView.scrollView setContentOffset:CGPointMake(contentoffset, 0)];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([scrollView isEqual:headerView.scrollView]){
        NSArray *cells = _mainTableview.visibleCells;
        for(MainTableViewCell *cell in cells){
            [cell.collectionView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0)];
            scrollX = scrollView.contentOffset.x;
        }
    }
}
@end
