//
//  case4.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "case4.h"
#import "UIView+Effects.h"

@interface case4 ()

@end

@implementation case4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 64+50, 100, 100)];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    view1.conrnerRadius(10).borderWidth(1).borderColor([UIColor blueColor]).showVisual();
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view1.frame)+50, 100, 100)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    view2.conrnerRadius(10).conrnerCorner(UIRectCornerTopLeft | UIRectCornerBottomRight).borderColor([UIColor blueColor]).borderWidth(4).showVisual();
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
