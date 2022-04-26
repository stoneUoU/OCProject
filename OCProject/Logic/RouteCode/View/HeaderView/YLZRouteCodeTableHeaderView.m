//
//  YLZRouteCodeTableHeaderView.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeTableHeaderView.h"

@interface YLZRouteCodeTableHeaderView()

@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation YLZRouteCodeTableHeaderView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        [self setUI];
    }
    return self;//返回一个已经初始化完毕的对象；
}
    
- (void)drawRect:(CGRect)rect {
}
    
#pragma mark - Public Method
#pragma mark -
    
#pragma mark - Private Method
#pragma mark -
    
- (void)setUI {
    [self addSubview:self.picImageView];
    [self setMas];
}
    
 - (void)setMas {
     [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self);
     }];
}
    
#pragma mark - IB-Action
#pragma mark -
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UIImageView *)picImageView {
    if(_picImageView == nil) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.image = [UIImage imageNamed:@"ylz_top_pic"];
    }
    return _picImageView;
}

@end
