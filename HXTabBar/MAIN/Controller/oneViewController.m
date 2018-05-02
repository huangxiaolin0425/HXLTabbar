//
//  oneViewController.m
//  HXLTabbar
//
//  Created by Cocav on 2018/3/21.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "oneViewController.h"

@interface oneViewController ()
@property (nonatomic,strong)UIButton *btn;
@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.btn];
    // Do any additional setup after loading the view.
}
- (UIButton *)btn{
    if(!_btn){
        _btn=[UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame=CGRectMake(100, 100, 100, 50);
        [_btn addTarget:self action:@selector(tapbtn:) forControlEvents:UIControlEventTouchUpInside];
        _btn.backgroundColor=[UIColor orangeColor];
    }
    return _btn;
}
- (void)tapbtn:(UIButton *)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"anima" object:nil userInfo:@{@"type":@"one",@"time":@"10"}];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

