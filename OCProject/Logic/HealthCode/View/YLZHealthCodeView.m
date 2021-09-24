//
//  YLZHealthCodeView.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import "YLZHealthCodeView.h"
#import "YLZHealthCodeInfoTableViewCell.h"
#import "YLZHealthCodeTableViewCell.h"
#import "YLZHealthCodeCheckTableViewCell.h"
#import "YLZHealthCodeServiceTableViewCell.h"
#import "YLZHealthCodeSourceTableViewCell.h"
#import "YLZHealthCodeTableFooterView.h"

@interface YLZHealthCodeView()<UITableViewDelegate,UITableViewDataSource> {
    
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArrays;

@property (nonatomic, assign) NSInteger clickNum;


@end
    
@implementation YLZHealthCodeView
    
#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        self.clickNum = 0;
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
        return 120;
    } else if (indexPath.section == 1) {
        return 467;
    } else if (indexPath.section == 2) {
        return 96;
    } else if (indexPath.section == 3) {
        return 308;
    } else {
        return 196;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.00000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2 || section == 3) {
        UIView *footerView = [[UIView alloc] init];
        return footerView;
    } else {
        YLZHealthCodeTableFooterView *footerView = [[YLZHealthCodeTableFooterView alloc] init];
        return footerView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2 || section == 3) {
        return 12;
    } else {
        return 54;
    }
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
    if (indexPath.section == 0) {
        YLZHealthCodeInfoTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZHealthCodeInfoTableViewCell class])];
        if (! viewCell){
            viewCell = [[YLZHealthCodeInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZHealthCodeInfoTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        __weak typeof (self)weakSelf = self;
        viewCell.handle = ^(NSInteger clickNum) {
            weakSelf.clickNum = clickNum;
            [weakSelf.tableView reloadData];
        };
        return viewCell;
    } else if (indexPath.section == 1) {
        YLZHealthCodeTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZHealthCodeTableViewCell class])];
        if (! viewCell){
            viewCell = [[YLZHealthCodeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZHealthCodeTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.clickNum = self.clickNum;
        return viewCell;
    } else if (indexPath.section == 2) {
        YLZHealthCodeCheckTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZHealthCodeCheckTableViewCell class])];
        if (! viewCell){
            viewCell = [[YLZHealthCodeCheckTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZHealthCodeCheckTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return viewCell;
    } else if (indexPath.section == 3) {
        YLZHealthCodeServiceTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZHealthCodeServiceTableViewCell class])];
        if (! viewCell){
            viewCell = [[YLZHealthCodeServiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZHealthCodeServiceTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return viewCell;
    }  else {
        YLZHealthCodeSourceTableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZHealthCodeSourceTableViewCell class])];
        if (! viewCell){
            viewCell = [[YLZHealthCodeSourceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZHealthCodeSourceTableViewCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return viewCell;
    }
}
    
#pragma mark - lazy load
#pragma mark -

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = YLZColorMZTBlueView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[YLZHealthCodeInfoTableViewCell class] forCellReuseIdentifier: NSStringFromClass([YLZHealthCodeInfoTableViewCell class])];
        [_tableView registerClass:[YLZHealthCodeTableViewCell class] forCellReuseIdentifier: NSStringFromClass([YLZHealthCodeTableViewCell class])];
        [_tableView registerClass:[YLZHealthCodeCheckTableViewCell class] forCellReuseIdentifier: NSStringFromClass([YLZHealthCodeCheckTableViewCell class])];
        [_tableView registerClass:[YLZHealthCodeServiceTableViewCell class] forCellReuseIdentifier: NSStringFromClass([YLZHealthCodeServiceTableViewCell class])];
        [_tableView registerClass:[YLZHealthCodeSourceTableViewCell class] forCellReuseIdentifier: NSStringFromClass([YLZHealthCodeSourceTableViewCell class])];
    }
    return _tableView;
}

- (NSMutableArray *)dataArrays
{
    if (!_dataArrays) {
        _dataArrays = [NSMutableArray array];
        for (int i = 0; i<5; i++) {
            [_dataArrays addObject:@(i)];
        }
    }
    return _dataArrays;
}
      
@end
