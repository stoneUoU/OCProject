//
//  YLZAcidCheckTableHeaderView.m
//  OCProject
//
//  Created by stone on 2022/8/29.
//

#import "YLZAcidCheckTableHeaderView.h"
#import "YLZEnlargeButton.h"

@interface YLZAcidCheckTableHeaderView()

@property (nonatomic, strong) UIView *anamorphosisView;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) YLZEnlargeButton *eyeButton;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *certLabel;

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UIButton *excuteButton;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, assign) BOOL eyeFlag;

@property (nonatomic, copy) NSString *nameDesensitizationString;
@property (nonatomic, copy) NSString *certDesensitizationString;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, copy) NSString *certString;

@end

@implementation YLZAcidCheckTableHeaderView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        self.backgroundColor = YLZColorWhite;
        self.eyeFlag = NO;
        self.nameDesensitizationString = @"*磊";
        self.certDesensitizationString = @"36**************10";
        self.nameString = @"林磊";
        self.certString = @"362324199610016010";
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
    [self addSubview:self.anamorphosisView];
    [self.anamorphosisView addSubview:self.picImageView];
    [self.anamorphosisView addSubview:self.statusLabel];
    [self.anamorphosisView addSubview:self.eyeButton];
    [self.anamorphosisView addSubview:self.nameLabel];
    [self.anamorphosisView addSubview:self.certLabel];
    [self addSubview:self.excuteButton];
    [self addSubview:self.separatorView];
    [self setMas];
}
    
 - (void)setMas {
     [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.anamorphosisView.mas_top).offset(16);
         make.left.equalTo(self.anamorphosisView.mas_left).offset(16);
     }];
     [self.eyeButton mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.statusLabel.mas_bottom).offset(16);
         make.left.equalTo(self.anamorphosisView.mas_left).offset(16);
     }];
     [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.eyeButton);
         make.left.equalTo(self.eyeButton.mas_right).offset(6);
     }];
     [self.certLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.eyeButton.mas_bottom).offset(16);
         make.left.equalTo(self.anamorphosisView.mas_left).offset(16);
     }];
     [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.right.equalTo(self.anamorphosisView);
         make.size.equalTo(@(CGSizeMake(160, 160)));
     }];
     [self.excuteButton mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.anamorphosisView.mas_bottom).offset(16);
         make.left.equalTo(self.mas_left).offset(16);
         make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 44)));
     }];
     [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.excuteButton.mas_bottom).offset(16);
         make.left.equalTo(self.mas_left);
         make.size.equalTo(@(CGSizeMake(SCREENWIDTH, 10)));
         make.bottom.equalTo(self.mas_bottom);
     }];
}
    
#pragma mark - IB-Action
#pragma mark -

- (void)toDone:(UIButton *)sender {
    self.eyeFlag = !self.eyeFlag;
    self.nameLabel.text = self.eyeFlag ? self.nameDesensitizationString : self.nameString;
    self.certLabel.text = self.eyeFlag ? self.certDesensitizationString : self.certString;
    [self.eyeButton setImage:[UIImage imageNamed:self.eyeFlag ? @"ylz_route_eye_close" : @"ylz_route_eye_open"] forState:UIControlStateNormal];
}

- (void)toExcute:(UIButton *)sender {
    
}
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UIView *)anamorphosisView {
    if(_anamorphosisView == nil) {
        _anamorphosisView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 160)];
        CAGradientLayer *statusGradient = [CAGradientLayer layer];
        statusGradient.frame = self.anamorphosisView.bounds;
        statusGradient.colors = @[(id)[UIColor colorWithHexString:@"f2f2f7"].CGColor,(id)[UIColor whiteColor].CGColor];
        statusGradient.startPoint = CGPointMake(1, 0);
        statusGradient.endPoint = CGPointMake(1, 1);
        [_anamorphosisView.layer addSublayer:statusGradient];
    }
    return _anamorphosisView;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
        _statusLabel.font = [YLZFont medium:24];
        _statusLabel.textColor = YLZColorTitleOne;
        _statusLabel.text = @"阴性";
    }
    return _statusLabel;
}

- (YLZEnlargeButton *)eyeButton
{
    if (!_eyeButton) {
        _eyeButton = [YLZEnlargeButton buttonWithType:UIButtonTypeCustom];
        [_eyeButton setImage:[UIImage imageNamed:@"ylz_route_eye_close"] forState:UIControlStateNormal];
        _eyeButton.tag = 0;
        _eyeButton.enlargeEdge_ylz = UIEdgeInsetsMake(5, 5, 5, 5);
        [_eyeButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _eyeButton;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [YLZFont medium:20];
        _nameLabel.textColor = YLZColorTitleOne;
        _nameLabel.text = self.nameDesensitizationString;
    }
    return _nameLabel;
}

- (UILabel *)certLabel {
    if (!_certLabel) {
        _certLabel = [UILabel new];
        _certLabel.font = [YLZFont medium:16];
        _certLabel.textColor = YLZColorTitleOne;
        _certLabel.text = self.certDesensitizationString;
    }
    return _certLabel;
}

- (UIImageView *)picImageView {
    if(_picImageView == nil) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.image = [UIImage imageNamed:@"ylz_acid_check"];
    }
    return _picImageView;
}

- (UIButton *)excuteButton {
    if (!_excuteButton) {
        _excuteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _excuteButton.titleLabel.font = [YLZFont medium:16];
        _excuteButton.layer.cornerRadius = 22;
        _excuteButton.layer.masksToBounds = YES;
        _excuteButton.layer.borderWidth = 1.0;
        _excuteButton.layer.borderColor = [[UIColor colorWithHexString:@"#4955bd"] CGColor];
        _excuteButton.backgroundColor = YLZColorWhite;
        [_excuteButton setTitleColor:[UIColor colorWithHexString:@"#4955bd"] forState:UIControlStateNormal];
        _excuteButton.tag = 0;
        [_excuteButton setTitle:@"查询省外核酸检测记录" forState:UIControlStateNormal];
        [_excuteButton addTarget:self action:@selector(toExcute:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _excuteButton;
}

- (UIView *)separatorView {
    if(_separatorView == nil) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = YLZColorPlace;
    }
    return _separatorView;
}

@end
