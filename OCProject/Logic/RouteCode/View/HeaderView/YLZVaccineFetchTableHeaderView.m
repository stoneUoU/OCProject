//
//  YLZVaccineFetchTableHeaderView.m
//  OCProject
//
//  Created by stone on 2022/9/30.
//

#import "YLZVaccineFetchTableHeaderView.h"
#import <SDWebImage/SDWebImage.h>

@interface YLZVaccineFetchTableHeaderView()

@property (nonatomic, strong) UIView *anamorphosisView;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *certLabel;

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation YLZVaccineFetchTableHeaderView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        self.backgroundColor = YLZColorWhite;
        [self setUI];
        NSString *picString = @"https://fjjkm3.nebulabd.cn/res/ZTkfjJA0IO/vaccination/normal.png";
        [self.picImageView sd_setImageWithURL:[NSURL URLWithString:picString]
                             placeholderImage:[UIImage imageNamed:@""]];
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
    [self.anamorphosisView addSubview:self.nameLabel];
    [self.anamorphosisView addSubview:self.certLabel];
    [self addSubview:self.separatorView];
    [self setMas];
}
    
 - (void)setMas {
     [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.anamorphosisView.mas_top).offset(72);
         make.left.equalTo(self.anamorphosisView.mas_left).offset(16);
     }];
     [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.statusLabel.mas_bottom).offset(32);
         make.left.equalTo(self.anamorphosisView.mas_left).offset(16);
     }];
     [self.certLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.nameLabel.mas_bottom).offset(12);
         make.left.equalTo(self.anamorphosisView.mas_left).offset(16);
     }];
     [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.anamorphosisView.mas_top).offset(-8);
         make.right.equalTo(self.anamorphosisView.mas_right).offset(16);
         make.size.equalTo(@(CGSizeMake(160, 160)));
     }];
     [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.certLabel.mas_bottom).offset(24);
         make.left.equalTo(self.mas_left);
         make.size.equalTo(@(CGSizeMake(SCREENWIDTH, 10)));
         make.bottom.equalTo(self.mas_bottom);
     }];
}
    
#pragma mark - IB-Action
#pragma mark -

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
        statusGradient.colors = @[(id)[UIColor colorWithHexString:@"dbf3e6"].CGColor,(id)[UIColor whiteColor].CGColor];
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
        _statusLabel.text = @"已全程接种";
    }
    return _statusLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [YLZFont medium:20];
        _nameLabel.textColor = YLZColorTitleOne;
        _nameLabel.text = @"*磊";
    }
    return _nameLabel;
}

- (UILabel *)certLabel {
    if (!_certLabel) {
        _certLabel = [UILabel new];
        _certLabel.font = [YLZFont medium:16];
        _certLabel.textColor = YLZColorTitleOne;
        _certLabel.text = @"36**************10";
    }
    return _certLabel;
}

- (UIImageView *)picImageView {
    if(_picImageView == nil) {
        _picImageView = [[UIImageView alloc] init];
    }
    return _picImageView;
}

- (UIView *)separatorView {
    if(_separatorView == nil) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = YLZColorPlace;
    }
    return _separatorView;
}

@end
