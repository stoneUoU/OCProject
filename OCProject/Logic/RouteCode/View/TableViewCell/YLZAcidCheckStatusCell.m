//
//  YLZAcidCheckStatusCell.m
//  OCProject
//
//  Created by stone on 2022/8/29.
//

#import "YLZAcidCheckStatusCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"

@interface YLZAcidCheckStatusCell()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation YLZAcidCheckStatusCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorWhite;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.separatorView];
    
    [self setMas];
}

- (void)setMas {
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16);
        make.size.equalTo(@(CGSizeMake(24, 24)));
        make.top.equalTo(self.contentView.mas_top).offset(16);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-16);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.iconImageView.mas_right).offset(16);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@(0.5));
        make.left.equalTo(self.iconImageView.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
}

- (void)setFuncModel:(YLZFunctionModel *)funcModel {
    _funcModel = funcModel;
    self.iconImageView.image = [UIImage imageNamed:funcModel.iconName];
    self.titleLabel.text = funcModel.functionName;
    self.separatorView.hidden = funcModel.bottomFillet;
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

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:18];
        _titleLabel.textColor = YLZColorTitleOne;
    }
    return _titleLabel;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = YLZColorLine;
    }
    return _separatorView;
}

@end
