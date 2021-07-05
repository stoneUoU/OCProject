//
//  YLZInvitedTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZInvitedTableViewCell.h"
#import "YLZInvitedModel.h"
#import "YLZKitCategory.h"

#import "YLZCategory.h"

@interface YLZInvitedTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *clockLabel;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *linkButton;

@property (nonatomic, strong) UIButton *notPassButton;

@property (nonatomic, strong) UIButton *passButton;

@end

@implementation YLZInvitedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setModel:(YLZInvitedModel *)model {
    _model = model;
    
    self.titleLabel.text = model.titleString;
    self.contentLabel.text = model.contentString;
    self.clockLabel.text = model.timeString;
    if (model.isPass) {
        self.notPassButton.userInteractionEnabled = NO;
        [self.notPassButton setTitle:@"报名" forState:UIControlStateNormal];
        self.notPassButton.hidden = NO;
        self.passButton.hidden = YES;
        [self.notPassButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.linkButton.mas_bottom).offset(24);
            make.centerX.equalTo(self.bgView);
            make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 76)/2, 44)));
            make.bottom.equalTo(self.bgView.mas_bottom).offset(-20);
        }];
    } else {
        self.notPassButton.userInteractionEnabled = YES;
        [self.notPassButton setTitle:@"不想参加" forState:UIControlStateNormal];
        self.notPassButton.hidden = NO;
        self.passButton.hidden = NO;
        [self.notPassButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.linkButton.mas_bottom).offset(24);
            make.left.equalTo(self.bgView.mas_left).offset(16);
            make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 76)/2, 44)));
            make.bottom.equalTo(self.bgView.mas_bottom).offset(-20);
        }];
        [self.passButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.linkButton.mas_bottom).offset(24);
            make.right.equalTo(self.bgView.mas_right).offset(-16);
            make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 76)/2, 44)));
        }];
    }
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.clockLabel];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.contentLabel];
    
    [self.bgView addSubview:self.linkButton];
    [self.bgView addSubview:self.notPassButton];
    [self.bgView addSubview:self.passButton];
    
    [self setMas];
}

- (void)setMas {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(24);
        make.centerX.equalTo(self.bgView);
    }];
    [self.clockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(16);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(24);
        make.centerX.equalTo(self.bgView);
        make.width.equalTo(@(SCREENWIDTH - 64));
    }];
    [self.linkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(32);
        make.centerX.equalTo(self.bgView);
        make.width.equalTo(@((SCREENWIDTH - 76)));
    }];
    [self.notPassButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.linkButton.mas_bottom).offset(24);
        make.left.equalTo(self.bgView.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 76)/2, 44)));
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-20);
    }];
    [self.passButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.linkButton.mas_bottom).offset(24);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 76)/2, 44)));
    }];
    [self.linkButton setButtonEdgeInsetsStyle:UIButtonEdgeInsetsStyleRight margin:5];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
    !self.handle ?: self.handle(sender.tag);
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

- (UILabel *)clockLabel {
    if (!_clockLabel) {
        _clockLabel = [UILabel new];
        _clockLabel.font = [YLZFont regular:12];
        _clockLabel.textColor = YLZColorTitleTwo;
    }
    return _clockLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:19];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [YLZFont regular:14];
        _contentLabel.textColor = YLZColorTitleTwo;
        _contentLabel.numberOfLines = 2;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (UIButton *)linkButton {
    if (!_linkButton) {
        _linkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _linkButton.titleLabel.font = [YLZFont regular:16];
        [_linkButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        _linkButton.tag = 0;
        [_linkButton setTitle:@"活动详情 " forState:UIControlStateNormal];
        [_linkButton setImage:[UIImage imageNamed:@"ylz_message_link"] forState:UIControlStateNormal];
        [_linkButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _linkButton;
}

- (UIButton *)notPassButton {
    if (!_notPassButton) {
        _notPassButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _notPassButton.titleLabel.font = [YLZFont regular:14];
        _notPassButton.layer.cornerRadius = 20;
        _notPassButton.layer.masksToBounds = YES;
        _notPassButton.backgroundColor = YLZColorTitleFour;
        [_notPassButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        _notPassButton.tag = 1;
        _notPassButton.hidden = YES;
        [_notPassButton setTitle:@"不想参加" forState:UIControlStateNormal];
        [_notPassButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _notPassButton;
}

- (UIButton *)passButton {
    if (!_passButton) {
        _passButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _passButton.titleLabel.font = [YLZFont regular:14];
        _passButton.layer.cornerRadius = 20;
        _passButton.layer.masksToBounds = YES;
        _passButton.backgroundColor = YLZColorOrangeView;
        [_passButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        _passButton.tag = 2;
        _passButton.hidden = YES;
        [_passButton setTitle:@"报名" forState:UIControlStateNormal];
        [_passButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _passButton;
}

@end





