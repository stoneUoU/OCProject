//
//  YLZScanResultAreaCell.m
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import "YLZScanResultAreaCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"
#import "YLZTimerHelper.h"

@interface YLZScanResultAreaCell()

@property (nonatomic, strong) UIView *wrapView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *signButton;
@property (nonatomic, strong) UIImageView *timeImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *areaImageView;
@property (nonatomic, strong) UILabel *areaLabel;

@end

@implementation YLZScanResultAreaCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorRouteCode;
        [self setUI];
    }
    return self;
}

- (void)setAreaModel:(YLZAreaModel *)areaModel {
    _areaModel = areaModel;
    self.titleLabel.text = areaModel.areaName;
    self.areaLabel.text = areaModel.areaSite;
    self.timeLabel.text = [YLZTimerHelper fetchCurrentTimeString];
}

- (void)setUI {
    
    [self.contentView addSubview:self.wrapView];
    [self.wrapView addSubview:self.titleLabel];
    [self.wrapView addSubview:self.signButton];
    
    [self.wrapView addSubview:self.timeImageView];
    [self.wrapView addSubview:self.timeLabel];
    
    [self.wrapView addSubview:self.areaImageView];
    [self.wrapView addSubview:self.areaLabel];
    
    [self setMas];
}

- (void)setMas {
    [self.wrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(16);
        make.left.equalTo(self.contentView.mas_left).offset(24);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.width.equalTo(@(SCREENWIDTH - 48));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wrapView.mas_top).offset(16);
        make.left.equalTo(self.wrapView.mas_left).offset(16);
    }];
    [self.signButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel);
        make.right.equalTo(self.wrapView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(80, 18)));
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(24);
        make.left.equalTo(self.wrapView.mas_left).offset(44);
        make.right.equalTo(self.wrapView.mas_right).offset(-16);
    }];
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel);
        make.right.equalTo(self.timeLabel.mas_left).offset(-8);
    }];
    [self.areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(12);
        make.left.equalTo(self.wrapView.mas_left).offset(44);
        make.right.equalTo(self.wrapView.mas_right).offset(-16);
        make.bottom.equalTo(self.wrapView.mas_bottom).offset(-16);
    }];
    [self.areaImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.areaLabel);
        make.right.equalTo(self.areaLabel.mas_left).offset(-8);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
    
}

- (void)toDone:(UIButton *)sender {
    
}

#pragma mark - getter

- (UIView *)wrapView {
    if (!_wrapView) {
        _wrapView = [UIView new];
        _wrapView.backgroundColor = YLZColorWhite;
        _wrapView.layer.cornerRadius = 12.0;
        _wrapView.layer.masksToBounds = YES;
    }
    return _wrapView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:20];
        _titleLabel.textColor = YLZColorTitleOne;
    }
    return _titleLabel;
}

- (UIButton *)signButton {
    if (!_signButton) {
        _signButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _signButton.backgroundColor = [UIColor colorWithHexString:@"#e8f6f0"];
        [_signButton setImage:[UIImage imageNamed:@"ylz_process_succ_small"] forState:UIControlStateNormal];
        [_signButton setTitle:@" 登记成功" forState:UIControlStateNormal];
        [_signButton setTitleColor:[UIColor colorWithHexString:@"#63a379"] forState:UIControlStateNormal];
        [_signButton.titleLabel setFont:[YLZFont regular:12]];
        _signButton.tag = 0;
        _signButton.layer.cornerRadius = 4.0;
        _signButton.layer.masksToBounds = YES;
        _signButton.layer.borderWidth = 0.5;
        _signButton.layer.borderColor = [[UIColor colorWithHexString:@"#63a379"] CGColor];
        [_signButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signButton;
}

- (UIImageView *)timeImageView {
    if (!_timeImageView) {
        _timeImageView = [UIImageView new];
        _timeImageView.image = [UIImage imageNamed:@"ylz_process_result_rili"];
    }
    return _timeImageView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [YLZFont regular:16];
        _timeLabel.textColor = YLZColorTitleOne;
        _timeLabel.numberOfLines = 0;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UIImageView *)areaImageView {
    if (!_areaImageView) {
        _areaImageView = [UIImageView new];
        _areaImageView.image = [UIImage imageNamed:@"ylz_process_result_area"];
    }
    return _areaImageView;
}

- (UILabel *)areaLabel {
    if (!_areaLabel) {
        _areaLabel = [UILabel new];
        _areaLabel.font = [YLZFont regular:16];
        _areaLabel.textColor = YLZColorTitleOne;
        _areaLabel.numberOfLines = 0;
        _areaLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _areaLabel;
}

@end
