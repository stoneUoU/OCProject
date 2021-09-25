//
//  YLZHealthCodeSourceTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import "YLZHealthCodeSourceTableViewCell.h"
#import "YLZKitCategory.h"

@interface YLZHealthCodeSourceTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *leftOneLabel;

@property (nonatomic, strong) UILabel *rightOneLabel;

@property (nonatomic, strong) UILabel *leftTwoLabel;

@property (nonatomic, strong) UILabel *rightTwoLabel;

@property (nonatomic, strong) UILabel *leftThreeLabel;

@property (nonatomic, strong) UILabel *rightThreeLabel;

@end

@implementation YLZHealthCodeSourceTableViewCell

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
    [self.bgView addSubview:self.leftOneLabel];
    [self.bgView addSubview:self.rightOneLabel];
    
    [self.bgView addSubview:self.leftTwoLabel];
    [self.bgView addSubview:self.rightTwoLabel];
    
    [self.bgView addSubview:self.leftThreeLabel];
    [self.bgView addSubview:self.rightThreeLabel];
    
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
    
    [self.leftOneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(16);
        make.left.equalTo(self.bgView).offset(16);
        make.width.equalTo(@(72));
    }];
    [self.rightOneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftOneLabel.mas_top);
        make.left.equalTo(self.leftOneLabel.mas_right);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
    }];
    [self.leftTwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightOneLabel.mas_bottom).offset(8);
        make.left.equalTo(self.bgView).offset(16);
        make.width.equalTo(@(72));
    }];
    [self.rightTwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftTwoLabel.mas_top);
        make.left.equalTo(self.leftTwoLabel.mas_right);
        make.right.equalTo(self.bgView.mas_right);
    }];
    [self.leftThreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightTwoLabel.mas_bottom).offset(8);
        make.left.equalTo(self.bgView).offset(16);
        make.width.equalTo(@(72));
    }];
    [self.rightThreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftThreeLabel.mas_top);
        make.left.equalTo(self.leftThreeLabel.mas_right);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
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
        _titleLabel.font = [YLZFont regular:24];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.text = @"信息说明";
    }
    return _titleLabel;
}

- (UILabel *)leftOneLabel {
    if (!_leftOneLabel) {
        _leftOneLabel = [UILabel new];
        _leftOneLabel.font = [YLZFont regular:12];
        _leftOneLabel.textColor = YLZColorTitleOne;
        _leftOneLabel.text = @".数据来源：";
    }
    return _leftOneLabel;
}

- (UILabel *)rightOneLabel {
    if (!_rightOneLabel) {
        _rightOneLabel = [UILabel new];
        _rightOneLabel.font = [YLZFont regular:12];
        _rightOneLabel.textAlignment = NSTextAlignmentLeft;
        _rightOneLabel.numberOfLines = 0;
        _rightOneLabel.textColor = YLZColorTitleOne;
        _rightOneLabel.text = @"国家政务服务平台和福建省相关部门。";
    }
    return _rightOneLabel;
}

- (UILabel *)leftTwoLabel {
    if (!_leftTwoLabel) {
        _leftTwoLabel = [UILabel new];
        _leftTwoLabel.font = [YLZFont regular:12];
        _leftTwoLabel.textColor = YLZColorTitleOne;
        _leftTwoLabel.text = @".注意事项：";
    }
    return _leftTwoLabel;
}

- (UILabel *)rightTwoLabel {
    if (!_rightTwoLabel) {
        _rightTwoLabel = [UILabel new];
        _rightTwoLabel.font = [YLZFont regular:12];
        _rightTwoLabel.textColor = YLZColorTitleOne;
        _rightTwoLabel.textAlignment = NSTextAlignmentLeft;
        _rightTwoLabel.numberOfLines = 0;
        _rightTwoLabel.text = @"使用健康码时不要离开本页面且需本人操作确认。";
    }
    return _rightTwoLabel;
}

- (UILabel *)leftThreeLabel {
    if (!_leftThreeLabel) {
        _leftThreeLabel = [UILabel new];
        _leftThreeLabel.font = [YLZFont regular:12];
        _leftThreeLabel.textColor = YLZColorTitleOne;
        _leftThreeLabel.text = @".使用范围：";
    }
    return _leftThreeLabel;
}

- (UILabel *)rightThreeLabel {
    if (!_rightThreeLabel) {
        _rightThreeLabel = [UILabel new];
        _rightThreeLabel.font = [YLZFont regular:12];
        _rightThreeLabel.textColor = YLZColorTitleOne;
        _rightThreeLabel.textAlignment = NSTextAlignmentLeft;
        _rightThreeLabel.numberOfLines = 0;
        _rightThreeLabel.text = @"依托国家政务服务平台，实现跨省（区、市）数据共享和互通互认。";
    }
    return _rightThreeLabel;
}

@end





