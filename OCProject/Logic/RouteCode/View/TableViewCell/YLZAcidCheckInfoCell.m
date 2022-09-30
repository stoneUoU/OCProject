//
//  YLZAcidCheckInfoCell.m
//  OCProject
//
//  Created by stone on 2022/8/29.
//

#import "YLZAcidCheckInfoCell.h"

#import "YLZAcidCheckStatusCell.h"
#import "YLZStringHelper.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"

@interface YLZAcidCheckInfoCell()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation YLZAcidCheckInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorWhite;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.infoLabel];
    [self.contentView addSubview:self.separatorView];
    
    [self setMas];
}

- (void)setMas {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.width.equalTo(@(208));
        make.top.equalTo(self.contentView.mas_top).offset(16);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-16);
    }];
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@(0.5));
        make.left.equalTo(self.contentView).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
}

- (void)setFuncModel:(YLZFunctionModel *)funcModel {
    _funcModel = funcModel;
    self.titleLabel.text = funcModel.functionName;
    self.infoLabel.text = funcModel.subName;
    self.separatorView.hidden = funcModel.bottomFillet;
    if (![YLZStringHelper ylz_isNull:funcModel.functionNameColor]) {
        self.titleLabel.textColor = [UIColor colorWithHexString:funcModel.functionNameColor];
    } else {
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#2b2f37"];
    }
    if (funcModel.fontSize != 0) {
        self.titleLabel.font = [YLZFont medium:funcModel.fontSize];
        self.infoLabel.font = [YLZFont medium:funcModel.fontSize];
    } else {
        self.titleLabel.font = [YLZFont medium:16];
        self.infoLabel.font = [YLZFont medium:16];
    }
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:16];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#2b2f37"];
    }
    return _titleLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel new];
        _infoLabel.font = [YLZFont medium:16];
        _infoLabel.textColor = YLZColorTitleOne;
        _infoLabel.numberOfLines = 0;
        _infoLabel.textAlignment = NSTextAlignmentRight;
    }
    return _infoLabel;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = YLZColorLine;
    }
    return _separatorView;
}

@end
