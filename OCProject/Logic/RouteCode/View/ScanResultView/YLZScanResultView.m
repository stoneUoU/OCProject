//
//  YLZScanResultView.m
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import "YLZScanResultView.h"
#import "YLZScanResultStatusCell.h"
#import "YLZRouteCodeRecordCell.h"
#import "YLZScanResultAreaCell.h"
#import "YLZFunctionModel.h"

@interface YLZScanResultView()<UITableViewDelegate,UITableViewDataSource> {
    
}

@property (nonatomic, strong) NSMutableArray *dataArrays;

@end
    
@implementation YLZScanResultView
    
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
    [self addSubview:self.tableView];
    [self setMas];
}
    
 - (void)setMas {
     [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.edges.equalTo(self);
     }];
}
    
#pragma mark - IB-Action
#pragma mark -
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataArrays count];
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return UITableViewAutomaticDimension;
    } else if (indexPath.section == 1) {
        return 374;
    } else {
        return 96;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.00001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == self.dataArrays.count - 1)  {
        return 54;
    } else {
        return 16;
    }
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
    if (indexPath.section == 0) {
        YLZScanResultAreaCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZScanResultAreaCell class])];
        if (! viewCell){
            viewCell = [[YLZScanResultAreaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZScanResultAreaCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return viewCell;
    } else if (indexPath.section == 1) {
        YLZScanResultStatusCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZScanResultStatusCell class])];
        if (! viewCell){
            viewCell = [[YLZScanResultStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZScanResultStatusCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.processHandle = ^{
            if (self.delegate && [self.delegate respondsToSelector:@selector(toProcess)]) {
                [self.delegate toProcess];
            }
        };
        return viewCell;
    } else if (indexPath.section == 2) {
        YLZRouteCodeRecordCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZRouteCodeRecordCell class])];
        if (! viewCell){
            viewCell = [[YLZRouteCodeRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZRouteCodeRecordCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.clickHandle = ^(NSInteger index) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(toRecord:)]) {
                [self.delegate toRecord:index];
            }
        };
        return viewCell;
    }
    UITableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (! viewCell){
        viewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return viewCell;
}
    
#pragma mark - lazy load
#pragma mark -

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = YLZColorRouteCode;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[YLZScanResultStatusCell class] forCellReuseIdentifier: NSStringFromClass([YLZScanResultStatusCell class])];
        [_tableView registerClass:[YLZRouteCodeRecordCell class] forCellReuseIdentifier: NSStringFromClass([YLZRouteCodeRecordCell class])];
        [_tableView registerClass:[YLZScanResultAreaCell class] forCellReuseIdentifier: NSStringFromClass([YLZScanResultAreaCell class])];
    }
    return _tableView;
}

- (NSMutableArray *)dataArrays
{
    if (!_dataArrays) {
        _dataArrays = [NSMutableArray array];
        [_dataArrays addObject:@[]];
        [_dataArrays addObject:@[]];
        [_dataArrays addObject:@[]];
    }
    return _dataArrays;
}
      
@end

