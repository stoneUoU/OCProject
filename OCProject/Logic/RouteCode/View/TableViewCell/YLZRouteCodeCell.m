//
//  YLZRouteCodeCell.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"
#import "YLZRouteCodeCellView.h"
#import "YLZRouteCodeCellBottomView.h"
#import "YLZRouteCodeCellInfoView.h"

@interface YLZRouteCodeCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) YLZRouteCodeCellInfoView *codeInfoView;
@property (nonatomic, strong) YLZRouteCodeCellView *codeView;
@property (nonatomic, strong) YLZRouteCodeCellBottomView *bottomView;

@property (nonatomic, assign) NSInteger clickNum;

@end

@implementation YLZRouteCodeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorRouteCode;
        [self setUI];
        self.codeView.clickNum = 0;
    }
    return self;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.codeInfoView];
    [self.bgView addSubview:self.codeView];
    [self.bgView addSubview:self.bottomView];
    
    [self setMas];
}

- (void)setMas {
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
        _bgView.frame = CGRectMake(24, 0, SCREENWIDTH - 48, 556);
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 12.0;
        _bgView.layer.shadowColor = [[UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1] CGColor];
        _bgView.layer.shadowOffset = CGSizeMake(0, 6);
        _bgView.layer.shadowOpacity = 1;
        _bgView.layer.shadowRadius = 12;
    }
    return _bgView;
}

- (YLZRouteCodeCellInfoView *)codeInfoView {
    if (!_codeInfoView) {
        _codeInfoView = [[YLZRouteCodeCellInfoView alloc] init];
        _codeInfoView.frame = CGRectMake(0, 0, SCREENWIDTH - 48, 76);
        __weak typeof(self) weakSelf = self;
        _codeInfoView.handle = ^{
//            weakSelf.clickNum = weakSelf.clickNum+1;
//            if (weakSelf.clickNum>2) {
//                weakSelf.clickNum = 0;
//            }
//            weakSelf.codeView.clickNum = weakSelf.clickNum;
        };
    }
    return _codeInfoView;
}

- (YLZRouteCodeCellView *)codeView {
    if (!_codeView) {
        _codeView = [[YLZRouteCodeCellView alloc] init];
        _codeView.frame = CGRectMake(16, 76, SCREENWIDTH - (48+32), 386);
        __weak typeof(self) weakSelf = self;
        _codeView.logicHandle = ^(NSInteger index) {
            !weakSelf.scanHandle ?: weakSelf.scanHandle();
        };
    }
    return _codeView;
}

- (YLZRouteCodeCellBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[YLZRouteCodeCellBottomView alloc] init];
        _bottomView.frame = CGRectMake(0, 456, SCREENWIDTH - 48, 100);
        _bottomView.userInteractionEnabled = YES;
        __weak typeof(self) weakSelf = self;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            !weakSelf.processHandle ?: weakSelf.processHandle();
        }];
        [_bottomView addGestureRecognizer:ges];
    }
    return _bottomView;
}

@end






