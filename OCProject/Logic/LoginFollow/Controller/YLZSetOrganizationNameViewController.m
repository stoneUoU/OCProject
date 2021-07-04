//
//  YLZSetOrganizationNameViewController.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZSetOrganizationNameViewController.h"
#import "YLZSetOrganizationAreaViewController.h"

#import "YLZCategory.h"

static CGFloat const kMargin = 24.0;

@interface YLZSetOrganizationNameViewController()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *nameView;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIImageView *peopleImageView;

@property (nonatomic, strong) UIView *fontView;

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation YLZSetOrganizationNameViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"步骤1/2" withRightColor:YLZColorTitleThree withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self.view addSubview:self.nameLabel];
    
    [self.view addSubview:self.nameView];
    [self.nameView addSubview:self.textField];
    
    [self.view addSubview:self.peopleImageView];
    
    [self.view addSubview:self.fontView];
    [self.fontView addSubview:self.fontLabel];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+72);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
    }];
    [self.nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(26);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH-2*kMargin, 78)));
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameView.mas_left).offset(kMargin);
        make.centerY.equalTo(self.nameView);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 64, 44)));
    }];
    [self.peopleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameView.mas_bottom).offset(200);
        make.left.equalTo(self.view.mas_left).offset(64);
    }];
    [self.fontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameView.mas_bottom).offset(64);
        make.right.equalTo(self.view.mas_right).offset(-54);
        make.size.equalTo(@(CGSizeMake(208, 108)));
    }];
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.fontView);
        make.width.equalTo(@(160));
    }];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-(BottomDangerAreaHeight+24));
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH-32, 44)));
    }];
    [self.doneButton setButtonEdgeInsetsStyle:UIButtonEdgeInsetsStyleRight margin:5];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toDone:(UIButton *)sender {
    YLZSetOrganizationAreaViewController *vc = [[YLZSetOrganizationAreaViewController alloc] init];
    [[YLZPageExtent sharedInstance] pushExistingViewController:vc withParam:nil];
}

- (void)textFieldChange:(UITextField *)textField {
    
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [YLZFont regular:22];
        _nameLabel.textColor = YLZColorTitleOne;
        _nameLabel.text = @"组织的名字？";
    }
    return _nameLabel;
}

- (UIView *)nameView {
    if (!_nameView) {
        _nameView = [UIView new];
        _nameView.backgroundColor = YLZColorCellBackGround;
        _nameView.layer.cornerRadius = 10.0;
        _nameView.layer.masksToBounds = YES;
    }
    return _nameView;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [YLZFont medium:14.f];
        _textField.textColor = YLZColorTitleOne;
        _textField.delegate = self;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.tag = 0;
        NSDictionary *attributes = @{NSFontAttributeName: [YLZFont regular:14], NSForegroundColorAttributeName: YLZColorTitleFour};
        _textField.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:@"请填写组织的名字" attributes:attributes];
        [_textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}

- (UIImageView *)peopleImageView {
    if (!_peopleImageView) {
        _peopleImageView = [UIImageView new];
        _peopleImageView.image = [UIImage imageNamed:@"ylz_follow_girl"];
    }
    return _peopleImageView;
}

- (UIView *)fontView {
    if (!_fontView) {
        _fontView = [UIView new];
        _fontView.backgroundColor = YLZColorCellBackGround;
        _fontView.layer.cornerRadius = 32;
        _fontView.layer.masksToBounds = YES;
    }
    return _fontView;
}

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont regular:14];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"民众自发组织的团体也算是组织哦！";
        _fontLabel.numberOfLines = 0;
        _fontLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _fontLabel;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.titleLabel.font = [YLZFont regular:16];
        [_doneButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_doneButton setTitle:@"下一步  " forState:UIControlStateNormal];
        [_doneButton setImage:[UIImage imageNamed:@"ylz_follow_next"] forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end


