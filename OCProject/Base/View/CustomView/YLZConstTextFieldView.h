//
//  YLZConstTextFieldView.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^YLZConstTextFieldViewHandle)(UITextField *textField);


@interface YLZConstTextFieldView : UIView

@property (nonatomic, strong) NSString *nameString;

@property (nonatomic, strong) NSString *textFieldString;

@property (nonatomic, assign) UIKeyboardType keyboardType;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, copy) YLZConstTextFieldViewHandle textFieldHandle;

@end

NS_ASSUME_NONNULL_END
