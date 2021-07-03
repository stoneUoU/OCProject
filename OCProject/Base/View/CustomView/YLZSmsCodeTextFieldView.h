//
//  YLZSmsCodeTextFieldView.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZSmsCodeTextFieldView : UIView

@property (nonatomic, strong) NSString *nameString;

@property (nonatomic, strong) NSString *textFieldString;

@property (nonatomic, assign) UIKeyboardType keyboardType;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *codeButton;

@end

NS_ASSUME_NONNULL_END

