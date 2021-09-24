//
//  YLZHealthCodeCheckTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import "YLZHealthCodeCheckTableViewCell.h"
#import "YLZKitCategory.h"

@interface YLZHealthCodeCheckTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) YLZPaddingLabel *isCheckLabel;

@property (nonatomic, strong) UIButton *excuteButton;

@end

@implementation YLZHealthCodeCheckTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorMZTBlueView;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.isCheckLabel];
    [self.bgView addSubview:self.excuteButton];
    
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(16);
        make.left.equalTo(self.bgView).offset(16);
    }];
    
    [self.isCheckLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-16);
        make.left.equalTo(self.bgView).offset(16);
    }];
    
    [self.excuteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(96, 36)));
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont regular:18];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.text = @"通行大数据行程卡";
    }
    return _titleLabel;
}

- (YLZPaddingLabel *)isCheckLabel {
    if(_isCheckLabel == nil) {
        _isCheckLabel = [[YLZPaddingLabel alloc] init];
        _isCheckLabel.font = [YLZFont regular:14];
        _isCheckLabel.textColor = YLZColorTitleThree;
        _isCheckLabel.text = @"今日未核验";
        _isCheckLabel.backgroundColor = [UIColor colorWithHexString:@"#eff5f3"];
        _isCheckLabel.topEdge = 5.0;
        _isCheckLabel.leftEdge = 10.0;
        _isCheckLabel.bottomEdge = 5.0;
        _isCheckLabel.rightEdge = 10.0;
    }
    return _isCheckLabel;
}

- (UIButton *)excuteButton {
    if (!_excuteButton) {
        _excuteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _excuteButton.titleLabel.font = [YLZFont regular:14];
        _excuteButton.layer.cornerRadius = 18;
        _excuteButton.layer.masksToBounds = YES;
        _excuteButton.backgroundColor = YLZColorMZTBlueView;
        [_excuteButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        _excuteButton.tag = 0;
        [_excuteButton setTitle:@"点击核验" forState:UIControlStateNormal];
        [_excuteButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _excuteButton;
}

@end




