//
//  case3.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "case3.h"
#import "UIView+Effects.h"

@interface case3 ()

@end

@implementation case3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 64+50, 100, 100)];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    view1.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowOffset(CGSizeMake(1, 1)).showVisual();
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view1.frame)+50, 100, 100)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    view2.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).showVisual();
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view2.frame)+50, 100, 100)];
    view3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view3];
    view3.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).shadowOffset(CGSizeMake(5, 5)).showVisual();
    
    UIImageView *view4 = [[UIImageView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view3.frame)+50, 100, 100)];
    view4.backgroundColor = [UIColor clearColor];
    view4.contentMode = UIViewContentModeCenter;
    view4.image = [UIImage imageNamed:@"飞机"];
    [self.view addSubview:view4];
    view4.shadowOpacity(0.7).shadowOffset(CGSizeMake(5, 5)).shadowRadius(5).showVisual();
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
