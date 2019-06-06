//
//  CAMessageLabel.m
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CAMessageLabel.h"

@implementation CAMessageLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message;
{

    
    
    
    return [self CreateMessageLabelWithWidth:width Message:message MsgFontSize:20];
}

+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message MsgFontSize:(float)size;
{
    return [self CreateMessageLabelWithWidth:width Message:message MsgFontSize:size MsgBackgroundColor:[UIColor whiteColor]];
}

+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message MsgFontSize:(float)size MsgBackgroundColor:(UIColor *)backgroundColor;
{
    return [self CreateMessageLabelWithWidth:width Message:message MsgFontSize:size MsgBackgroundColor:backgroundColor MsgColor:[UIColor blackColor]];
}



+(CAMessageLabel *)CreateMessageLabelWithWidth:(float)width Message:(NSString *)message MsgFontSize:(float)size MsgBackgroundColor:(UIColor *)backgroundColor MsgColor:(UIColor *)MsgColor;
{
    NSRange msgRange = [message rangeOfString:message];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:message];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:msgRange];
    [attrStr addAttribute:NSForegroundColorAttributeName value:MsgColor range:msgRange];
    
    CGRect msgLRect = CGRectMake(0, 0, width, 1000);
    CAMessageLabel *msgLabel = [[CAMessageLabel alloc] initWithFrame:msgLRect];
    
    [msgLabel setBackgroundColor:backgroundColor];
    [msgLabel setAttributedText:attrStr];
    
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    
    CGRect lastRect = [attrStr boundingRectWithSize:msgLabel.bounds.size options:options context:nil];
    
    [msgLabel setFrame:CGRectMake(0, 0, width, lastRect.size.height)];
    
    return msgLabel;
    
}

@end
