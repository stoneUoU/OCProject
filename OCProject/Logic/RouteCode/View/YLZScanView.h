//
//  YLZScanView.h
//  OCProject
//
//  Created by stone on 2022/9/1.
//

#import "HSAQRCode.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YLZScanViewDelegate <NSObject>

@optional

- (void)toOpenFlashlight;

@end

@interface YLZScanView : UIView {
}

@property (nonatomic, weak) id<YLZScanViewDelegate> delegate;

@property (nonatomic, strong) HSAQRCodeScanView *codeScanView;

@property (nonatomic, strong) UILabel *promptLabel;

@property (nonatomic, assign) BOOL flashlightButtonHidden;

@property (nonatomic, copy) NSString *flashlightButtonStr;

@end

NS_ASSUME_NONNULL_END
