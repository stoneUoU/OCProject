//
//  YLZRouteCodeCellView.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeCellView.h"
#import "YLZCategory.h"
#import <ZSCodeUtil/ZSCode.h>
#import "YLZTimerHelper.h"

@interface YLZRouteCodeCellView()

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIView *codeGradientView;

@property (nonatomic, strong) UIImageView *qrCodeImageView;

@property (nonatomic, strong) UIView *logoView;

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UILabel *stateLabel;

@property (copy, nonatomic) NSString *task;

@property (nonatomic, strong) UIView *operateView;
@property (nonatomic, strong) UIView *brightCodeView;
@property (nonatomic, strong) UIImageView *brightImageView;
@property (nonatomic, strong) UILabel *brightLabel;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UIView *avaterView;
@property (nonatomic, strong) UIImageView *avaterImageView;
@property (nonatomic, strong) UILabel *avaterLabel;

@property (nonatomic, strong) UIImageView *avaterPicView;

@property (nonatomic, strong) UIButton *scanButton;

@end

@implementation YLZRouteCodeCellView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        [self setUI];
        self.task = [YLZTimerHelper execTask:self selector:@selector(doTask) start:0.0 interval:1.0 repeats:YES async:NO];
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
    [self addSubview:self.timeLabel];
    
    [self addSubview:self.operateView];
    [self.operateView addSubview:self.brightCodeView];
    [self.brightCodeView addSubview:self.brightImageView];
    [self.brightCodeView addSubview:self.brightLabel];
    [self.operateView addSubview:self.separatorView];
    [self.operateView addSubview:self.avaterView];
    [self.avaterView addSubview:self.avaterImageView];
    [self.avaterView addSubview:self.avaterLabel];
    
    [self addSubview:self.codeGradientView];
    [self addSubview:self.qrCodeImageView];
    [self addSubview:self.logoView];
    [self.logoView addSubview:self.logoImageView];
    [self addSubview:self.stateLabel];
    [self addSubview:self.avaterPicView];
    
    [self addSubview:self.scanButton];
    
    [self setMas];
}
    
 - (void)setMas {
     [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(16);
         make.centerX.equalTo(self);
     }];
     
     [self.codeGradientView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.timeLabel.mas_bottom).offset(8);
         make.centerX.equalTo(self);
         make.size.equalTo(@(CGSizeMake(218, 218)));
     }];
     [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.center.equalTo(self.codeGradientView);
         make.size.equalTo(@(CGSizeMake(208, 208)));
     }];
     [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.center.equalTo(self.qrCodeImageView);
         make.size.equalTo(@(CGSizeMake(32, 32)));
     }];
     [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.center.equalTo(self.logoView);
         make.size.equalTo(@(CGSizeMake(28, 28)));
     }];
     [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.codeGradientView.mas_bottom).offset(12);
         make.centerX.equalTo(self);
     }];
     
     [self.operateView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.codeGradientView);
         make.left.equalTo(self.codeGradientView.mas_right).offset(-8);
         make.size.equalTo(@(CGSizeMake(48, 120)));
     }];
     [self.brightCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.left.right.equalTo(self.operateView);
         make.height.equalTo(@(60));
     }];
     [self.brightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.brightCodeView.mas_top).offset(8);
         make.centerX.equalTo(self.brightCodeView);
     }];
     [self.brightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(self.brightCodeView.mas_bottom).offset(-8);
         make.centerX.equalTo(self.brightCodeView);
     }];
     [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.operateView);
         make.left.equalTo(self.operateView);
         make.size.equalTo(@(CGSizeMake(48, 0.5)));
     }];
     
     [self.avaterView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.left.right.equalTo(self.operateView);
         make.height.equalTo(@(60));
     }];
     [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.avaterView.mas_top).offset(8);
         make.centerX.equalTo(self.avaterView);
     }];
     [self.avaterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(self.avaterView.mas_bottom).offset(-8);
         make.centerX.equalTo(self.avaterView);
     }];
     [self.avaterPicView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self.codeGradientView);
     }];
     [self.scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self);
         make.top.equalTo(self.stateLabel.mas_bottom).offset(13);
         make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 120, 44)));
     }];
     
     [self.codeGradientView layoutIfNeeded];
     CAGradientLayer *statusGradient = [CAGradientLayer layer];
     statusGradient.frame = self.codeGradientView.bounds;
     statusGradient.colors = @[(id)[UIColor colorWithHexString:@"ecbc6b"].CGColor,(id)[UIColor colorWithHexString:@"f6eb9c"].CGColor,(id)[UIColor colorWithHexString:@"e48344"].CGColor];
     statusGradient.startPoint = CGPointMake(0, 1);
     statusGradient.endPoint = CGPointMake(1, 1);
     [self.codeGradientView.layer addSublayer:statusGradient];
}

- (void)setClickNum:(NSInteger)clickNum {
    if (clickNum == 0) {
        [self formatWithString:@"绿码：健康状态为低风险" location:0 fontColor:[UIColor colorWithHexString:@"#609f6c"]];
        self.qrCodeImageView.image = [ZSGenerateCodeUtil zs_QRCode:[NSString ylz_randomStringWithLength:100] size:CGSizeMake(228, 228) color:[UIColor colorWithHexString:@"#609f6c"] backgroudColor:YLZColorWhite];
    } else if (clickNum == 1) {
        [self formatWithString:@"黄码：健康状态为中风险" location:0 fontColor:[UIColor colorWithHexString:@"#F7ce44"]];
        self.qrCodeImageView.image = [ZSGenerateCodeUtil zs_QRCode:[NSString ylz_randomStringWithLength:100] size:CGSizeMake(228, 228) color:[UIColor colorWithHexString:@"#F7ce44"] backgroudColor:YLZColorWhite];
    } else {
        [self formatWithString:@"红码：健康状态为高风险" location:0 fontColor:[UIColor colorWithHexString:@"#eb3223"]];
        self.qrCodeImageView.image = [ZSGenerateCodeUtil zs_QRCode:[NSString ylz_randomStringWithLength:100] size:CGSizeMake(228, 228) color:[UIColor colorWithHexString:@"#eb3223"] backgroudColor:YLZColorWhite];
    }
}

- (void)doTask {
    self.timeLabel.text = [self formatDate];
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
    
#pragma mark - IB-Action
#pragma mark -

- (void)toExcute:(UIButton *)sender {
    
}

- (void)toRecognizer:(UITapGestureRecognizer *)sender {
    UIView *view = sender.view;
    if (view.tag == 0) {
        self.brightImageView.image = [UIImage imageNamed:@"ylz_qrcode_bright"];
        self.brightLabel.textColor = YLZColorCodeBlue;
        
        self.avaterImageView.image = [UIImage imageNamed:@"ylz_personal_info_bright"];
        self.avaterLabel.textColor = YLZColorTitleTwo;
        
        self.avaterPicView.hidden = YES;
        self.codeGradientView.hidden = NO;
        
        self.brightCodeView.backgroundColor = YLZColorWhite;
        self.avaterView.backgroundColor = YLZColorCodeButtonbgColor;
        
    } else {
        self.brightImageView.image = [UIImage imageNamed:@"ylz_qrcode_bleak"];
        self.brightLabel.textColor = YLZColorTitleTwo;
        
        self.avaterImageView.image = [UIImage imageNamed:@"ylz_personal_info_bleak"];
        self.avaterLabel.textColor = YLZColorCodeBlue;
        
        self.avaterPicView.hidden = NO;
        self.codeGradientView.hidden = YES;
        
        self.brightCodeView.backgroundColor = YLZColorCodeButtonbgColor;
        self.avaterView.backgroundColor = YLZColorWhite;
    }
}
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [YLZFont bold:24];
        _timeLabel.textColor = YLZColorTitleOne;
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

- (UIView *)logoView {
    if (!_logoView) {
        _logoView = [UIView new];
        _logoView.layer.masksToBounds = YES;
        _logoView.layer.cornerRadius = 3.0;
        _logoView.backgroundColor = YLZColorWhite;
    }
    return _logoView;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [UIImageView new];
        _logoImageView.layer.masksToBounds = YES;
        _logoImageView.layer.cornerRadius = 3.0;
        _logoImageView.image = [UIImage imageNamed:@"ylz_code_middle_logo"];
    }
    return _logoImageView;
}

- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
    }
    return _stateLabel;
}

- (UIView *)operateView {
    if (!_operateView) {
        _operateView = [UIView new];
        _operateView.layer.cornerRadius = 8.0;
        _operateView.layer.masksToBounds = YES;
        _operateView.layer.borderColor = [YLZColorLine CGColor];
        _operateView.layer.borderWidth = 0.5;
        _operateView.clipsToBounds = YES;
    }
    return _operateView;
}

- (UIView *)brightCodeView {
    if (!_brightCodeView) {
        _brightCodeView = [UIView new];
        _brightCodeView.tag = 0;
        _brightCodeView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toRecognizer:)];
        [_brightCodeView addGestureRecognizer:recognizer];
    }
    return _brightCodeView;
}

- (UIImageView *)brightImageView {
    if (!_brightImageView) {
        _brightImageView = [UIImageView new];
        _brightImageView.image = [UIImage imageNamed:@"ylz_qrcode_bright"];
    }
    return _brightImageView;
}

- (UILabel *)brightLabel {
    if (!_brightLabel) {
        _brightLabel = [UILabel new];
        _brightLabel.font = [YLZFont regular:12];
        _brightLabel.textColor = YLZColorTitleOne;
        _brightLabel.text = @"亮码";
    }
    return _brightLabel;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = YLZColorLine;
    }
    return _separatorView;
}

- (UIView *)avaterView {
    if (!_avaterView) {
        _avaterView = [UIView new];
        _avaterView.tag = 1;
        _avaterView.backgroundColor = YLZColorCodeButtonbgColor;
        _avaterView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toRecognizer:)];
        [_avaterView addGestureRecognizer:recognizer];
    }
    return _avaterView;
}

- (UIImageView *)avaterImageView {
    if (!_avaterImageView) {
        _avaterImageView = [UIImageView new];
        _avaterImageView.image = [UIImage imageNamed:@"ylz_personal_info_bright"];
    }
    return _avaterImageView;
}

- (UILabel *)avaterLabel {
    if (!_avaterLabel) {
        _avaterLabel = [UILabel new];
        _avaterLabel.font = [YLZFont regular:12];
        _avaterLabel.textColor = YLZColorTitleOne;
        _avaterLabel.text = @"人像";
    }
    return _avaterLabel;
}

- (UIImageView *)avaterPicView {
    if (!_avaterPicView) {
        _avaterPicView = [UIImageView new];
        _avaterPicView.backgroundColor = YLZColorCodeButtonbgColor;
        _avaterPicView.image = [UIImage imageNamed:@"ylz_mine_avater"];
        _avaterPicView.hidden = YES;
        _avaterPicView.layer.cornerRadius = 8.0;
        _avaterPicView.layer.masksToBounds = YES;
        _avaterPicView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avaterPicView;
}

- (UIButton *)scanButton {
    if (!_scanButton) {
        _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _scanButton.titleLabel.font = [YLZFont regular:18];
        _scanButton.backgroundColor = YLZColorCodeBlue;
        [_scanButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        _scanButton.tag = 0;
        [_scanButton setTitle:@"扫一扫" forState:UIControlStateNormal];
        _scanButton.layer.cornerRadius = 22;
        _scanButton.layer.shadowColor = [YLZColorCodeBlue CGColor];
        _scanButton.layer.shadowOffset = CGSizeMake(0, 6);
        _scanButton.layer.shadowOpacity = 1;
        _scanButton.layer.shadowRadius = 12;
        [_scanButton addTarget:self action:@selector(toExcute:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanButton;
}

@end
