//
//  YLZHealthCodeTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import <ZSCodeUtil/ZSCode.h>
#import "YLZHealthCodeTableViewCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"
#import "YLZTimerHelper.h"

@interface YLZHealthCodeTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIView *codeGradientView;

@property (nonatomic, strong) UIImageView *qrCodeImageView;

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UILabel *codeLabel;

@property (nonatomic, strong) UIButton *fastButton;

@property (nonatomic, strong) UIButton *vaccineButton;

@property (nonatomic, strong) UIImageView *dashImageView;

@property (nonatomic, strong) UIButton *familyButton;

@property (nonatomic, strong) UIButton *onlineButton;

@property (nonatomic, strong) UIButton *serviceButton;

@property (copy, nonatomic) NSString *task;

@end

@implementation YLZHealthCodeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorMZTBlueView;
        [self setUI];
        self.task = [YLZTimerHelper execTask:self selector:@selector(doTask) start:0.0 interval:1.0 repeats:YES async:NO];
    }
    return self;
}

- (void)setClickNum:(NSInteger)clickNum {
    if (clickNum == 0) {
        [self formatWithString:@"健康状况核验 未见异常【绿码】" location:7 fontColor:[UIColor colorWithHexString:@"#6ab069"]];
        self.qrCodeImageView.image = [ZSGenerateCodeUtil zs_QRCode:[NSString ylz_randomStringWithLength:100] size:CGSizeMake(228, 228) color:[UIColor colorWithHexString:@"#6ab069"] backgroudColor:YLZColorWhite];
    } else if (clickNum == 1) {
        [self formatWithString:@"健康状况核验 建议隔离【橙码】" location:7 fontColor:[UIColor colorWithHexString:@"#F7ce44"]];
        self.qrCodeImageView.image = [ZSGenerateCodeUtil zs_QRCode:[NSString ylz_randomStringWithLength:100] size:CGSizeMake(228, 228) color:[UIColor colorWithHexString:@"#F7ce44"] backgroudColor:YLZColorWhite];
    } else {
        [self formatWithString:@"健康状况核验 强制隔离【红码】" location:7 fontColor:[UIColor colorWithHexString:@"#eb3223"]];
        self.qrCodeImageView.image = [ZSGenerateCodeUtil zs_QRCode:[NSString ylz_randomStringWithLength:100] size:CGSizeMake(228, 228) color:[UIColor colorWithHexString:@"#eb3223"] backgroudColor:YLZColorWhite];
    }
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.stateLabel];
    [self.bgView addSubview:self.timeLabel];
    [self.bgView addSubview:self.leftImageView];
    [self.bgView addSubview:self.rightImageView];
    [self.bgView addSubview:self.codeGradientView];
    [self.bgView addSubview:self.qrCodeImageView];
    [self.bgView addSubview:self.logoImageView];
    [self.bgView addSubview:self.codeLabel];
    
    [self.bgView addSubview:self.fastButton];
    [self.bgView addSubview:self.vaccineButton];
    [self.bgView addSubview:self.familyButton];
    [self.bgView addSubview:self.onlineButton];
    [self.bgView addSubview:self.serviceButton];
    
    [self.bgView addSubview:self.dashImageView];
    
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(72);
        make.left.equalTo(self.bgView);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(72);
        make.right.equalTo(self.bgView);
    }];
    
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(16);
        make.centerX.equalTo(self.bgView);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.stateLabel.mas_bottom).offset(8);
        make.centerX.equalTo(self.bgView);
    }];
    
    [self.codeGradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(8);
        make.centerX.equalTo(self.bgView);
        make.size.equalTo(@(CGSizeMake(240, 240)));
    }];
    
    [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.codeGradientView);
        make.size.equalTo(@(CGSizeMake(230, 230)));
    }];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.qrCodeImageView);
        make.size.equalTo(@(CGSizeMake(40, 40)));
    }];
    
    [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeGradientView.mas_bottom).offset(12);
        make.centerX.equalTo(self.bgView);
    }];
    
    [self.fastButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeLabel.mas_bottom).offset(12);
        make.centerX.equalTo(self.bgView).offset(-72);
        make.size.equalTo(@(CGSizeMake(136, 32)));
    }];
    [self.vaccineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeLabel.mas_bottom).offset(12);
        make.centerX.equalTo(self.bgView).offset(72);
        make.size.equalTo(@(CGSizeMake(136, 32)));
    }];
    [self.familyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView.mas_bottom);
        make.left.equalTo(self.bgView);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 32)/3, 44)));
    }];
    [self.onlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView.mas_bottom);
        make.left.equalTo(self.familyButton.mas_right);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 32)/3, 44)));
    }];
    [self.serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView.mas_bottom);
        make.left.equalTo(self.onlineButton.mas_right);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 32)/3, 44)));
    }];
    [self.dashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.familyButton.mas_top);
        make.left.equalTo(self.bgView.mas_left).offset(12);
        make.right.equalTo(self.bgView.mas_right).offset(-12);
        make.height.equalTo(@(2));
    }];
    [YLZImageHelper drawLineByImageView:self.dashImageView withDashColor:YLZColorLine];
    
    [self.codeGradientView layoutIfNeeded];
    CAGradientLayer *statusGradient = [CAGradientLayer layer];
    statusGradient.frame = self.codeGradientView.bounds;
    statusGradient.colors = @[(id)[UIColor colorWithHexString:@"ecbc6b"].CGColor,(id)[UIColor colorWithHexString:@"f6eb9c"].CGColor,(id)[UIColor colorWithHexString:@"e48344"].CGColor];
    statusGradient.startPoint = CGPointMake(0, 1);
    statusGradient.endPoint = CGPointMake(1, 1);
    [self.codeGradientView.layer addSublayer:statusGradient];
}

- (NSString *)formatDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *dateNow = [NSDate date];
    NSString *currentString = [formatter stringFromDate:dateNow];
    return currentString;
}

- (void)formatWithString:(NSString *)textString location:(NSInteger )location fontColor:(UIColor *)fontColor {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 0.0;
    NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle};
    // 配置富文本
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:textString attributes:dic];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:YLZColorTitleOne range:NSMakeRange(0, location)];
    [attributeStr addAttribute:NSFontAttributeName value:[YLZFont regular:18] range:NSMakeRange(0, location)];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:fontColor range:NSMakeRange(location, textString.length-location)];
    [attributeStr addAttribute:NSFontAttributeName value:[YLZFont bold:18] range:NSMakeRange(location, textString.length-location)];
    self.stateLabel.attributedText = attributeStr;
}

- (void)doTask {
    self.timeLabel.text = [self formatDate];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
    
}

#pragma mark - getter

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = YLZColorWhite;
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 10.0;
        _bgView.layer.shadowColor = [UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1].CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0,6);
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.shadowRadius = 12;
    }
    return _bgView;
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
        _leftImageView.image = [UIImage imageNamed:@"ylz_mzt_left"];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [UIImageView new];
        _rightImageView.image = [UIImage imageNamed:@"ylz_mzt_right"];
    }
    return _rightImageView;
}

- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        NSString *textString = @"健康状况核验 未见异常【绿码】";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 0.0;
        NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle};
        // 配置富文本
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:textString attributes:dic];
        [attributeStr addAttribute:NSForegroundColorAttributeName value:YLZColorTitleOne range:NSMakeRange(0, 7)];
        [attributeStr addAttribute:NSFontAttributeName value:[YLZFont regular:18] range:NSMakeRange(0, 7)];
        [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#6ab069"] range:NSMakeRange(7, textString.length-7)];
        [attributeStr addAttribute:NSFontAttributeName value:[YLZFont bold:18] range:NSMakeRange(7, textString.length-7)];
        _stateLabel.attributedText = attributeStr;
    }
    return _stateLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [YLZFont medium:22];
        _timeLabel.textColor = YLZColorBlue;
        _timeLabel.text = [self formatDate];
    }
    return _timeLabel;
}

- (UIView *)codeGradientView {
    if (!_codeGradientView) {
        _codeGradientView = [UIView new];
        _codeGradientView.layer.masksToBounds = YES;
        _codeGradientView.layer.cornerRadius = 12.0;
    }
    return _codeGradientView;
}

- (UIImageView *)qrCodeImageView {
    if (!_qrCodeImageView) {
        _qrCodeImageView = [UIImageView new];
        _qrCodeImageView.layer.masksToBounds = YES;
        _qrCodeImageView.layer.cornerRadius = 12.0;
    }
    return _qrCodeImageView;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [UIImageView new];
        _logoImageView.layer.masksToBounds = YES;
        _logoImageView.layer.cornerRadius = 3.0;
        _logoImageView.image = [UIImage imageNamed:@"ylz_mzt_logo"];
    }
    return _logoImageView;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel new];
        _codeLabel.font = [YLZFont regular:16];
        _codeLabel.textColor = YLZColorTitleOne;
        _codeLabel.text = [NSString ylz_randomStringWithLength:18];
    }
    return _codeLabel;
}

- (UIButton *)fastButton {
    if (!_fastButton) {
        _fastButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _fastButton.titleLabel.font = [YLZFont regular:14];
        _fastButton.layer.cornerRadius = 16;
        _fastButton.layer.masksToBounds = YES;
        _fastButton.backgroundColor = [UIColor colorWithHexString:@"#e5ecf8"];
        [_fastButton setTitleColor:YLZColorMZTBlueView forState:UIControlStateNormal];
        _fastButton.tag = 0;
        [_fastButton setTitle:@"创建桌面快捷方式" forState:UIControlStateNormal];
        [_fastButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fastButton;
}

- (UIButton *)vaccineButton {
    if (!_vaccineButton) {
        _vaccineButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _vaccineButton.titleLabel.font = [YLZFont regular:14];
        _vaccineButton.layer.cornerRadius = 16;
        _vaccineButton.layer.masksToBounds = YES;
        _vaccineButton.backgroundColor = [UIColor colorWithHexString:@"#fcf3ba"];
        [_vaccineButton setTitleColor:YLZColorGoldView forState:UIControlStateNormal];
        _vaccineButton.tag = 1;
        [_vaccineButton setTitle:@"接种新冠疫苗x2" forState:UIControlStateNormal];
        [_vaccineButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _vaccineButton;
}

- (UIButton *)familyButton {
    if (!_familyButton) {
        _familyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _familyButton.titleLabel.font = [YLZFont regular:14];
        [_familyButton setTitleColor:YLZColorMZTBlueView forState:UIControlStateNormal];
        _familyButton.tag = 2;
        [_familyButton setTitle:@"家人健康码" forState:UIControlStateNormal];
        [_familyButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _familyButton;
}

- (UIButton *)onlineButton {
    if (!_onlineButton) {
        _onlineButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _onlineButton.titleLabel.font = [YLZFont regular:14];
        [_onlineButton setTitleColor:YLZColorMZTBlueView forState:UIControlStateNormal];
        _onlineButton.tag = 3;
        [_onlineButton setTitle:@"在线咨询" forState:UIControlStateNormal];
        [_onlineButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _onlineButton;
}

- (UIButton *)serviceButton {
    if (!_serviceButton) {
        _serviceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _serviceButton.titleLabel.font = [YLZFont regular:14];
        [_serviceButton setTitleColor:YLZColorMZTBlueView forState:UIControlStateNormal];
        _serviceButton.tag = 4;
        [_serviceButton setTitle:@"人工客服" forState:UIControlStateNormal];
        [_serviceButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _serviceButton;
}

- (UIImageView *)dashImageView {
    if (!_dashImageView) {
        _dashImageView = [UIImageView new];
    }
    return _dashImageView;
}

@end




