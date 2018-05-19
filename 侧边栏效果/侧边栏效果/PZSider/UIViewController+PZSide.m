//
//  UIViewController+PZSide.m
//  侧边菜单栏
//
//  Created by erongchuang on 2018/5/19.
//  Copyright © 2018年 erongchuang. All rights reserved.
//

#import "UIViewController+PZSide.h"
#import "PZSideViewController.h"
@implementation UIViewController (PZSide)
//方便vc进行操作
-(void)sidePushViewControll:(UIViewController *)viewController animated:(BOOL)animated
{
    PZSideViewController *sideVC = (PZSideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [sideVC sidePushViewControll:viewController animated:animated];
}
-(void)show
{
    PZSideViewController *sideVC = (PZSideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [sideVC open];
}
-(void)close
{
    PZSideViewController *sideVC = (PZSideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [sideVC close];
}
@end
