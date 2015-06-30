//
//  GroupModel.h
//  Demo
//
//  Created by Kenny on 2015/6/30.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject
@property (nonatomic, strong)NSMutableArray *group1;
@property (nonatomic, strong)NSMutableArray *group2;
@property (nonatomic, strong)NSMutableArray *group3;
@property (nonatomic, strong)NSMutableArray *group4;
@property (nonatomic, strong)NSMutableArray *group5;
+ (instancetype)sharedInstance;
@end
