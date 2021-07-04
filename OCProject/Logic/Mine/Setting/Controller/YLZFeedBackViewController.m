//
//  YLZFeedBackViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZFeedBackViewController.h"
#import "YLZPlaceHolderTextView.h"
#import "YLZCategory.h"

@interface YLZFeedBackViewController()

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UIView *fontView;

@property (nonatomic, strong) YLZPlaceHolderTextView *textView;

@property (nonatomic, strong) UILabel *picLabel;

@property (nonatomic, strong) UIView *picView;

@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation YLZFeedBackViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"意见反馈" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.fontLabel];
    [self.view addSubview:self.fontView];
    
    [self.fontView addSubview:self.textView];
    
    [self.view addSubview:self.picLabel];
    [self.view addSubview:self.picView];
    
    [self.view addSubview:self.doneButton];
    
    [self setMas];
}

- (void)setMas {
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight);
        make.left.equalTo(self.view.mas_left).offset(36);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 44)));
    }];
    [self.fontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 120)));
    }];
//    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.fontView.mas_top).offset(10);
//        make.left.equalTo(self.fontView.mas_left).offset(10);
//        make.right.equalTo(self.fontView.mas_right).offset(-10);
//        make.bottom.equalTo(self.fontView.mas_bottom).offset(-10);
//    }];
    [self.picLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontView.mas_bottom).offset(12);
        make.left.equalTo(self.view.mas_left).offset(36);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 44)));
    }];
    [self.picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picLabel.mas_bottom);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 240)));
    }];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-(BottomDangerAreaHeight+16));
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 44)));
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toDone:(UIButton *)sender {
    
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont regular:16];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"反馈描述";
    }
    return _fontLabel;
}

- (UIView *)fontView {
    if (!_fontView) {
        _fontView = [UIView new];
        _fontView.backgroundColor = YLZColorCellBackGround;
        _fontView.layer.cornerRadius = 26.0;
        _fontView.layer.masksToBounds = YES;
    }
    return _fontView;
}

- (YLZPlaceHolderTextView *)textView {
    if (!_textView) {
        _textView = [[YLZPlaceHolderTextView alloc] initWithFrame:CGRectMake(10, 10, SCREENWIDTH - 52, 100)];
        _textView.editable = YES;
        _textView.backgroundColor = YLZColorCellBackGround;
        _textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _textView.font = [YLZFont regular:14];
        _textView.textColor = YLZColorTitleOne;
        _textView.placeholder = @"请详细描述您的问题，以便我们尽快定位并解决问题。";
        _textView.placeholderColor = YLZColorTitleThree;
    }
    return _textView;
}

- (UILabel *)picLabel {
    if (!_picLabel) {
        _picLabel = [UILabel new];
        _picLabel.font = [YLZFont regular:16];
        _picLabel.textColor = YLZColorTitleOne;
        _picLabel.text = @"图片凭证";
    }
    return _picLabel;
}

- (UIView *)picView {
    if (!_picView) {
        _picView = [UIView new];
        _picView.backgroundColor = YLZColorCellBackGround;
        _picView.layer.cornerRadius = 46.0;
        _picView.layer.masksToBounds = YES;
    }
    return _picView;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.titleLabel.font = [YLZFont regular:14];
        _doneButton.layer.cornerRadius = 18;
        _doneButton.layer.masksToBounds = YES;
        _doneButton.backgroundColor = YLZColorOrangeView;
        [_doneButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_doneButton setTitle:@"提交" forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end
