//
//  FirstViewController.m
//  侧边菜单栏
//
//  Created by erongchuang on 2018/5/19.
//  Copyright © 2018年 erongchuang. All rights reserved.
//

#import "FirstViewController.h"
#import "UIViewController+PZSide.h"
#import "ThirdViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    [self.navigationItem setTitle:@"FirstVC"];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"菜单" style:UIBarButtonItemStyleDone target:self action:@selector(showSideVC)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"跳转" style:UIBarButtonItemStyleDone target:self action:@selector(pushVC)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)showSideVC
{
    [self show];
}
- (void)pushVC
{
    //两张跳转方法都行
    ThirdViewController *thirdVC = [[ThirdViewController alloc]init];
    [self sidePushViewControll:thirdVC animated:YES];
//    [self.navigationController pushViewController:thirdVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
