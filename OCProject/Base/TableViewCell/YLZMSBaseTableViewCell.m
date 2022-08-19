//
//  YLZMSBaseTableViewCell.m
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import "YLZMSBaseTableViewCell.h"

CGFloat const YLZCellLeftPadding = 10.f;

CGFloat const YLZCellHeight = 44.f;

@interface YLZMSBaseTableViewCell()

@property (nonatomic, strong) YLZMSBasePresenter *defaultPT;
@end

@implementation YLZMSBaseTableViewCell

- (id)init {
    self = [super init];
    if (self) {
        [self initData];
        [self setUI];
        [self setMas];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initData];
        [self setUI];
        [self setMas];
    }
    return self;
}

- (void)initData
{
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setUI {
    [self.contentView addSubview:self.topCornerView];
    [self.contentView addSubview:self.bottomCornerView];
    [self.contentView addSubview:self.bgView];
}

- (void)setMas {

}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutSubViews];
}

- (void)layoutSubViews {
    CGFloat leftPadding = 0.f;
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat width = CGRectGetWidth(self.bounds) - leftPadding*2;
    
    self.bgView.frame = CGRectMake(leftPadding, 0, width, height);
    self.topCornerView.frame = CGRectMake(leftPadding, 0, width, height/2.f);
    self.bottomCornerView.frame = CGRectMake(leftPadding, height/2.f, width, height/2.f);
}

#pragma mark lazy loading

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView
{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.contentMode = UIViewContentModeScaleAspectFill;
        _rightImageView.layer.masksToBounds = YES;
    }
    return _rightImageView;
}

- (UILabel *)leftTitleLabel
{
    if (!_leftTitleLabel) {
        _leftTitleLabel = [[UILabel alloc] init];
        _leftTitleLabel.textAlignment = NSTextAlignmentLeft;
        _leftTitleLabel.font = [UIFont systemFontOfSize:16];
        _leftTitleLabel.textColor = [UIColor redColor];
    }
    return _leftTitleLabel;
}

- (UILabel *)rightTitleLabel {
    if (!_rightTitleLabel) {
        _rightTitleLabel = [[UILabel alloc] init];
        _rightTitleLabel.textAlignment = NSTextAlignmentRight;
        _rightTitleLabel.font = [UIFont systemFontOfSize:16];
        _rightTitleLabel.textColor = [UIColor redColor];
    }
    return _rightTitleLabel;
}

- (UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor whiteColor];
    }
    return _bottomLine;
}

- (UIView *)topCornerView
{
    if (!_topCornerView) {
        _topCornerView = [[UIView alloc] init];
        _topCornerView.backgroundColor = [UIColor whiteColor];
        _topCornerView.hidden = YES;
    }
    return _topCornerView;
}

- (UIView *)bottomCornerView
{
    if (!_bottomCornerView) {
        _bottomCornerView = [[UIView alloc] init];
        _bottomCornerView.backgroundColor = [UIColor whiteColor];
        _bottomCornerView.hidden = YES;
    }
    return _bottomCornerView;
}

#pragma mark set cornet

-(void)setCornerForCell
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bgView.bounds byRoundingCorners:UIRectCornerBottomLeft |
                              UIRectCornerBottomRight |
                              UIRectCornerTopLeft |
                              UIRectCornerTopRight cornerRadii:CGSizeMake(10,10)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = self.bgView.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    self.bgView.layer.mask = maskLayer;
}

-(void)setBgViewCornerWithRowIndex:(NSInteger )rowIndex withSectionNum:(NSInteger)num
{
    if (rowIndex == 0) {

        [self setBgViewCorner];
        self.bottomCornerView.hidden = num == 1;
        
    }else if (rowIndex == num - 1)
    {
        [self setBgViewCorner];
        self.topCornerView.hidden = NO;
    
    }else
    {
        self.topCornerView.hidden = NO;
        self.bottomCornerView.hidden = NO;
    }
    
    self.bottomLine.hidden = rowIndex == num - 1 ? YES : NO;
}

- (void)setBgViewCorner
{
    self.topCornerView.hidden = YES;
    self.bottomCornerView.hidden = YES;
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 10.0;
}


#pragma mark default presenter

- (id<YLZMSPresenterProtocol>)getPresenter
{
    id<YLZMSPresenterProtocol> pt = nil;
    if ([self respondsToSelector:@selector(presenter)]) {
        pt = [self performSelector:@selector(presenter)];
    }
    if (!pt) {
        pt = self.defaultPT;
    }
    return pt;
}

-(id<YLZMSPresenterProtocol>)presenter
{
    return nil;
}

-(YLZMSBasePresenter *)defaultPT
{
    if (!_defaultPT) {
        _defaultPT = [[YLZMSBasePresenter alloc] initWithView:self];
    }
    return _defaultPT;
}

+ (CGFloat)getCellHeight
{
    return 0.f;
}

@end

