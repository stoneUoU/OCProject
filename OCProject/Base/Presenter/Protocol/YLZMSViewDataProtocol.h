//
//  YLZMSViewDataProtocol.h
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YLZMSViewDataProtocol <NSObject>

@optional

- (void)setDataWithModel:(id)model;

- (void)setDataWithModel:(id)model withObject:(id _Nullable)object;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
