//
//  ViolationController.m
//  aliyun
//
//  Created by 王战胜 on 2017/10/26.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ViolationController.h"
#import "TableViewCell.h"
#define IMScreenWidth [UIScreen mainScreen].bounds.size.width
#define IMScreenHeight [UIScreen mainScreen].bounds.size.height
#define ShowAlertWithMsg(msg) UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确 定" style:UIAlertActionStyleDefault handler:nil];\
[alert addAction:sureAction];\
[self presentViewController:alert animated:YES completion:nil];
@interface ViolationController ()
@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;
@property (nonatomic, strong) UITextField *textField3;
@end

@implementation ViolationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全国违章查询";
    self.contentArray = [[NSMutableArray alloc]initWithObjects:@"车牌号码",@"发动机号",@"车身架号", nil];
    
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 300, IMScreenWidth, 50)];
    [btn setTitle:@"查询" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor whiteColor];
    [btn addTarget:self action:@selector(queryClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view.
}

- (void)queryClick{
    [self queryViolation];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell=[[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil]firstObject];
    if (indexPath.row == 0) {
        cell.textField.placeholder = @"请输入车牌号";
        cell.nameLabel.text = @"车牌号码";
        _textField1 = cell.textField;
    }else if (indexPath.row == 1){
        cell.textField.placeholder = @"请输入发动机号";
        cell.nameLabel.text = @"发动机号";
        _textField2 = cell.textField;
    }else if (indexPath.row == 2){
        cell.textField.placeholder = @"请输入车身架号";
        cell.nameLabel.text = @"车身架号";
        _textField3 = cell.textField;
    }
    return cell;
}

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



@end
