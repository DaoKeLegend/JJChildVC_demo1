//
//  ViewController.m
//  JJChildVC_demo1
//
//  Created by mac on 2017/9/25.
//  Copyright © 2017年 DaoKeLegend. All rights reserved.
//

#import "ViewController.h"
#import "JJChildVCOne.h"
#import "JJChildVCTwo.h"
#import "JJChildVCThree.h"

#define kViewControllerScreenWidth     [UIScreen mainScreen].bounds.size.width
#define kViewControllerScreenHeight    [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UIViewController *currentVC;

@end

@implementation ViewController

#pragma mark -  Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置UI
    [self setupUI];
    
    //加子控制器
    [self setupChildVC];
}

#pragma mark -  Object Private Function

- (void)setupChildVC
{
    JJChildVCOne *childOneVC = [[JJChildVCOne alloc] init];
    childOneVC.view.backgroundColor = [UIColor redColor];
    
    JJChildVCTwo *childTwoVC = [[JJChildVCTwo alloc] init];
    childTwoVC.view.backgroundColor = [UIColor blueColor];
    
    JJChildVCThree *childThreeVC = [[JJChildVCThree alloc] init];
    childThreeVC.view.backgroundColor = [UIColor greenColor];
    
    [self addChildViewController:childOneVC];
    [self addChildViewController:childTwoVC];
    [self addChildViewController:childThreeVC];
}

- (void)setupUI
{
    for (NSInteger i = 0; i < 3; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *title = [NSString stringWithFormat:@"切换%d", i];
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        
        //不同标签的差异化设置
        if (i == 0) {
            button.backgroundColor = [UIColor redColor];
        }
        else if (i == 1){
            button.backgroundColor = [UIColor blueColor];
        }
        else {
            button.backgroundColor = [UIColor greenColor];
        }
        
        [self.view addSubview:button];
        button.frame = CGRectMake(i * kViewControllerScreenWidth / 3, 0.0, kViewControllerScreenWidth / 3, 40);
    }
}

#pragma mark -  Action && Notification

- (void)buttonDidClick:(UIButton *)button
{
    UIViewController *vc = self.childViewControllers[button.tag];
    vc.view.frame = CGRectMake(0.0, 40.0, kViewControllerScreenWidth, kViewControllerScreenHeight - 40.0);
    //移除掉当前显示的控制器的view
    [self.currentVC.view removeFromSuperview];
    self.currentVC = vc;
    //把选中的控制器view显示到界面上
    [self.view addSubview:self.currentVC.view];
}

@end






































