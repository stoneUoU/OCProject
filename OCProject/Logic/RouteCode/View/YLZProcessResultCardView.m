//
//  YLZProcessResultCardView.m
//  OCProject
//
//  Created by stone on 2022/9/1.
//

#import "YLZProcessResultCardView.h"
#import "UIButton+YLZFixMultiClick.h"
#import "UITextField+YLZExtension.h"
#import "YLZEnlargeButton.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YLZProcessResultCardView() {
    
}

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UIView *fontView;

@property (nonatomic, strong) UIImageView *fontLeftImageView;

@property (nonatomic, strong) UIImageView *fontRightImageView;

@property (nonatomic, strong) UIView *middleView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *processLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIView *arrowView;

@property (nonatomic, strong) UIImageView *arrowImageView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UILabel *cityLabel;

@end

@implementation YLZProcessResultCardView

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
    [self addSubview:self.topView];
    [self addSubview:self.middleView];
    [self.middleView addSubview:self.fontLeftImageView];
    [self.middleView addSubview:self.fontView];
    [self.middleView addSubview:self.fontRightImageView];
    [self addSubview:self.titleLabel];
    [self.middleView addSubview:self.processLabel];
    [self.middleView addSubview:self.timeLabel];
    [self.middleView addSubview:self.arrowView];
    [self.arrowView addSubview:self.arrowImageView];
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.separatorView];
    [self.bottomView addSubview:self.cityLabel];
    
    [self setMas];
}
    
- (void)setMas {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 20)));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_top).offset(8);
        make.centerX.equalTo(self);
    }];
    [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom);
        make.left.equalTo(self);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 320)));
    }];
    [self.fontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleView.mas_top);
        make.centerX.equalTo(self);
        make.size.equalTo(@(CGSizeMake(108, 14)));
    }];
    [self.fontLeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleView.mas_top);
        make.right.equalTo(self.fontView.mas_left);
        make.height.equalTo(@(14));
    }];
    [self.fontRightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleView.mas_top);
        make.left.equalTo(self.fontView.mas_right);
        make.height.equalTo(@(14));
    }];
    [self.processLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLeftImageView.mas_bottom).offset(16);
        make.centerX.equalTo(self);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processLabel.mas_bottom).offset(12);
        make.centerX.equalTo(self);
    }];
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(12);
        make.width.equalTo(@(SCREENWIDTH - 32));
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.middleView.mas_bottom);
    }];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.arrowView);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 80)));
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView.mas_top);
        make.centerX.equalTo(self.bottomView);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 64, 0.5)));
    }];
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView.mas_left).offset(16);
        make.right.equalTo(self.bottomView.mas_right).offset(-16);
        make.centerY.equalTo(self.bottomView);
    }];
}

- (void)toExcute:(UIButton *)sender {

}

- (void)btnAgreeMentClick {

}

#pragma mark - lazy load
#pragma mark -

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor colorWithHexString:@"#ddede1"];
    }
    return _topView;
}

- (UIView *)middleView {
    if (!_middleView) {
        _middleView = [[UIView alloc] init];
//        _middleView.backgroundColor = YLZColorGreen;
    }
    return _middleView;
}

- (UIView *)fontView {
    if (!_fontView) {
        _fontView = [[UIView alloc] init];
        _fontView.backgroundColor = [UIColor colorWithHexString:@"#ddede1"];
    }
    return _fontView;
}

- (UIImageView *)fontLeftImageView {
    if (!_fontLeftImageView) {
        _fontLeftImageView = [[UIImageView alloc] init];
        _fontLeftImageView.image = [UIImage imageNamed:@"ylz_process_result_left"];
    }
    return _fontLeftImageView;
}

- (UIImageView *)fontRightImageView {
    if (!_fontRightImageView) {
        _fontRightImageView = [[UIImageView alloc] init];
        _fontRightImageView.image = [UIImage imageNamed:@"ylz_process_result_right"];
    }
    return _fontRightImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont regular:12];
        _titleLabel.textColor = YLZColorTitleTwo;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"请收下绿色行程卡";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)processLabel {
    if (!_processLabel) {
        _processLabel = [UILabel new];
        _processLabel.font = [YLZFont medium:18];
        _processLabel.textColor = YLZColorTitleOne;
        _processLabel.textAlignment = NSTextAlignmentCenter;
        NSString *infoString = @"157****4505的动态行程卡";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 2.0;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle, NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone)};
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:infoString attributes:dic];
        NSDictionary *attributes = @{NSFontAttributeName:[YLZFont bold:18], NSForegroundColorAttributeName: YLZColorTitleOne};
        [attributeStr addAttributes:attributes range:NSMakeRange(0,11)];
        _processLabel.attributedText = attributeStr;
        _processLabel.numberOfLines = 0;
    }
    return _processLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [YLZFont regular:18];
        _timeLabel.textColor = YLZColorTitleTwo;
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        NSDate *nowDate = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY.MM.dd HH:mm:ss"];
        NSString *currentTimeString = [formatter stringFromDate:nowDate];
        _timeLabel.text = [NSString stringWithFormat:@"更新于：%@",currentTimeString];
        _timeLabel.numberOfLines = 0;
    }
    return _timeLabel;
}

- (UIView *)arrowView {
    if (!_arrowView) {
        _arrowView = [[UIView alloc] init];
//        _arrowView.backgroundColor = YLZColorGoldView;
    }
    return _arrowView;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"ylz_process_result_arrow"];
    }
    return _arrowImageView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
    }
    return _bottomView;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = YLZColorTitleFour;
    }
    return _separatorView;
}

- (UILabel *)cityLabel {
    if (!_cityLabel) {
        _cityLabel = [UILabel new];
        _cityLabel.font = [YLZFont regular:20];
        _cityLabel.textColor = YLZColorTitleThree;
        _cityLabel.textAlignment = NSTextAlignmentCenter;
        NSString *infoString = @"您于前7天内到达或途径：福建省厦门市";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 2.0;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle, NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone)};
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:infoString attributes:dic];
        NSDictionary *attributes = @{NSFontAttributeName:[YLZFont bold:20], NSForegroundColorAttributeName: YLZColorTitleOne};
        [attributeStr addAttributes:attributes range:NSMakeRange(infoString.length - 6,6)];
        _cityLabel.attributedText = attributeStr;
        _cityLabel.numberOfLines = 0;
    }
    return _cityLabel;
}

@end
