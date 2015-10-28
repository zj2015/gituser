//
//  ViewController.m
//  git指令
//
//  Created by 张杰 on 15/10/28.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UIView *_headView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableview = [[UITableView alloc]init];
    tableview.frame = self.view.frame;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    UIView *headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    headView.backgroundColor = [UIColor yellowColor];
    _headView = headView;
    
    UIView *headView1 = [[UIView alloc]init];
    headView1.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    headView1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:headView];
    tableview.tableHeaderView = headView1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"sfdsfds";
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offset = scrollView.contentOffset.y;
    if (offset<0) {
        
        CGFloat w = (ABS(offset) + 200)/200 * self.view.bounds.size.width;
        CGFloat x = -(w - self.view.bounds.size.width)/2.0;
        _headView.frame = CGRectMake(x, 0, w, ABS(offset) + 200);
        
        
    }else{
    
        _headView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200-ABS(offset));
    
    }

}

@end
