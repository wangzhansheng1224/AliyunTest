//
//  ViolationController.m
//  aliyun
//
//  Created by 王战胜 on 2017/10/26.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ViolationController.h"

@interface ViolationController ()

@end

@implementation ViolationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全国违章查询";
    self.contentArray = [[NSMutableArray alloc]initWithObjects:@"车牌号码",@"发动机号",@"车身架号", nil];
    
    
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCell"];
    }
    cell.textLabel.text = [[self.contentArray objectAtIndex:indexPath.row] description];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
