//
//  CAButton.h
//  AlertV
//
//  Created by sweetloser on 2019/6/3.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAlertView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAButton : UIButton

+(CAButton *)CreateCAButtonWithWidth:(float)width WithText:(NSString *)text FontSize:(float)size BackgroundColor:(UIColor *)backgroundColor TextColor:(UIColor *)textColor;

@end

NS_ASSUME_NONNULL_END
