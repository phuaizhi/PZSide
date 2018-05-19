//
//  UIViewController+PZSide.h
//  侧边菜单栏
//
//  Created by erongchuang on 2018/5/19.
//  Copyright © 2018年 erongchuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PZSide)

-(void)sidePushViewControll:(UIViewController *)viewController animated:(BOOL)animated;
-(void)show;
-(void)close;

@end
