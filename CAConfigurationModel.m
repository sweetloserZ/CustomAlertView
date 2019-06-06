//
//  CAConfigurationModel.m
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CAConfigurationModel.h"

#define CAMAX_HIGHT ([UIScreen mainScreen].bounds.size.height)
#define  CL_WIDTH 300


@implementation CAConfigurationModel
-(instancetype)init;
{
    self = [super init];
    if (self) {
        
        _msgModel = [[CAConfigurationMsgModel alloc] init];
        _titleModel = [[CAConfigurationTitleModel alloc] init];
        _CLMaxHight = CAMAX_HIGHT;
        _CLWidth = CL_WIDTH;
        _isNeedCAMaskView = YES;
        _actionModelArr = [NSMutableArray arrayWithCapacity:1];
    }
    return self;
}

@end

@implementation CAConfigurationMsgModel

-(instancetype)init;
{
    self = [super init];
    if (self) {
        _msg = @"请设置提示信息信息信息信息信息信息信息信息信息信息信息";
        _msgColor = [UIColor lightGrayColor];
        _msgFontSize = 18.0;
        _msgBackgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end


@implementation CAConfigurationTitleModel

-(instancetype)init;
{
    self = [super init];
    if (self) {
        _title = @"提示";
        _titleColor = [UIColor blackColor];
        _titleFontSize = 25.0;
        _titleBackgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end


@implementation CAConfigurationButtonModel

-(instancetype)init;
{
    self = [super init];
    if (self) {
        _actionText = @"确定";
        _actionTextColor = [UIColor blackColor];
        _actionTextFontSize = 20;
        _actionTextBackgroundColor = [UIColor whiteColor];
        
        _actionBlock = ^(CAConfigurationModel *model){
            model.titleModel.title = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
            
            NSLog(@"aaadasdasdasfafasfasfasd");
        };
    }
    return self;
}

@end
