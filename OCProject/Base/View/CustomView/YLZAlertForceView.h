//
//  YLZAlertForceView.h
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import <UIKit/UIKit.h>

typedef void (^YLZAlertForceViewHanlde)(NSInteger index);

@interface YLZAlertForceModel : NSObject

@property (nonatomic, copy) NSString * _Nullable titleString;

@property (nonatomic, copy) NSString * _Nullable okString;

@property (nonatomic, copy) NSString * _Nullable cancelString;

@end


NS_ASSUME_NONNULL_BEGIN

@interface YLZAlertForceView : UIView

@property (nonatomic, strong) YLZAlertForceModel *model;

@property (nonatomic, copy) YLZAlertForceViewHanlde handle;

- (void)showAlert;

@end

NS_ASSUME_NONNULL_END
