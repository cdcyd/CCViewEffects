//
//  caes1.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "caes1.h"
#import "UIView+Effects.h"

@interface caes1 ()

@end

@implementation caes1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 64+50, 100, 100)];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    view1.conrnerRadius(15).showVisual();
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view1.frame)+50, 100, 100)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    view2.conrnerRadius(15).conrnerCorner(UIRectCornerTopLeft).showVisual();
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view2.frame)+50, 100, 100)];
    view3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view3];
    view3.conrnerRadius(15).conrnerCorner(UIRectCornerTopLeft | UIRectCornerTopRight).showVisual();
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
