//
//  LocationViewController.m
//  aliyun
//
//  Created by 王战胜 on 2017/10/26.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "LocationViewController.h"
#define IMScreenWidth [UIScreen mainScreen].bounds.size.width
#define IMScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LocationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionV;
@property (nonatomic, strong) NSMutableArray *contentArray;
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentArray = [[NSMutableArray alloc]initWithObjects:@"京",@"津", nil];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing=0;
    flowLayout.minimumLineSpacing=0;
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionV.delegate=self;
    _collectionV.dataSource=self;
    _collectionV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionV];
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.contentArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(IMScreenWidth/10, IMScreenWidth/10+10);
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
