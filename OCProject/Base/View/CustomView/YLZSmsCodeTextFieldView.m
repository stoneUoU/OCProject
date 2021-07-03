//
//  YLZSmsCodeTextFieldView.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZSmsCodeTextFieldView.h"
#import "YLZCategory.h"

@interface YLZSmsCodeTextFieldView()<UITextFieldDelegate> {
    
}

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation YLZSmsCodeTextFieldView

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
    [self addSubview:self.separatorView];
    [self addSubview:self.codeButton];
    
    [self setMas];
}

- (void)setMas {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.centerY.equalTo(self);
        make.size.equalTo(@(CGSizeMake(120, 44)));
    }];
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.centerY.equalTo(self);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-88);
        make.centerY.equalTo(self);
        make.size.equalTo(@(CGSizeMake(0.5, 32)));
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right);
        make.right.equalTo(self.separatorView.mas_left).offset(-16);
        make.centerY.equalTo(self);
    }];
    
}

#pragma mark - IB-Action
#pragma mark -

- (void)textFieldChange:(UITextField *)field {
    
}

- (void)toSmsCode:(UIButton *)sender {
    
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

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = YLZColorLine;
    }
    return _separatorView;
}

- (UIButton *)codeButton {
    if(_codeButton == nil) {
        _codeButton = [[UIButton alloc] init];
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeButton.titleLabel.font = [YLZFont regular:15];
        [_codeButton setTitleColor:YLZColorBlueView forState:UIControlStateNormal];
        _codeButton.tag = 1;
        _codeButton.ylz_acceptEventInterval = 2.0;
        _codeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _codeButton.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 5);
        [_codeButton addTarget:self action:@selector(toSmsCode:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeButton;
}


@end


