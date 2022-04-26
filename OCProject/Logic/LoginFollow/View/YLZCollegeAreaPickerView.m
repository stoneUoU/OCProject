//
//  YLZCollegeAreaPickerView.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZCollegeAreaPickerView.h"
#import "YLZEnlargeButton.h"
#import "YLZCategory.h"

@interface YLZCollegeAreaPickerView()<UIPickerViewDelegate, UIPickerViewDataSource>
/** 关系数据 */
@property (nonatomic, strong) NSMutableArray <NSString *>*dataModelArrays;
/** pickView */
@property (nonatomic, strong) UIPickerView *pickView;

@property (nonatomic, strong) UIView *topView;
/** 取消按钮 */
@property (nonatomic, strong) YLZEnlargeButton *closeButton;
/** 确定按钮 */
@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, assign) CGRect pickViewFrame;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) NSInteger selectedRow;

@property (nonatomic, copy) NSString *shipStr;

@end

static const CGFloat topViewHeight = 56;
static const CGFloat animationDuration = 0.3;

@implementation YLZCollegeAreaPickerView

#pragma mark - - load
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self ylz_initData:frame];
        [self ylz_initSubviews];
    }
    return self;
}

/** 初始化子视图 */
- (void)ylz_initSubviews {
    [self.topView ylz_addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight  withRadii:CGSizeMake(10.0, 10.0) viewRect:self.topView.bounds];
    [self addSubview:self.topView];
    [self.topView addSubview:self.closeButton];
    [self.topView addSubview:self.titleLabel];
    [self.topView addSubview:self.sureButton];
    
    [self addSubview:self.pickView];
    [self setMas];
    
}

- (void)setMas {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.topView);
    }];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topView);
        make.right.equalTo(self.topView.mas_right).offset(-16);
    }];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topView);
        make.left.equalTo(self.topView.mas_left).offset(16);
    }];
}

/** 初始化数据 */
- (void)ylz_initData:(CGRect)frame {
    self.pickViewFrame = frame;
    self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
}

- (void)toDone:(UIButton *)sender {
    if (sender.tag == 0) {
        if (self.delegate &&
            [self.delegate respondsToSelector:@selector(ylz_cancel)]) {
            [self.delegate ylz_cancel];
        }
        [self ylz_dismiss];
    } else {
        if ([self anySubViewScrolling:self.pickView]) return;
        self.shipStr = [self pickerView:self.pickView titleForRow:self.selectedRow forComponent:0];
        if (self.delegate &&
            [self.delegate respondsToSelector:@selector(ylz_selected:)]) {
            [self.delegate ylz_selected:self.shipStr];
        }
        [self ylz_dismiss];
    }
}

#pragma mark - - get


- (NSMutableArray *)dataModelArrays {
    if (!_dataModelArrays) {
        _dataModelArrays = [NSMutableArray array];
        [_dataModelArrays addObjectsFromArray:@[@"父母",@"夫妻",@"子女",@"其他"]];
    }
    return _dataModelArrays;
}

- (UIPickerView *)pickView {
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), SCREENWIDTH, self.pickViewFrame.size.height)];
        _pickView.dataSource = self;
        _pickView.delegate = self;
        _pickView.showsSelectionIndicator = YES;
        _pickView.backgroundColor = YLZColorWhite;
    }
    return _pickView;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, topViewHeight)];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"国籍";
        _titleLabel.font=[YLZFont medium:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = YLZColorTitleOne;
    }
    return _titleLabel;
}

- (YLZEnlargeButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [YLZEnlargeButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"ylz_close"] forState:UIControlStateNormal];
        _closeButton.tag = 0;
        _closeButton.enlargeEdge_ylz = UIEdgeInsetsMake(5, 5, 5, 5);
        [_closeButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_sureButton.titleLabel setFont:[YLZFont regular:16]];
        _sureButton.tag = 1;
        [_sureButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

#pragma mark - show,dismiss

- (void)ylz_show {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    @weakify(self);
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect tempRect = weak_self.topView.frame;
        tempRect.origin.y = SCREENHEIGHT - topViewHeight - weak_self.pickViewFrame.size.height;
        weak_self.topView.frame = tempRect;
        tempRect = weak_self.pickViewFrame;
        tempRect.origin.y = CGRectGetMaxY(weak_self.topView.frame);
        weak_self.pickView.frame = tempRect;
    }];
}

- (void)ylz_dismiss {
    @weakify(self);
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect tempRect = weak_self.topView.frame;
        tempRect.origin.y = SCREENHEIGHT;
        weak_self.topView.frame = tempRect;
        tempRect = weak_self.pickViewFrame;
        tempRect.origin.y = CGRectGetMaxY(weak_self.topView.frame);
        weak_self.pickView.frame = tempRect;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - - UIPickerViewDelegate,UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataModelArrays.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    NSString *modelString = [self.dataModelArrays objectAtIndex:row];
    return modelString;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedRow = row;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return  50.0f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return SCREENWIDTH;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UIButton *senderButton = (UIButton*)view;
    if (!senderButton){
        senderButton = [[UIButton alloc] init];
        [senderButton setTitleColor:YLZColorTitleOne forState:UIControlStateNormal];
        senderButton.titleLabel.font = [YLZFont regular:16];
        senderButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        senderButton.backgroundColor = YLZColorBackGround;
    }
    [senderButton setTitle:[self pickerView:pickerView titleForRow:row forComponent:component] forState:UIControlStateNormal];
    [self changeSpearatorLineColor];
    return senderButton;
}

#pragma mark - 改变分割线的颜色
- (void)changeSpearatorLineColor {
    for(UIView *speartorView in self.pickView.subviews) {
        if (speartorView.frame.size.height < 1) {
            speartorView.backgroundColor = YLZColorBackGround;
        }
    }
}

#pragma mark - 改变分割线的颜色
- (BOOL)anySubViewScrolling:(UIView *)view{
    if ([view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)view;
        if (scrollView.dragging || scrollView.decelerating) {
            return YES;
        }
    }
    for (UIView * theSubView in view.subviews) {
        if ([self anySubViewScrolling:theSubView]) {
            return YES;
        }
    }
    return NO;
}

@end

