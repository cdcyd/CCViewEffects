//
//  case7.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "case7.h"
#import "UIView+Effects.h"
#import <Masonry/Masonry.h>

@interface case7 ()

// 测试循环引用
@property(nonatomic, strong)UIBezierPath *path;

@end

@implementation case7

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 80, 40)];

    // Masonry 测试
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64+50);
        make.left.equalTo(self.view).offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    view1.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowOffset(CGSizeMake(1, 1)).borderWidth(2).borderColor([UIColor blueColor]).conrnerRadius(10).showVisual();

    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 64+50+100+50, 100, 100)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    view2.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).borderWidth(2).borderColor([UIColor blueColor]).conrnerRadius(10).conrnerCorner(UIRectCornerTopLeft).showVisual();
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view2.frame)+50, 100, 100)];
    view3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view3];
    view3.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).shadowOffset(CGSizeMake(5, 5)).borderWidth(2).borderColor([UIColor blueColor]).conrnerRadius(10).showVisual();

    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(view3.frame)+50, 100, 100)];
    view4.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view4];
    view4.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).shadowOffset(CGSizeMake(5, 5)).borderWidth(2).borderColor([UIColor blueColor]).bezierPath(self.path).showVisual();

}

-(void)dealloc {
    NSLog(@"销毁了: %@", self);
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
