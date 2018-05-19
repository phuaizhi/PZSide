# PZSide
> 实现侧边栏效果

主要思路：将我们的主要控制器(可能为`UIViewController、UITabBarViewController、UINavigationController`)和侧边栏`UIViewController`作为子控制器放到同一个控制器(作为`rootViewController`)下面。在主控制器添加`UIPanGestureRecognizer`手势，根据` CGPoint movePoint = [pan translationInView:self.tabBarVC.view];
`x的偏移量来改变两个控制器中心的位置。从而实现侧边栏的出现和隐藏。

```
//使用简介
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    BaseViewController *baseTab = [[BaseViewController alloc]init];//主
    MenuViewController *menuVC = [[MenuViewController alloc]init];//侧边
    PZSideViewController *sideVC = [[PZSideViewController alloc]initWithTabBarViewController:baseTab menuViewController:menuVC];
    //rootViewController
    self.window.rootViewController = sideVC;
    [self.window makeKeyAndVisible];
```
