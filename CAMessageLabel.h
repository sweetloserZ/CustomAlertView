//
//  CAMessageLabel.h
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CABaseLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAMessageLabel : CABaseLabel




+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message;

+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message MsgFontSize:(float)size;

+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message MsgFontSize:(float)size MsgBackgroundColor:(UIColor *)backgroundColor;

+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message MsgFontSize:(float)size MsgBackgroundColor:(UIColor *)backgroundColor MsgColor:(UIColor *)MsgColor;
@end

NS_ASSUME_NONNULL_END
