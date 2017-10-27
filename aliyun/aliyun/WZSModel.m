//
//  WZSModel.m
//  aliyun
//
//  Created by 王战胜 on 2017/10/27.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "WZSModel.h"

@implementation City
@end

@implementation VehicleLimitModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"result" : City.class};
}
@end
