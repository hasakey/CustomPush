//
//  CustomPushAnimation.m
//  CustomPush
//
//  Created by 喂！ on 2018/12/28.
//  Copyright © 2018年 well. All rights reserved.
//

#import "CustomPushAnimation.h"

@implementation CustomPushAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5f;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * containerView = [transitionContext containerView];
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    
    
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIView* shadowBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    shadowBack.backgroundColor = [UIColor blackColor];
    shadowBack.alpha = 0.7;
    [containerView addSubview:shadowBack];
    
    UIView* frontWhiteView = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight/2-20, screenWidth, 40)];
    frontWhiteView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:frontWhiteView];
    
    
    [containerView addSubview:toView];
    [[transitionContext containerView] bringSubviewToFront:fromView];
    [[transitionContext containerView] bringSubviewToFront:shadowBack];
    [[transitionContext containerView] bringSubviewToFront:frontWhiteView];
    
    NSTimeInterval timeInterval = 0.5;
    
    [UIView animateWithDuration:timeInterval/5 animations:^{
        frontWhiteView.frame = CGRectMake(0, screenHeight/2-18, screenWidth, 36);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:4*timeInterval/5 animations:^{
            frontWhiteView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        } completion:^(BOOL finished) {
            
            [shadowBack removeFromSuperview];
            [frontWhiteView removeFromSuperview];
            //                [transitionContext completeTransition:YES];
            
        }];
    }];
    
    //和上一个动画是同时进行的
    [UIView animateWithDuration:timeInterval animations:^{
        
        fromView.transform = CGAffineTransformMakeScale(0.85, 0.85);
        
    } completion:^(BOOL finished) {
        
        fromView.transform = CGAffineTransformMakeScale(1, 1);
        [transitionContext completeTransition:YES];
        
    }];
}



@end
