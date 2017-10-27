//
//  WZSModel.h
//  aliyun
//
//  Created by 王战胜 on 2017/10/27.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City:NSObject
@property (nonatomic, copy) NSString * city;
@property (nonatomic, copy) NSString * cityname;
@end



@interface VehicleLimitModel : NSObject
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * msg;
@property (nonatomic, strong) NSArray *result;
@end
