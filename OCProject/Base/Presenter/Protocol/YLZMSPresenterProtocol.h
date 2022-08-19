//
//  YLZMSPresenterProtocol.h
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YLZMSPresenterProtocol <NSObject>

@optional

/**
 展示，即刷新界面
 */
- (void)present;

/**
 根据Model展示
 */
- (void)presentWithModel:(id)model;


- (void)presentWithModel:(id)model withObject:(id)object;


/**
 刷新，先获取数据，在刷新界面
 */
- (void)refresh;

/**
 加载更多
 */
- (void)loadMore;

@end

NS_ASSUME_NONNULL_END
