//
//  ViewController.m
//  购物车
//
//  Created by everhelp on 16/11/18.
//  Copyright © 2016年 Anshare. All rights reserved.
//

#import "ViewController.h"
#import "ZXShopCartViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 50, 30);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
//- (IBAction)openShopCart {
//    ZXShopCartViewController *shopCartVC = [[ZXShopCartViewController alloc] init];
//    [self.navigationController pushViewController:shopCartVC animated:YES];
//
//}
-(void)btAction
{
    ZXShopCartViewController *shopCartVC = [[ZXShopCartViewController alloc] init];
    [self.navigationController pushViewController:shopCartVC animated:YES];
    //
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
