//
//  PZSideViewController.h
//  侧边菜单栏
//
//  Created by erongchuang on 2018/5/19.
//  Copyright © 2018年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PZSideViewController : UIViewController
- (instancetype)initWithTabBarViewController:(UITabBarController *)tabBarViewController menuViewController:(UIViewController *)menuVC;
-(void)sidePushViewControll:(UIViewController *)viewController animated:(BOOL)animated;
-(void)open;
-(void)close;
@end
