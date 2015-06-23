//
//  MainViewController.h
//  
//
//  Created by Kenny on 2015/6/16.
//
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *mainTableview;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
