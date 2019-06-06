//
//  CATitleLabel.h
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CABaseLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CATitleLabel : CABaseLabel

+(CATitleLabel *)CreateCATitleLabelWithWidth:(float)width WithTitle:(NSString *)title FontSize:(float)size BackgroundColor:(UIColor *)backgroundColor TitleColor:(UIColor *)titleColor;
@end

NS_ASSUME_NONNULL_END
