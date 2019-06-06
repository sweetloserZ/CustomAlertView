//
//  CAButton.m
//  AlertV
//
//  Created by sweetloser on 2019/6/3.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CAButton.h"
@implementation CAButton

+(CAButton *)CreateCAButtonWithWidth:(float)width WithText:(NSString *)text FontSize:(float)size BackgroundColor:(UIColor *)backgroundColor TextColor:(UIColor *)textColor
{
    CAButton *CABt = [CAButton buttonWithType:UIButtonTypeSystem];
    
    [CABt setFrame:CGRectMake(0, 0, width, 40)];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange textRange = [text rangeOfString:text];
    
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:textColor range:textRange];
        
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:textRange];
    
    [CABt setAttributedTitle:attrStr forState:UIControlStateNormal];
    
    [CABt setBackgroundColor:backgroundColor];
    
    
    return CABt;
}

@end
