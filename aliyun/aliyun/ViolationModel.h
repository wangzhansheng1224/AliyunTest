//
//  ViolationModel.h
//  aliyun
//
//  Created by 王战胜 on 2017/10/26.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"
//
@interface YYData : NSObject
@property (nonatomic, assign) uint16_t untreated;
@property (nonatomic, assign) uint16_t amount;
@end

@implementation YYData
@end

@interface YYPhoto : NSObject
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *desc;
@end

@implementation YYPhoto
@end

@interface ViolationModel : NSObject
@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) NSDictionary *data;

@end
