//
//  YLZRouteCodeInfoCell.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeInfoCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"

@interface YLZRouteCodeInfoCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation YLZRouteCodeInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorRouteCode;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.iconImageView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.separatorView];
    
    [self setMas];
}

- (void)setMas {
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.bgView).offset(16);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.iconImageView.mas_right).offset(16);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bgView);
        make.height.equalTo(@(0.5));
        make.left.equalTo(self.iconImageView.mas_left);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
    }];
}

- (void)setFuncModel:(YLZFunctionModel *)funcModel {
    _funcModel = funcModel;
    self.iconImageView.image = [UIImage imageNamed:funcModel.iconName];
    self.titleLabel.text = funcModel.functionName;
    if (funcModel.topFillet) {
        [self.bgView ylz_addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight  withRadii:CGSizeMake(12, 12) viewRect:self.bgView.bounds];
    } else if (funcModel.bottomFillet) {
        [self.bgView ylz_addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight  withRadii:CGSizeMake(12, 12) viewRect:self.bgView.bounds];
    } else {
        [self.bgView ylz_addRoundedCorners:UIRectCornerAllCorners withRadii:CGSizeMake(0, 0) viewRect:self.bgView.bounds];
    }
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

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = YLZColorWhite;
        _bgView.frame = CGRectMake(24, 0, SCREENWIDTH - 48, 64);
    }
    return _bgView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont bold:22];
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





