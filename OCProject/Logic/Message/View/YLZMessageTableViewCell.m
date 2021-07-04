//
//  YLZMessageTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZMessageTableViewCell.h"
#import "YLZMessageModel.h"
#import "YLZKitCategory.h"

@interface YLZMessageTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIView *orangeDotView;

@property (nonatomic, strong) UILabel *orangeDotLabel;

@property (nonatomic, strong) UILabel *clockLabel;

@end

@implementation YLZMessageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setModel:(YLZMessageModel *)model {
    _model = model;
    
    self.picImageView.image = [UIImage imageNamed:model.picString];
    self.titleLabel.text = model.titleString;
    self.contentLabel.text = model.contentString;
    self.clockLabel.text = model.timeString;
    
    self.orangeDotView.hidden = model.count == 0;
    self.orangeDotLabel.text = [NSString stringWithFormat:@"%ld",(long)model.count];
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.picImageView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.contentLabel];
    
    [self.bgView addSubview:self.orangeDotView];
    [self.orangeDotView addSubview:self.orangeDotLabel];
    [self.bgView addSubview:self.clockLabel];
    
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.bgView.mas_left).offset(12);
        make.size.equalTo(@(CGSizeMake(60, 60)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picImageView.mas_top).offset(4);
        make.left.equalTo(self.picImageView.mas_right).offset(8);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.picImageView.mas_bottom).offset(-4);
        make.left.equalTo(self.picImageView.mas_right).offset(8);
        make.right.equalTo(self.bgView.mas_right).offset(-88);
    }];
    
    [self.orangeDotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(16, 16)));
    }];
    [self.orangeDotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.orangeDotView);
    }];
    [self.clockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentLabel);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - getter


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = YLZColorCellBackGround;
        _bgView.layer.cornerRadius = 21;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [UIImageView new];
        _picImageView.backgroundColor = YLZColorRed;
        _picImageView.layer.cornerRadius = 30.0;
        _picImageView.layer.masksToBounds = YES;
    }
    return _picImageView;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:14];
        _titleLabel.textColor = YLZColorTitleOne;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [YLZFont regular:14];
        _contentLabel.textColor = YLZColorTitleTwo;
        _contentLabel.numberOfLines = 1;
    }
    return _contentLabel;
}

- (UIView *)orangeDotView {
    if(_orangeDotView == nil) {
        _orangeDotView = [[UIView alloc] init];
        _orangeDotView.backgroundColor = YLZColorOrangeView;
        _orangeDotView.layer.cornerRadius = 3.0;
        _orangeDotView.layer.masksToBounds = YES;
    }
    return _orangeDotView;
}

- (UILabel *)orangeDotLabel {
    if(_orangeDotLabel == nil) {
        _orangeDotLabel = [[UILabel alloc] init];
        _orangeDotLabel.font = [YLZFont regular:14];
        _orangeDotLabel.textColor = YLZColorWhite;
    }
    return _orangeDotLabel;
}

- (UILabel *)clockLabel {
    if (!_clockLabel) {
        _clockLabel = [UILabel new];
        _clockLabel.font = [YLZFont regular:14];
        _clockLabel.textColor = YLZColorTitleTwo;
    }
    return _clockLabel;
}

@end


