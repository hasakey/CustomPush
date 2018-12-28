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
//    UIViewController *toVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIViewController *fromVC = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIView * containerView = [transitionContext containerView];
//    UIView * fromView = fromVC.view;
//    UIView * toView = toVC.view;
//
//
//
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
//
//    UIView* shadowBack = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
//    shadowBack.backgroundColor = [UIColor blackColor];
//    shadowBack.alpha = 0.7;
//    [containerView addSubview:shadowBack];
//
//    UIView* frontWhiteView = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight/2-20, screenWidth, 40)];
//    frontWhiteView.backgroundColor = [UIColor whiteColor];
//    [containerView addSubview:frontWhiteView];
//
//
//    [containerView addSubview:toView];
//    [[transitionContext containerView] bringSubviewToFront:fromView];
//    [[transitionContext containerView] bringSubviewToFront:shadowBack];
//    [[transitionContext containerView] bringSubviewToFront:frontWhiteView];
//
//    NSTimeInterval timeInterval = 0.5;
//
//    [UIView animateWithDuration:timeInterval/5 animations:^{
//        frontWhiteView.frame = CGRectMake(0, screenHeight/2-18, screenWidth, 36);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:4*timeInterval/5 animations:^{
//            frontWhiteView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
//        } completion:^(BOOL finished) {
//
//            [shadowBack removeFromSuperview];
//            [frontWhiteView removeFromSuperview];
//            //                [transitionContext completeTransition:YES];
//
//        }];
//    }];
//
//    //和上一个动画是同时进行的
//    [UIView animateWithDuration:timeInterval animations:^{
//
//        fromView.transform = CGAffineTransformMakeScale(0.85, 0.85);
//
//    } completion:^(BOOL finished) {
//
//        fromView.transform = CGAffineTransformMakeScale(1, 1);
//        [transitionContext completeTransition:YES];
//
//    }];
    
    // fromViewController
    UIViewController * fromViewController = [transitionContext viewControllerForKey:( UITransitionContextFromViewControllerKey)];
    // toViewController
    UIViewController * toViewController = [transitionContext viewControllerForKey:( UITransitionContextToViewControllerKey)];
    
    /*
     
     typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
     
     // 默认的从下到上
     UIModalTransitionStyleCoverVertical = 0,
     // 翻转
     UIModalTransitionStyleFlipHorizontal __TVOS_PROHIBITED,
     // 渐显
     UIModalTransitionStyleCrossDissolve,
     // 类似你翻书时候的效果
     UIModalTransitionStylePartialCurl NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
     };
     
     */
    //
    UIView * contentView = [transitionContext containerView];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView   = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame   = [transitionContext finalFrameForViewController:toViewController];
    fromView.alpha = 1.0f;
    toView.alpha   = 0.0f;
    
    // 在present和，dismiss时，必须将toview添加到视图层次中
    [contentView addSubview:toView];
    
    // 获取执行时长
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:transitionDuration animations:^{
        
        
        fromView.alpha = 0.0f;
        toView.alpha   = 1.0;
        
    } completion:^(BOOL finished) {
        
        //transitionWasCancelled 这个方法判断转场是否已经取消了，下面的completeTransition设置转场完成
        //动画结束后一定要调用completeTransition方法
        //通过transitionWasCancelled()方法来获取转场的状态，使用completeTransition:来完成或取消转场。
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
    
}



@end
