//
//  YLZMSBasePresenter.m
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import "YLZMSBasePresenter.h"

@implementation YLZMSBasePresenter

- (id)initWithView:(UIView<YLZMSViewDataProtocol> *)view
{
    self = [self init];
    if (self) {
        self.view = view;
    }
    return self;
}

- (id)initWithView:(UIView<YLZMSViewDataProtocol> *)view controller:(UIViewController *)vc
{
    self = [self init];
    if (self) {
        self.view = view;
        self.curentVC = vc;
    }
    return self;
}

/**
 展示
 */
- (void)present
{
    if (self.view && [self.view respondsToSelector:@selector(reloadData)]) {
        [self.view reloadData];
    }
}

/**
 根据Model展示
 */
- (void)presentWithModel:(id)model
{
    self.model = model;
    
    if (self.view && [self.view respondsToSelector:@selector(setDataWithModel:)]) {
        [self.view setDataWithModel:model];
    }
}

- (void)presentWithModel:(id)model withObject:(nonnull id)object
{
    self.model = model;
    
    if (self.view && [self.view respondsToSelector:@selector(setDataWithModel:withObject:)]) {
        [self.view setDataWithModel:model withObject:object];
    }
}

/**
 刷新
 */
- (void)refresh
{
    //请求数据
    //展示界面
    [self present];
}

/**
 加载更多
 */
- (void)loadMore
{
    
}

@end
