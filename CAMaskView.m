//
//  CAMaskView.m
//  AlertV
//
//  Created by sweetloser on 2019/6/1.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import "CAMaskView.h"

@implementation CAMaskView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4];
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapAction:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tapG];
    }
    return self;
}

-(void)TapAction:(UITapGestureRecognizer *)sender;
{
    [self removeFromSuperview];
}

@end
