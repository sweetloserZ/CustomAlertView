//
//  CustomAlertCenter.h
//  AlertV
//
//  Created by sweetloser on 2019/6/2.
//  Copyright © 2019 sweetloser. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CAConfigurationModel.h"


NS_ASSUME_NONNULL_BEGIN

typedef void(^CABlock)(CAConfigurationModel *model);

@interface CustomAlertCenter : NSObject

+(CustomAlertCenter *)shareCustomAlertCenter;

-(void)showCustomAlertWithBlock:(CABlock)block;

@end

NS_ASSUME_NONNULL_END
