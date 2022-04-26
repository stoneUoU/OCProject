//
//  YLZRouteCodeCellInfoView.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeCellInfoView.h"
#import "YLZEnlargeButton.h"

typedef void(^YLZRouteCodeCellInfoViewHandle)(void);

@interface YLZRouteCodeCellInfoView()

@property (nonatomic, strong) YLZEnlargeButton *eyeButton;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *certLabel;

@property (nonatomic, strong) UIImageView *familyIconImageView;

@property (nonatomic, strong) UILabel *familyCodeLabel;

@property (nonatomic, strong) UIImageView *dashImageView;

@property (nonatomic, copy) YLZRouteCodeCellInfoViewHandle handle;

@property (nonatomic, assign) BOOL eyeFlag;

@property (nonatomic, copy) NSString *nameDesensitizationString;
@property (nonatomic, copy) NSString *certDesensitizationString;
@property (nonatomic, copy) NSString *nameString;
@property (nonatomic, copy) NSString *certString;

@end

@implementation YLZRouteCodeCellInfoView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        self.eyeFlag = NO;
        self.nameDesensitizationString = @"*磊";
        self.certDesensitizationString = @"362324********6010";
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
    [self addSubview:self.eyeButton];
    [self addSubview:self.nameLabel];
    [self addSubview:self.certLabel];
    [self addSubview:self.familyIconImageView];
    [self addSubview:self.familyCodeLabel];
    [self addSubview:self.dashImageView];
    [self setMas];
}
    
 - (void)setMas {
     [self.eyeButton mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(8);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.eyeButton);
         make.left.equalTo(self.eyeButton.mas_right).offset(6);
     }];
     [self.certLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(self.mas_bottom).offset(-8);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.familyCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self);
         make.right.equalTo(self.mas_right).offset(-16);
     }];
     [self.familyIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self);
         make.right.equalTo(self.familyCodeLabel.mas_left).offset(-6);
     }];
     [self.dashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.right.equalTo(self);
     }];
}
    
#pragma mark - IB-Action
#pragma mark -

- (void)toDone:(UIButton *)sender {
    self.eyeFlag = !self.eyeFlag;
    self.nameLabel.text = self.eyeFlag ? self.nameDesensitizationString : self.nameString;
    self.certLabel.text = self.eyeFlag ? self.certDesensitizationString : self.certString;
}

- (void)toRecognizer:(UIGestureRecognizer *)sender {
    if (self.handle != nil) {
        self.handle();
    }
}
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (YLZEnlargeButton *)eyeButton
{
    if (!_eyeButton) {
        _eyeButton = [YLZEnlargeButton buttonWithType:UIButtonTypeCustom];
        [_eyeButton setImage:[UIImage imageNamed:@"ylz_route_eye_close"] forState:UIControlStateNormal];
        _eyeButton.tag = 0;
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
        _certLabel.font = [YLZFont medium:18];
        _certLabel.textColor = YLZColorTitleTwo;
        _certLabel.text = self.certDesensitizationString;
    }
    return _certLabel;
}

- (UILabel *)familyCodeLabel {
    if (!_familyCodeLabel) {
        _familyCodeLabel = [UILabel new];
        _familyCodeLabel.font = [YLZFont bold:16];
        _familyCodeLabel.textColor = YLZColorCodeBlue;
        _familyCodeLabel.text = @"亲友亮码";
        _familyCodeLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toRecognizer:)];
        [_familyCodeLabel addGestureRecognizer:ges];
    }
    return _familyCodeLabel;
}

- (UIImageView *)familyIconImageView {
    if(_familyIconImageView == nil) {
        _familyIconImageView = [[UIImageView alloc] init];
        _familyIconImageView.image = [UIImage imageNamed:@"ylz_qrcode_bright"];
    }
    return _familyIconImageView;
}

- (UIImageView *)dashImageView {
    if(_dashImageView == nil) {
        _dashImageView = [[UIImageView alloc] init];
        _dashImageView.frame = CGRectMake(16, 74, SCREENWIDTH - (48+32), 2);
    }
    return _dashImageView;
}

@end


