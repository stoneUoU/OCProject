//
//  YLZConstTextFieldView.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZConstTextFieldView.h"

@interface YLZConstTextFieldView()<UITextFieldDelegate> {
    
}

@end

@implementation YLZConstTextFieldView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
    
        [self setUI];
    }
    return self;
}

- (id)init {
    if (self == [super init]) {
        [self setUI];
    }
    return self;
}

#pragma mark - Public Method
#pragma mark -

- (void)setNameString:(NSString *)nameString {
    _nameString = nameString;
    self.nameLabel.text = nameString;
}

- (void)setTextFieldString:(NSString *)textFieldString {
    _textFieldString = textFieldString;
    NSDictionary *attributes = @{NSFontAttributeName: [YLZFont regular:14], NSForegroundColorAttributeName: YLZColorTitleFour};
    self.textField.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:textFieldString attributes:attributes];
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    _keyboardType = keyboardType;
    self.textField.keyboardType = keyboardType;
}

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self addSubview:self.nameLabel];
    [self addSubview:self.textField];
    
    [self setMas];
}

- (void)setMas {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.centerY.equalTo(self);
        make.size.equalTo(@(CGSizeMake(120, 44)));
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right);
        make.right.equalTo(self.mas_right).offset(-16);
        make.centerY.equalTo(self);
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)textFieldChange:(UITextField *)field {
    
}

#pragma mark - lazy load
#pragma mark -

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [YLZFont regular:16];
        _nameLabel.textColor = YLZColorTitleOne;
    }
    return _nameLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [YLZFont medium:14.f];
        _textField.textColor = YLZColorTitleOne;
        _textField.delegate = self;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}


@end

