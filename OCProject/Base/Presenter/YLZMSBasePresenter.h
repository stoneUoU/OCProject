//
//  YLZMSBasePresenter.h
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import <Foundation/Foundation.h>
#import "YLZMSPresenterProtocol.h"
#import "YLZMSViewDataProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLZMSBasePresenter : NSObject<YLZMSPresenterProtocol>

@property (nonatomic, weak) UIViewController *curentVC;

@property (nonatomic, weak) UIView <YLZMSViewDataProtocol> *view;

@property (nonatomic, weak) id model;

- (id)initWithView:(UIView<YLZMSViewDataProtocol> *)view;

- (id)initWithView:(UIView<YLZMSViewDataProtocol> *)view controller:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
