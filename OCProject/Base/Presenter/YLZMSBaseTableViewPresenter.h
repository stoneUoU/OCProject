//
//  YLZMSBaseTableViewPresenter.h
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import "YLZMSBasePresenter.h"
#import "YLZMSViewDataProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^YLZMSScrollViewPTBlock)(UIScrollView *scrollView);

@interface YLZMSBaseTableViewPresenter : YLZMSBasePresenter<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) YLZMSScrollViewPTBlock scrollViewPTBlock;

- (id)initWithTableView:(UITableView *)view;

- (id)initWithTableView:(UITableView *)view controller:(UIViewController *)vc;

- (void)registerClass;

@end

NS_ASSUME_NONNULL_END
