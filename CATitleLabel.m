//
//  CATitleLabel.m
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CATitleLabel.h"

@implementation CATitleLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+(CATitleLabel *)CreateCATitleLabelWithWidth:(float)width WithTitle:(NSString *)title FontSize:(float)size BackgroundColor:(UIColor *)backgroundColor TitleColor:(UIColor *)titleColor;
{
    
    CATitleLabel *CATLabel = [[CATitleLabel alloc] initWithFrame:CGRectMake(0, 0, width, 40)];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange titleRange = [title rangeOfString:title];
    [attrStr addAttribute:NSForegroundColorAttributeName value:titleColor range:titleRange];
    [CATLabel setBackgroundColor:backgroundColor];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:titleRange];
    [CATLabel setAttributedText:attrStr];
    
    return CATLabel;
}



-(instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end
