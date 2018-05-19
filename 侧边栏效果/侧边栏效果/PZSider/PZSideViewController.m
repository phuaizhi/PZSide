//
//  PZSideViewController.m
//  侧边菜单栏
//
//  Created by erongchuang on 2018/5/19.
//  Copyright © 2018年 erongchuang. All rights reserved.
//

#import "PZSideViewController.h"
#import "BaseViewController.h"
#import "MenuViewController.h"
#define Wscreen [UIScreen mainScreen].bounds.size.width
#define Hscreen [UIScreen mainScreen].bounds.size.height
@interface PZSideViewController ()
@property (strong,nonatomic)UITabBarController *tabBarVC;
@property (strong,nonatomic)UIViewController   *menuVC;
@property(strong,nonatomic)UIView * tapView;
@property(strong,nonatomic)UIView * grayView;
@end

@implementation PZSideViewController
-(UIView *)tapView
{
    if (!_tapView) {
        _tapView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        //添加tap手势 关掉侧边栏
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_tapView addGestureRecognizer:tap];
        _tapView.hidden = YES;
    }
    return _tapView;
}
-(UIView *)grayView
{
    if (!_grayView)
    {
        //蒙板
        _grayView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _grayView.backgroundColor = [UIColor blackColor];
        _grayView.tag = 110;
        _grayView.alpha = 0;
    }
    return _grayView;
}
- (instancetype)initWithTabBarViewController:(UITabBarController *)tabBarViewController menuViewController:(UIViewController *)menuVC
{
    if(self = [super init])
    {
        //接入外界传入的tabbar 和vc
        self.tabBarVC = tabBarViewController;
        self.menuVC = menuVC;
        [self addChildViewController:tabBarViewController];
        [self addChildViewController:menuVC];
        //改变侧边vc的初始位置 即放在左侧
        CGPoint menuCenter = menuVC.view.center;
        menuCenter.x -= Wscreen*0.75*0.5;//定义向左侧篇屏幕宽度3/4的一半
        menuVC.view.center = menuCenter;
        //添加各自的view
        [self.view addSubview:menuVC.view];//保证这个在下面
        [self.view addSubview:tabBarViewController.view];
        //给tabbar添加操作view
        [tabBarViewController.view addSubview:self.grayView];
        [tabBarViewController.view addSubview:self.tapView];//点击时回归正常
        //给tabb添加pan手势 滑出侧边栏
        UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMenuVCAction:)];
        [tabBarViewController.view addGestureRecognizer:panGes];
    }
    return self;
}
//轻扫手势呼出侧边栏
- (void)panMenuVCAction:(UIPanGestureRecognizer *)pan
{
    //当tabbar在第二层时不允许侧滑
    UINavigationController *nav = self.tabBarVC.selectedViewController;
    if(nav.viewControllers.count > 1)
    {
        return;
    }
    //获取移动量改变tabbar和vc的center位置  从而达到侧滑效果
    CGPoint movePoint = [pan translationInView:self.tabBarVC.view];
    if(pan.state == UIGestureRecognizerStateBegan)
    {
        //移动开始时 防止tabbar不在蒙板内
        [self.tabBarVC.view insertSubview:self.tabBarVC.tabBar belowSubview:self.grayView];
    }
    else if(pan.state == UIGestureRecognizerStateChanged && self.tapView.hidden)
    {
        //移动中
        if(movePoint.x < Wscreen*0.75)
        {
            //0.75是我们最终侧边栏在屏幕中位置
            CGPoint center = self.view.center;
            center.x += movePoint.x;
            // 回复原始位置
            if(movePoint.x < 0)
            {
                self.tabBarVC.view.center = self.view.center;
                CGPoint muCenter = self.view.center;
                muCenter.x -= Wscreen*0.75*0.5;
                self.menuVC.view.center = muCenter;
                return;
            }
            //防止初始左滑
            if (center.x<Wscreen/2) {
            }
            self.tabBarVC.view.center = center;
            center.x -= Wscreen*0.75*0.5 + (movePoint.x)/2;
            self.menuVC.view.center = center;
        }
        else
        {
            CGPoint center = self.view.center;
            self.menuVC.view.center = center;
            center.x+= 0.75*Wscreen;
            self.tabBarVC.view.center = center;
            self.tapView.hidden = NO;
        }
    }
    //抬起
    else if (pan.state == UIGestureRecognizerStateEnded)
    {
        if (movePoint.x< Wscreen*0.75*0.5) {
            [self close];
        }
        else
        {
            [self open];
        }
    }
}
-(void)tapAction:(UITapGestureRecognizer *)sender
{
    [self close];
}
-(void)open
{
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint originCenter = self.view.center;
        self.menuVC.view.center = originCenter;
        originCenter.x += 0.75*Wscreen;
        self.tabBarVC.view.center = originCenter;
        
        self.grayView.alpha = 0.6;
    }completion:^(BOOL finished) {
        self.tapView.hidden = NO;
    }];
}
-(void)close
{
    [UIView animateWithDuration:0.2 animations:^{
        CGPoint originCenter = self.view.center;
        self.tabBarVC.view.center = originCenter;
        originCenter.x -= 0.75*0.5*Wscreen;
        self.menuVC.view.center = originCenter;
        self.grayView.alpha = 0;
    } completion:^(BOOL finished) {
        self.tapView.hidden = YES;
    }];
}
-(void)sidePushViewControll:(UIViewController *)viewController animated:(BOOL)animated
{
    [self close];
    UINavigationController * nav = self.tabBarVC.selectedViewController;
    [nav pushViewController:viewController animated:YES];
}
@end
