//
//  YLZMineBaseTableView.h
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import <UIKit/UIKit.h>
#import <JXPagingView/JXPagerView.h>

@interface YLZMineBaseTableView : UIView <JXPagerViewListViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSString *> *dataSource;

@end

