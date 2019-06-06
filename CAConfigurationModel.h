//
//  CAConfigurationModel.h
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN



@class CAConfigurationTitleModel,CAConfigurationMsgModel,CAConfigurationButtonModel,CAButton,CAConfigurationModel;


typedef void(^CAActionBlock)(CAConfigurationModel *model);

@interface CAConfigurationModel : NSObject

@property(assign,nonatomic)float CLWidth;
@property(assign,nonatomic)float CLMaxHight;
@property(assign,nonatomic)BOOL isNeedCAMaskView;

@property(assign,nonatomic)NSUInteger btCount;



@property(strong,nonatomic)CAConfigurationTitleModel *titleModel;

@property(strong,nonatomic)CAConfigurationMsgModel *msgModel;

@property(strong,nonatomic)NSMutableArray<CAConfigurationButtonModel *>*actionModelArr;

@end




@interface CAConfigurationTitleModel : NSObject

@property(copy,nonatomic)NSString *title;
@property(assign,nonatomic)float titleFontSize;
@property(copy,nonatomic)UIColor *titleColor;
@property(copy,nonatomic)UIColor *titleBackgroundColor;

@end

@interface CAConfigurationMsgModel : NSObject
@property(copy,nonatomic)NSString *msg;
@property(assign,nonatomic)float msgFontSize;
@property(copy,nonatomic)UIColor *msgColor;
@property(copy,nonatomic)UIColor *msgBackgroundColor;
@end

@interface CAConfigurationButtonModel : NSObject

@property(copy,nonatomic)NSString *actionText;
@property(assign,nonatomic)float actionTextFontSize;
@property(copy,nonatomic)UIColor *actionTextColor;
@property(copy,nonatomic)UIColor *actionTextBackgroundColor;
@property(copy,nonatomic)CAActionBlock actionBlock;
@end

NS_ASSUME_NONNULL_END
