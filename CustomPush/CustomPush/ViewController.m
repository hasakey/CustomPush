//
//  ViewController.m
//  CustomPush
//
//  Created by 喂！ on 2018/12/28.
//  Copyright © 2018年 well. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"
#import "CustomNAVDelegate.h"

@interface ViewController ()

@property(nonatomic,strong)CustomNAVDelegate *customNAVDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.customNAVDelegate = [CustomNAVDelegate new];
    self.navigationController.delegate = self.customNAVDelegate;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecondVC *vc = [SecondVC new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
