//
//  ViewController.m
//  自制弹幕
//
//  Created by 席亚坤 on 16/5/12.
//  Copyright © 2016年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import "DanMuManger.h"
#import "DanmuView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DanMuManger *manger = [[DanMuManger alloc]init];
    __weak ViewController * Myself = self;
    manger.MakeDanMuView = ^(DanmuView  *danMuView){
        
        [Myself addBulletView:danMuView];
    };
    [manger start];

    
}
- (void)addBulletView:(DanmuView *)bulletView {
    bulletView.frame = CGRectMake(CGRectGetWidth(self.view.frame)+50, 200 + 40* bulletView.trajectory, CGRectGetWidth(bulletView.bounds), CGRectGetHeight(bulletView.bounds));
    [self.view addSubview:bulletView];
    [bulletView startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
