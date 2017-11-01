//
//  ViewController.m
//  aliyun
//
//  Created by 王战胜 on 2017/10/25.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ViewController.h"
#import "ViolationController.h"
#import "WZSModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"阿里云服务";
    self.contentArray = [[NSMutableArray alloc]initWithObjects:@"全国违章查询",@"尾号限行城市",@"尾号限行",@"今日油价", nil];
    
//    [self queryTodayOil];//今日油价
//    [self queryVehicleLimit];//尾号限行
//    [self queryViolation];//违章查询
//    [self queryViolationCondition];//违章查询条件
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ViolationController *vc = [[ViolationController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        [self queryVehicleLimitCity];
    }else if (indexPath.row == 2){
        [self queryVehicleLimit];
    }else if (indexPath.row == 3){
        [self queryTodayOil];
    }
}

#pragma mark 尾号限行城市
- (void)queryVehicleLimitCity{
    NSString *appcode = @"bee6471d2bf14756a91d816b972267e3";
    NSString *host = @"http://jisuclwhxx.market.alicloudapi.com";
    NSString *path = @"vehiclelimit/city";
    NSString *method = @"GET";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@/%@?%@",  host,  path , querys];
//    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response object: %@" , response);
        NSString *bodyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        VehicleLimitCityModel *model = [VehicleLimitCityModel yy_modelWithJSON:data];
        NSLog(@"%@",model);
        //打印应答中的body
        NSLog(@"Response body: %@" , bodyString);
    }];
    [task resume];
}

#pragma mark 尾号限行
- (void)queryVehicleLimit{
    NSString *appcode = @"bee6471d2bf14756a91d816b972267e3";
    NSString *host = @"http://jisuclwhxx.market.alicloudapi.com";
    NSString *path = @"vehiclelimit/query";
    NSString *method = @"GET";
    NSString *querys = @"city=beijing&date=2017-10-30";
    NSString *url = [NSString stringWithFormat:@"%@/%@?%@",  host,  path , querys];
    //    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response object: %@" , response);
        NSString *bodyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        VehicleLimitModel *model = [VehicleLimitModel yy_modelWithJSON:data];
        NSLog(@"%@",model);
        //打印应答中的body
        NSLog(@"Response body: %@" , bodyString);
    }];
    [task resume];
}

#pragma mark 查询今日油价
- (void)queryTodayOil{
    NSString *appcode = @"bee6471d2bf14756a91d816b972267e3";
    NSString *host = @"https://ali-todayoil.showapi.com";
    NSString *path = @"todayoil";
    NSString *method = @"GET";
    NSString *querys = @"prov=北京";
    NSString *url = [NSString stringWithFormat:@"%@/%@?%@",  host,  path , querys];
    //    NSString *bodys = @"";
    
    //中文转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response object: %@" , response);
        NSString *bodyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        TodayOilModel *model = [TodayOilModel yy_modelWithJSON:bodyString];
        NSLog(@"%@",model);
        //打印应答中的body
        NSLog(@"Response body: %@" , bodyString);
    }];
    [task resume];
}

#pragma mark 全国违章查询
- (void)queryViolation{
    NSString *appcode = @"bee6471d2bf14756a91d816b972267e3";
    NSString *host = @"http://ddycapi.market.alicloudapi.com";
    NSString *path = @"/violation/query";
    NSString *method = @"POST";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"{\"plateNumber\":\"京P67988\",\"engineNo\":\"A293D202\"}";
//    NSString *bodys = @"{\"plateNumber\":\"鲁FE5026\"(车牌号，必填),\"vin\":\"167786\"(车架号，视城市规则是否必填),\"engineNo\":\"013166\"(发动机号，视城市规则是否必填),\"carType\":\"02\"(车辆类型01大车02小车,不必填,默认小车),\"city\":\"烟台市\"(查询城市,不必填,默认查归属地)}";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    //根据API的要求，定义相对应的Content-Type
    [request addValue: @"application/json; charset=UTF-8" forHTTPHeaderField: @"Content-Type"];
    NSData *data = [bodys dataUsingEncoding: NSUTF8StringEncoding];
    [request setHTTPBody: data];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       NSLog(@"Response object: %@" , response);
                                                       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
                                                       
                                                       //打印应答中的body
                                                       NSLog(@"Response body: %@" , bodyString);
                                                   }];
    
    [task resume];
}

-(void)queryViolationCondition{
    NSString *appcode = @"bee6471d2bf14756a91d816b972267e3";
    NSString *host = @"http://ddycapi.market.alicloudapi.com";
    NSString *path = @"/violation/condition";
    NSString *method = @"GET";
    NSString *querys = @"";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response object: %@" , response);
        NSString *bodyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        //打印应答中的body
        NSLog(@"Response body: %@" , bodyString);
    }];
    [task resume];
}

@end
