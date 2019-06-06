//
//  CustomAlertCenter.m
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CustomAlertCenter.h"
#import "CAMaskView.h"
#import "CAlertView.h"

#define SCREENHEIGH [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

@implementation CustomAlertCenter

+(CustomAlertCenter *)shareCustomAlertCenter;
{
    static CustomAlertCenter *caCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        caCenter = [[CustomAlertCenter alloc] init];
        
    });
    return caCenter;
}

-(void)showCustomAlertWithBlock:(CABlock)block;
{
    CAConfigurationModel *model = [[CAConfigurationModel alloc] init];
    block(model);
    CAlertView *CAView = [CAlertView CreateCAViewWithModel:model];
    
    
    if (model.isNeedCAMaskView) {
        //需要蒙版
        CAMaskView *maskV = [[CAMaskView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [[self mainWindow] addSubview:maskV];
        [maskV addSubview:CAView];
    }else{
        //不需要蒙版
        [[self mainWindow] addSubview:CAView];
    }
    
    
    
    //设置动画
    CABasicAnimation *moveAnimation;
    switch (model.CAVAType) {
        case CAViewAnimationTypeDown:
        {
            moveAnimation  = [CABasicAnimation animationWithKeyPath:@"position.y"];
            moveAnimation.fromValue = @(CAView.bounds.size.height/2 + SCREENHEIGH);
            moveAnimation.toValue = @(CAView.center.y);
        }
            break;
        case CAViewAnimationTypeUp:
        {
            moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
            moveAnimation.fromValue = @(-CAView.bounds.size.height/2);
            moveAnimation.toValue = @(CAView.center.y);
        }
            break;
        case CAViewAnimationTypeLeft:
        {
            moveAnimation  = [CABasicAnimation animationWithKeyPath:@"position.x"];
            moveAnimation.fromValue = @(-CAView.bounds.size.width/2);
            moveAnimation.toValue = @(CAView.center.x);
        }
            break;
        case CAViewAnimationTypeRight:
        {
            moveAnimation  = [CABasicAnimation animationWithKeyPath:@"position.x"];
            moveAnimation.fromValue = @(CAView.bounds.size.width/2 + SCREENWIDTH);
            moveAnimation.toValue = @(CAView.center.x);
        }
            break;
        case CAViewAnimationTypeCenter:
        {
            moveAnimation  = [CABasicAnimation animationWithKeyPath:@"bounds"];
            moveAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 1, 1)];
            moveAnimation.toValue = [NSValue valueWithCGRect:CAView.bounds];
        }
            break;
        default:
            break;
    }
    
    moveAnimation.duration = 0.5;//动画时间
    
    //一个时间函数，表示它以怎么样的时间运行
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    moveAnimation.repeatCount = HUGE_VALF;
    moveAnimation.repeatDuration = 0.5;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.fillMode = kCAFillModeForwards;
    //添加动画，后面有可以拿到这个动画的标识
    [CAView.layer addAnimation:moveAnimation forKey:@"CAView_Key"];
}

//获取当前window
-(UIWindow *)mainWindow;
{
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app.delegate respondsToSelector:@selector(window)]){
        
        return [app.delegate window];
        
    }else{
        return [app keyWindow];
    }
}

@end
