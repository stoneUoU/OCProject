//
//  YLZSmsCodeTextFieldView.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^YLZSmsCodeTextFieldViewSmsHandle)(UIButton *sender);

typedef void (^YLZSmsCodeTextFieldViewHandle)(UITextField *textField);

@interface YLZSmsCodeTextFieldView : UIView

@property (nonatomic, strong) NSString *nameString;

@property (nonatomic, strong) NSString *textFieldString;

@property (nonatomic, assign) UIKeyboardType keyboardType;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *codeButton;

@property (nonatomic, copy) YLZSmsCodeTextFieldViewHandle textFieldHandle;

@property (nonatomic, strong) YLZSmsCodeTextFieldViewSmsHandle smsHandle;

@end

NS_ASSUME_NONNULL_END

