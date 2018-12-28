//
//  CustomNAVDelegate.m
//  CustomPush
//
//  Created by 喂！ on 2018/12/28.
//  Copyright © 2018年 well. All rights reserved.
//

#import "CustomNAVDelegate.h"

@implementation CustomNAVDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    
    return [CustomPushAnimation new];
}



@end
