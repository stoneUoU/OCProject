//
//  YLZScanViewController.h
//  OCProject
//
//  Created by stone on 2022/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZScanViewController : UIViewController

@property (nonatomic, copy) void(^scanHandle)(NSString *scanResult);

@end

NS_ASSUME_NONNULL_END
