//
//  BaseViewController.m
//  侧边菜单栏
//
//  Created by erongchuang on 2018/5/19.
//  Copyright © 2018年 erongchuang. All rights reserved.
//

#import "BaseViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    UINavigationController *firstNav  = [[UINavigationController alloc]initWithRootViewController:firstVC];
    firstNav.tabBarItem.title = @"first";
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    UINavigationController *secondNav  = [[UINavigationController alloc]initWithRootViewController:secondVC];
    secondNav.tabBarItem.title = @"second";
    self.viewControllers  = @[firstNav,secondNav];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
