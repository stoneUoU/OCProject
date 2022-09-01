//
//  YLZProcessCardView.m
//  OCProject
//
//  Created by stone on 2022/8/30.
//

#import "YLZProcessCardView.h"
#import "UIButton+YLZFixMultiClick.h"
#import "UITextField+YLZExtension.h"
#import "YLZEnlargeButton.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YLZProcessCardView() {
    
}

@property (nonatomic, strong) UIView *phoneView;

@property (nonatomic, strong) UIView *phoneSeparatorView;

@property (nonatomic, strong) UIImageView *phoneLogoImageView;

@property (nonatomic, strong) UITextField *phoneTextField;

@property (nonatomic, strong) UIView *smsButtonLeftView;

@property (nonatomic, strong) UIButton *smsButton;

@property (nonatomic, strong) UIView *smsView;

@property (nonatomic, strong) UITextField *smsTextField;

@property (nonatomic, strong) UIView *smsSeparatorView;

@property (nonatomic, strong) UIImageView *smsLogoImageView;

@property (nonatomic, strong) YLZEnlargeButton *agreementButton;

@property (nonatomic, strong) YYLabel *protocolLabel;

@property (nonatomic, strong) UIButton *doButton;

@property (nonatomic, strong) UILabel *introductionLabel;

@end

@implementation YLZProcessCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        [self setUI];
    }
    return self;//返回一个已经初始化完毕的对象；
}
    
- (void)drawRect:(CGRect)rect {
}
    
#pragma mark - Public Method
#pragma mark -
    
#pragma mark - Private Method
#pragma mark -
    
- (void)setUI {
    [self addSubview:self.phoneView];
    [self.phoneView addSubview:self.phoneSeparatorView];
    [self.phoneView addSubview:self.phoneLogoImageView];
    [self.phoneView addSubview:self.smsButton];
    [self.phoneView addSubview:self.smsButtonLeftView];
    [self.phoneView addSubview:self.phoneTextField];
    [self addSubview:self.smsView];
    [self.smsView addSubview:self.smsSeparatorView];
    [self.smsView addSubview:self.smsLogoImageView];
    [self.smsView addSubview:self.smsTextField];
    
    [self addSubview:self.agreementButton];
    [self addSubview:self.protocolLabel];
    
    [self addSubview:self.doButton];
    [self addSubview:self.introductionLabel];
    [self setMas];
}
    
- (void)setMas {
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.left.equalTo(self);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 50)));
    }];
    [self.phoneSeparatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self.phoneView);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 64, 0.5)));
    }];
    [self.phoneLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneView);
        make.left.equalTo(self.phoneSeparatorView.mas_left).offset(6);
        make.size.equalTo(@(CGSizeMake(20, 20)));
    }];
    [self.smsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneView);
        make.right.equalTo(self.mas_right).offset(-16.f);
    }];
    [self.smsButtonLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.smsButton);
        make.right.equalTo(self.smsButton.mas_left).offset(-16.f);
        make.size.equalTo(@(CGSizeMake(0.5, 18)));
    }];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneView);
        make.left.equalTo(self.phoneLogoImageView.mas_right).offset(16.f);
        make.right.equalTo(self.smsButtonLeftView.mas_left).offset(-16.f);
        make.height.equalTo(@(36));
    }];
    [self.smsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(20);
        make.left.equalTo(self);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 50)));
    }];
    [self.smsSeparatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self.smsView);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 64, 0.5)));
    }];
    [self.smsLogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.smsView);
        make.left.equalTo(self.smsSeparatorView.mas_left).offset(6);
        make.size.equalTo(@(CGSizeMake(20, 20)));
    }];
    [self.smsTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.smsView);
        make.left.equalTo(self.smsLogoImageView.mas_right).offset(16.f);
        make.right.equalTo(self.smsView.mas_right).offset(-16.f);
        make.height.equalTo(@(36));
    }];
    [self.agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16.0);
        make.width.height.equalTo(@(16.f));
        make.top.equalTo(self.smsView.mas_bottom).offset(16);
    }];
    [self.protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.agreementButton.mas_right).offset(8.0);
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(self.agreementButton.mas_top);
    }];
    [self.doButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.protocolLabel.mas_bottom).offset(24);
        make.left.equalTo(self.mas_left).offset(16.0);
        make.right.equalTo(self.mas_right).offset(-16);
        make.centerX.equalTo(self);
        make.height.equalTo(@(44));
    }];
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-16.0);
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(self.doButton.mas_bottom).offset(24);
    }];
}

- (void)toExcute:(UIButton *)sender {
    !self.tapHandle ?: self.tapHandle(sender.tag);
}

- (void)btnAgreeMentClick {
    self.agreementButton.selected = !self.agreementButton.selected;
    if (self.smsTextField.text.length == 6 && self.agreementButton.selected) {
        self.doButton.enabled = YES;
    } else {
        self.doButton.enabled = NO;
    }
}

- (void)smsTextChange:(UITextField *)textField {
    if (textField.text.length == 6 && self.agreementButton.selected) {
        self.doButton.enabled = YES;
    } else {
        self.doButton.enabled = NO;
    }
}

#pragma mark - lazy load
#pragma mark -

- (UIView *)phoneView {
    if (!_phoneView) {
        _phoneView = [[UIView alloc] init];
//        _phoneView.backgroundColor = YLZColorRed;
    }
    return _phoneView;
}

- (UIView *)phoneSeparatorView {
    if (!_phoneSeparatorView) {
        _phoneSeparatorView = [[UIView alloc] init];
        _phoneSeparatorView.backgroundColor = YLZColorTitleFour;
    }
    return _phoneSeparatorView;
}

- (UIImageView *)phoneLogoImageView {
    if (!_phoneLogoImageView) {
        _phoneLogoImageView = [[UIImageView alloc] init];
        _phoneLogoImageView.image = [UIImage imageNamed:@"ylz_process_tel"];
    }
    return _phoneLogoImageView;
}

- (UITextField *)phoneTextField {
    if(_phoneTextField == nil) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.font = [YLZFont regular:14];
        _phoneTextField.textColor = YLZColorTitleOne;
        _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
        _phoneTextField.text = @"15717914505";
        _phoneTextField.returnKeyType = UIReturnKeyDone;
        _phoneTextField.textAlignment = NSTextAlignmentLeft;
        _phoneTextField.userInteractionEnabled = NO;
    }
    return _phoneTextField;
}

- (UIButton *)smsButton
{
    if (!_smsButton) {
        _smsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_smsButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_smsButton setTitleColor:YLZColorLightBlueView forState:UIControlStateNormal];
        _smsButton.titleLabel.font = [YLZFont regular:14];
        _smsButton.ylz_acceptEventInterval = 3.0;
        _smsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _smsButton.tag = 0;
        [_smsButton addTarget:self action:@selector(toExcute:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _smsButton;
}

- (UIView *)smsButtonLeftView {
    if (!_smsButtonLeftView) {
        _smsButtonLeftView = [[UIView alloc] init];
        _smsButtonLeftView.backgroundColor = YLZColorTitleFour;
    }
    return _smsButtonLeftView;
}

- (UIView *)smsView {
    if (!_smsView) {
        _smsView = [[UIView alloc] init];
    }
    return _smsView;
}

- (UIView *)smsSeparatorView {
    if (!_smsSeparatorView) {
        _smsSeparatorView = [[UIView alloc] init];
        _smsSeparatorView.backgroundColor = YLZColorTitleFour;
    }
    return _smsSeparatorView;
}

- (UIImageView *)smsLogoImageView {
    if (!_smsLogoImageView) {
        _smsLogoImageView = [[UIImageView alloc] init];
        _smsLogoImageView.image = [UIImage imageNamed:@"ylz_process_sms"];
    }
    return _smsLogoImageView;
}

- (UITextField *)smsTextField {
    if(_smsTextField == nil) {
        _smsTextField = [[UITextField alloc] init];
        _smsTextField.font = [YLZFont regular:14];
        NSAttributedString *nameAttrString = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName:YLZColorTitleFour}];
        _smsTextField.attributedPlaceholder = nameAttrString;
        _smsTextField.textColor = YLZColorTitleOne;
        _smsTextField.maxLength = 6;
        _smsTextField.returnKeyType = UIReturnKeyDone;
        _smsTextField.keyboardType = UIKeyboardTypeNumberPad;
        _smsTextField.textAlignment = NSTextAlignmentLeft;
        [_smsTextField addTarget:self action:@selector(smsTextChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _smsTextField;
}

- (YLZEnlargeButton *)agreementButton {
    if (!_agreementButton) {
        _agreementButton = [[YLZEnlargeButton alloc] init];
        [_agreementButton setImage:[UIImage imageNamed:@"ylz_process_unselected"] forState:UIControlStateNormal];
        [_agreementButton setImage:[UIImage imageNamed:@"ylz_process_selected"] forState:UIControlStateSelected];
        [_agreementButton addTarget:self action:@selector(btnAgreeMentClick) forControlEvents:UIControlEventTouchUpInside];
        _agreementButton.enlargeEdge_ylz = UIEdgeInsetsMake(8, 8, 8, 50);
    }
    return _agreementButton;
}

- (YYLabel *)protocolLabel {
    if (!_protocolLabel) {
        _protocolLabel = [[YYLabel alloc] init];
        _protocolLabel.textAlignment = NSTextAlignmentCenter;
        NSDictionary *attributes = @{NSFontAttributeName:[YLZFont regular:12], NSForegroundColorAttributeName: YLZColorTitleThree};
        NSMutableAttributedString *agreementAttr = [[NSMutableAttributedString alloc] initWithString:@"同意并授权运营商查询本人在疫情七天内到访地信息" attributes:attributes];
        _protocolLabel.attributedText = agreementAttr;
        _protocolLabel.numberOfLines = 0;
        _protocolLabel.preferredMaxLayoutWidth = SCREENWIDTH-72;//YYLabel要换行需要设置最大宽度
    }
    return _protocolLabel;
}

- (UIButton *)doButton {
    if (!_doButton) {
        _doButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#80adf2"]] forState:UIControlStateDisabled];
        [_doButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#3f7aed"]] forState:UIControlStateNormal];
        _doButton.enabled = NO;
        [_doButton setTitle:@"查询" forState:UIControlStateNormal];
        [_doButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_doButton.titleLabel setFont:[YLZFont regular:16]];
        _doButton.tag = 1;
        _doButton.layer.masksToBounds = YES;
        _doButton.layer.cornerRadius = 4.0;
        [_doButton addTarget:self action:@selector(toExcute:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doButton;
}

- (UILabel *)introductionLabel {
    if (!_introductionLabel) {
        _introductionLabel = [[UILabel alloc] init];
        _introductionLabel.numberOfLines = 0;
        NSString *infoString = @"行程卡使用说明";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 2.0;
        NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle, NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:infoString attributes:dic];
        NSDictionary *attributes = @{NSFontAttributeName:[YLZFont regular:14], NSForegroundColorAttributeName: YLZColorLightBlueView};
        [attributeStr addAttributes:attributes range:NSMakeRange(0,infoString.length)];
        _introductionLabel.attributedText = attributeStr;
    }
    return _introductionLabel;
}

@end
