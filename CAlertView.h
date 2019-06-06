//
//  CAlertView.h
//  AlertV
//
//  Created by sweetloser on 2019/6/1.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CAConfigurationModel;
NS_ASSUME_NONNULL_BEGIN

@interface CAlertView : UIView

+(CAlertView *)CreateCAViewWithModel:(CAConfigurationModel *)model;

@end

NS_ASSUME_NONNULL_END
