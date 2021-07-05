//
//  YLZSetAreaViewController.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//  设置地区：

#import "YLZSetAreaViewController.h"
#import "YLZSetCollegeViewController.h"

#import "YLZCategory.h"

static CGFloat const kMargin = 24.0;

@interface YLZSetAreaViewController()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *provinceView;

@property (nonatomic, strong) UILabel *provinceLabel;

@property (nonatomic, strong) UIImageView *provinceImageView;

@property (nonatomic, strong) UIView *cityView;

@property (nonatomic, strong) UILabel *cityLabel;

@property (nonatomic, strong) UIImageView *cityImageView;

@property (nonatomic, strong) UIImageView *peopleImageView;

@property (nonatomic, strong) UIView *fontView;

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation YLZSetAreaViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back_circle" withRightString:@"步骤3/4" withRightColor:YLZColorTitleThree withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self.view addSubview:self.nameLabel];
    
    [self.view addSubview:self.provinceView];
    [self.provinceView addSubview:self.provinceLabel];
    [self.provinceView addSubview:self.provinceImageView];
    
    [self.view addSubview:self.cityView];
    [self.cityView addSubview:self.cityLabel];
    [self.cityView addSubview:self.cityImageView];
    
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
    //省：
    [self.provinceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(26);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-(2*kMargin+16))/2, 64)));
    }];
    [self.provinceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.provinceView);
        make.right.equalTo(self.provinceView.mas_right).offset(-kMargin);
        make.size.equalTo(@(CGSizeMake(10, 6)));
    }];
    [self.provinceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.provinceView);
        make.left.equalTo(self.provinceView.mas_left).offset(16);
        make.right.equalTo(self.provinceImageView.mas_left).offset(-16);
    }];
    //市：
    [self.cityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(26);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-48)/2, 64)));
    }];
    [self.cityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityView);
        make.right.equalTo(self.cityView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(10, 6)));
    }];
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityView);
        make.left.equalTo(self.cityView.mas_left).offset(16);
        make.right.equalTo(self.cityImageView.mas_left).offset(-16);
    }];
    [self.peopleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.provinceView.mas_bottom).offset(200);
        make.left.equalTo(self.view.mas_left).offset(64);
    }];
    [self.fontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.provinceView.mas_bottom).offset(64);
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
    YLZSetCollegeViewController *vc = [[YLZSetCollegeViewController alloc] init];
    [[YLZPageExtent sharedInstance] pushExistingViewController:vc withParam:nil];
}

- (void)textFieldChange:(UITextField *)textField {
    
}

- (void)toRecognizer:(UITapGestureRecognizer *)recognizer {
    
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
        _nameLabel.text = @"你破蛋的地方是？";
    }
    return _nameLabel;
}

- (UIView *)provinceView {
    if (!_provinceView) {
        _provinceView = [UIView new];
        _provinceView.backgroundColor = YLZColorCellBackGround;
        _provinceView.layer.cornerRadius = 10.0;
        _provinceView.layer.masksToBounds = YES;
        _provinceView.tag = 0;
        _provinceView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toRecognizer:)];
        [_provinceView addGestureRecognizer:recognizer];
    }
    return _provinceView;
}

- (UILabel *)provinceLabel {
    if (!_provinceLabel) {
        _provinceLabel = [UILabel new];
        _provinceLabel.font = [YLZFont regular:14];
        _provinceLabel.textColor = YLZColorTitleOne;
        _provinceLabel.text = @"省";
    }
    return _provinceLabel;
}

- (UIImageView *)provinceImageView {
    if (!_provinceImageView) {
        _provinceImageView = [UIImageView new];
        _provinceImageView.image = [UIImage imageNamed:@"ylz_arrow_down"];
    }
    return _provinceImageView;
}

- (UIView *)cityView {
    if (!_cityView) {
        _cityView = [UIView new];
        _cityView.backgroundColor = YLZColorCellBackGround;
        _cityView.layer.cornerRadius = 10.0;
        _cityView.layer.masksToBounds = YES;
        _cityView.tag = 1;
        _cityView.userInteractionEnabled = YES;
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toRecognizer:)];
        [_cityView addGestureRecognizer:recognizer];
    }
    return _cityView;
}

- (UILabel *)cityLabel {
    if (!_cityLabel) {
        _cityLabel = [UILabel new];
        _cityLabel.font = [YLZFont regular:14];
        _cityLabel.textColor = YLZColorTitleOne;
        _cityLabel.text = @"市";
    }
    return _cityLabel;
}

- (UIImageView *)cityImageView {
    if (!_cityImageView) {
        _cityImageView = [UIImageView new];
        _cityImageView.image = [UIImage imageNamed:@"ylz_arrow_down"];
    }
    return _cityImageView;
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
        _fontLabel.text = @"我想知道你的家乡在哪里，这样我才能知道你喜欢的食物口味和说的方言";
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



