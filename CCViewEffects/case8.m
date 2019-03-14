//
//  case8.m
//  CCViewEffects
//
//  Created by cyd on 2019/3/14.
//  Copyright © 2019 cyd. All rights reserved.
//

#import "case8.h"
#import "UIView+Effects.h"
#import <Masonry/Masonry.h>

@interface case8 ()

@end

@implementation case8

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 1000;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.tag = 1000;
        [cell addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell).insets(UIEdgeInsetsMake(12, 12, 12, 12));
        }];
    }
    UIView *view = [cell viewWithTag:1000];
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-24, 1000-24);
    view.shadowOpacity(0.7).shadowColor([UIColor redColor]).shadowRadius(5).borderWidth(2).borderColor([UIColor blueColor]).conrnerRadius(10).viewBounds(rect).showVisual();
    return cell;
}

@end
