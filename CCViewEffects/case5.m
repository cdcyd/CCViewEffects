//
//  case5.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "case5.h"
#import "UIView+Effects.h"

@interface case5 ()

@end

@implementation case5

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 64+50, 100, 100)];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    view1.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowOffset(CGSizeMake(1, 1)).conrnerRadius(10).showVisual();
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view1.frame)+50, 100, 100)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    view2.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).conrnerRadius(10).conrnerCorner(UIRectCornerTopLeft | UIRectCornerTopRight).showVisual();
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view2.frame)+50, 100, 100)];
    view3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view3];
    view3.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).shadowOffset(CGSizeMake(5, 5)).conrnerRadius(10).conrnerCorner(UIRectCornerBottomLeft | UIRectCornerBottomRight).showVisual();
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
