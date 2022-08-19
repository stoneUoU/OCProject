//
//  YLZMSBaseTableViewPresenter.m
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import "YLZMSBaseTableViewPresenter.h"

@implementation YLZMSBaseTableViewPresenter

- (instancetype)init {
    
    if ([self isMemberOfClass:[YLZMSBaseTableViewPresenter class]]) {
        //判断对象为YLZMSBaseTabelViewPresenter实例则抛出异常
        [self doesNotRecognizeSelector:_cmd];
        return nil;
    } else {
        self = [super init];
        if (self) {
        }
        return self;
    }
}

- (id)initWithTableView:(UITableView *)view
{
    self = [self init];
    if (self) {
        self.tableView = view;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        [self registerClass];
    }
    return self;
}

- (id)initWithTableView:(UITableView *)view controller:(UIViewController *)vc
{
    self = [self initWithTableView:view];
    if (self) {
        self.curentVC = vc;
    }
    return self;
}

- (void)registerClass
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
}

#pragma mark tableview delegate and datasource
#pragma mark

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self doesNotRecognizeSelector:_cmd];
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self doesNotRecognizeSelector:_cmd];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    headerView.contentView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12.f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    footerView.contentView.backgroundColor = [UIColor clearColor];
    
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSInteger sectionNum = [self numberOfSectionsInTableView:tableView];
    if (section == sectionNum - 1) {
        return 12.f;
    }
    return 0.01;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.scrollViewPTBlock) {
        self.scrollViewPTBlock(scrollView);
    }
}

@end


