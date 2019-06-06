//
//  CAlertView.m
//  AlertV
//
//  Created by sweetloser on 2019/6/1.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CAlertView.h"
#import "CATitleLabel.h"
#import "CAMessageLabel.h"
#import "CAConfigurationModel.h"
#import "CAButton.h"

#define DIVLINEWIDTH 0.5

@interface CAlertView()
@property(strong,nonatomic)CAConfigurationModel *CAConfigmodel;
@end


@implementation CAlertView

+(CAlertView *)CreateCAViewWithModel:(CAConfigurationModel *)model;
{
    
    CATitleLabel *tLabel = [CATitleLabel CreateCATitleLabelWithWidth:model.CLWidth WithTitle:model.titleModel.title FontSize:model.titleModel.titleFontSize BackgroundColor:model.titleModel.titleBackgroundColor TitleColor:model.titleModel.titleColor];
    
    CAMessageLabel *msgLabel = [CAMessageLabel CreateMessageLabelWithWidth:model.CLWidth Message:model.msgModel.msg MsgFontSize:model.msgModel.msgFontSize MsgBackgroundColor:model.msgModel.msgBackgroundColor MsgColor:model.msgModel.msgColor];
    
    NSMutableArray *btArr = [NSMutableArray arrayWithCapacity:1];
    switch (model.actionModelArr.count) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            CAConfigurationButtonModel *btModel = [model.actionModelArr firstObject];
            CAButton *bt1 = [CAButton CreateCAButtonWithWidth:model.CLWidth WithText:btModel.actionText FontSize: btModel.actionTextFontSize BackgroundColor:btModel.actionTextBackgroundColor TextColor:btModel.actionTextColor];
            [btArr addObject:bt1];
        }
            break;
        case 2:
        {
            for (CAConfigurationButtonModel *btModel in model.actionModelArr) {
                CAButton *bt1 = [CAButton CreateCAButtonWithWidth:model.CLWidth/2 WithText:btModel.actionText FontSize: btModel.actionTextFontSize BackgroundColor:btModel.actionTextBackgroundColor TextColor:btModel.actionTextColor];
                [btArr addObject:bt1];
            }
        }
            break;
        default/* 3个button以上 */:
        {
            for (CAConfigurationButtonModel *btModel in model.actionModelArr) {
                CAButton *bt1 = [CAButton CreateCAButtonWithWidth:model.CLWidth WithText:btModel.actionText FontSize: btModel.actionTextFontSize BackgroundColor:btModel.actionTextBackgroundColor TextColor:btModel.actionTextColor];
                [btArr addObject:bt1];
            }
        }
            break;
    }
    
    //布局button
    CGFloat btHight = 0.0;
    CGFloat tLabelH = tLabel.bounds.size.height;
    CGFloat msgLabelH = msgLabel.bounds.size.height;
    
    
    if (btArr.count != 2) {
        for (int i=0; i<btArr.count; i++) {
            CAButton *bt = btArr[i];
            bt.tag = i;
            if (i==0) {
                [bt setFrame:CGRectMake(0, tLabelH+DIVLINEWIDTH+msgLabelH+DIVLINEWIDTH, bt.bounds.size.width, bt.bounds.size.height)];
            }else{
                CAButton *lastBt = ((CAButton *)btArr[i-1]);
                [bt setFrame:CGRectMake(0, lastBt.frame.origin.y+lastBt.bounds.size.height+DIVLINEWIDTH, bt.bounds.size.width, bt.bounds.size.height)];
            }
            
            btHight = btHight+bt.bounds.size.height+DIVLINEWIDTH;
            
        }
    }else{
        for (int i=0; i<btArr.count; i++) {
            CAButton *bt = btArr[i];
            bt.tag = i;
            [bt setFrame:CGRectMake(i*(bt.bounds.size.width+DIVLINEWIDTH), tLabelH+DIVLINEWIDTH+msgLabelH+DIVLINEWIDTH, bt.bounds.size.width-DIVLINEWIDTH/2, bt.bounds.size.height)];
        }
        btHight = btHight+((CAButton *)btArr[0]).bounds.size.height+DIVLINEWIDTH;
    }
    
    
    CGRect CAVRect = CGRectMake(0, 0, model.CLWidth, tLabel.bounds.size.height+msgLabel.bounds.size.height+DIVLINEWIDTH+btHight);
    CAlertView *CAView = [[CAlertView alloc] initWithFrame:CAVRect];
    
    CAView.CAConfigmodel = model;
    
    [tLabel setFrame:CGRectMake(0, 0, model.CLWidth, tLabel.frame.size.height)];
    [CAView addSubview:tLabel];
    
    
    [msgLabel setFrame:CGRectMake(0, tLabel.bounds.size.height+DIVLINEWIDTH, model.CLWidth, msgLabel.frame.size.height)];
    [CAView addSubview:msgLabel];
    
    for (CAButton *bt in btArr) {
        [CAView addSubview:bt];
        [bt addTarget:CAView action:@selector(CAButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return CAView;
}

//action的点击事件处理。
-(void)CAButtonAction:(CAButton *)sender;
{
     CAConfigurationButtonModel *btModel = [self.CAConfigmodel.actionModelArr objectAtIndex:sender.tag];
    btModel.actionBlock(self.CAConfigmodel);
    if (self.CAConfigmodel.isNeedCAMaskView) {
        [sender.superview.superview removeFromSuperview];
    }
    [sender.superview removeFromSuperview];
}

-(instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        self.backgroundColor = [UIColor grayColor];
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
    }
    return self;
}

@end
