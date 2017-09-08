//
//  ViewController.m
//  CCViewEffects
//
//  Created by 佰道聚合 on 2017/9/8.
//  Copyright © 2017年 cyd. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"圆角、边框、阴影";
    self.dataSource = @[@"圆角.caes1",
                        @"边框.case2",
                        @"阴影.case3",
                        @"圆角+边框.case4",
                        @"圆角+阴影.case5",
                        @"边框+阴影.case6",
                        @"圆角+边框+阴影.case7"];
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cameraCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    }
    cell.textLabel.text = [[_dataSource[indexPath.section] componentsSeparatedByString:@"."] firstObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    const char *className = [[[_dataSource[indexPath.section] componentsSeparatedByString:@"."] lastObject] UTF8String];
    Class pushClass = objc_getClass(className);
    if (object_isClass(pushClass)) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
        backItem.title = @"";
        self.navigationItem.backBarButtonItem = backItem;
        
        id vc = [[pushClass alloc]init];
        ((UIViewController*)vc).title = [[_dataSource[indexPath.section] componentsSeparatedByString:@"."] firstObject];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
