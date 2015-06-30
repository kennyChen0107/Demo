//
//  GroupModel.m
//  Demo
//
//  Created by Kenny on 2015/6/30.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "GroupModel.h"

@implementation GroupModel
+ (instancetype)sharedInstance
{
    static GroupModel *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GroupModel alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    if(self){
        _group1 = [[NSMutableArray alloc] initWithObjects:@"鴻海", @"台股", @"中華電", @"台泥", @"中鋼", @"裕隆", @"晶華", @"友達", @"加權指", @"宏碁", @"技嘉", @"微星", @"廣達", nil];
        _group2 = [[NSMutableArray alloc] initWithObjects:@"元大金", @"中信金", @"開發金", @"可成", @"聯發科", @"大立光", @"友達", @"鴻海", @"技嘉", @"微星", @"廣達", nil];
        _group3 = [[NSMutableArray alloc] initWithObjects:@"華新", @"富邦金", @"大立光", @"國泰金", @"台新金", @"新日光", @"長榮航", @"矽品", @"陽明", @"技嘉", @"微星", @"廣達", nil];
        _group4 = [[NSMutableArray alloc] initWithObjects:@"亞太電", @"兆豐金", @"宜進", @"南帝", @"全新", @"統一", @"零壹", @"得力", @"金像電", @"日月光", nil];
        _group5 = [[NSMutableArray alloc] initWithObjects:@"台達電", @"鴻海", @"仁寶", @"英業達", @"精英", @"宏碁", @"鴻準", @"華碩", @"藍天", @"倫飛", @"技嘉", @"微星", @"廣達", nil];
    }
    return self;
}
@end
