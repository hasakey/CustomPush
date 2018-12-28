//
//  NavController.m
//  PopTest
//
//  Created by 喂！ on 2018/12/12.
//  Copyright © 2018年 well. All rights reserved.
//

#import "NavController.h"

@interface NavController ()<UIGestureRecognizerDelegate>

@end

@implementation NavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}



@end
