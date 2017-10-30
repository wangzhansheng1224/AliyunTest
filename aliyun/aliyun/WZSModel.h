//
//  WZSModel.h
//  aliyun
//
//  Created by 王战胜 on 2017/10/27.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <Foundation/Foundation.h>

//限行查询
@interface City:NSObject
@property (nonatomic, copy) NSString * city;
@property (nonatomic, copy) NSString * cityname;
@property (nonatomic, copy) NSString * date;
@property (nonatomic, copy) NSString * week;
@property (nonatomic, strong) NSArray<NSString *> * time;
@property (nonatomic, copy) NSString * area;
@property (nonatomic, copy) NSString * summary;
@property (nonatomic, copy) NSString * numberrule;
@property (nonatomic, copy) NSString * number;
@end

@interface VehicleLimitCityModel : NSObject
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * msg;
@property (nonatomic, strong) NSArray<City *> *result;
@end

@interface VehicleLimitModel : NSObject
@property (nonatomic, copy) NSString * status;
@property (nonatomic, copy) NSString * msg;
@property (nonatomic, strong) City *result;
@end


//查询油价
@interface OilList : NSObject
@property (nonatomic, copy) NSString * prov;
@property (nonatomic, copy) NSString * p90;
@property (nonatomic, copy) NSString * p0;
@property (nonatomic, copy) NSString * p95;
@property (nonatomic, copy) NSString * p97;
@property (nonatomic, copy) NSString * p89;
@property (nonatomic, copy) NSString * p92;
@property (nonatomic, copy) NSString * ct;
@property (nonatomic, copy) NSString * p93;
@end

@interface ShowapiResBody : NSObject
@property (nonatomic, assign) uint64_t ret_code ;
@property (nonatomic, strong) NSArray<OilList *> * list;
@end

@interface TodayOilModel : NSObject
@property (nonatomic, assign) uint64_t showapi_res_code;
@property (nonatomic, copy) NSString * showapi_res_error;
@property (nonatomic, strong) NSDictionary<NSString *,ShowapiResBody *> * showapi_res_body;
@end

