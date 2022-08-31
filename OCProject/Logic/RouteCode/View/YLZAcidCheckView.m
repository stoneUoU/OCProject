//
//  YLZAcidCheckView.m
//  OCProject
//
//  Created by stone on 2022/8/29.
//

#import "YLZAcidCheckView.h"
#import "YLZAcidCheckStatusCell.h"
#import "YLZAcidCheckInfoCell.h"
#import "YLZAcidCheckTableHeaderView.h"
#import "YLZAcidCheckTableFooterView.h"
#import "YLZFunctionModel.h"

@interface YLZAcidCheckView()<UITableViewDelegate,UITableViewDataSource> {
    
}

@property (nonatomic, strong) NSMutableArray *dataArrays;

@end
    
@implementation YLZAcidCheckView
    
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

- (NSString *)fetchSamplingTime:(NSInteger )distance {
    NSDate *nowDate = [NSDate date];
    NSDate *theDate;
    if (distance != 0) {
        NSTimeInterval oneDay = 24*60*60*1;//1天的长度
        int i = arc4random() % 10 + 50;
        theDate = [nowDate initWithTimeIntervalSinceNow:-(oneDay*distance+3*60*i)];
    } else {
        theDate = nowDate;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *currentTimeString = [formatter stringFromDate:theDate];
    return currentTimeString;
}

- (NSString *)fetchResultTime:(NSInteger )distance {
    NSDate *nowDate = [NSDate date];
    NSDate *theDate;
    if (distance != 0) {
        NSTimeInterval oneDay = 24*60*60*1;//1天的长度
        int i = arc4random() % 10 + 50;
        theDate = [nowDate initWithTimeIntervalSinceNow:(-oneDay*distance + 6*60*i)];
    } else {
        theDate = nowDate;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *currentTimeString = [formatter stringFromDate:theDate];
    return currentTimeString;
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
    NSMutableArray <YLZFunctionModel *>*funcModels = self.dataArrays[section];
    return funcModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        YLZAcidCheckTableHeaderView *headerView = [[YLZAcidCheckTableHeaderView alloc] init];
        return headerView;
    } else {
        UIView *headerView = [[UIView alloc] init];
        return headerView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return UITableViewAutomaticDimension;
    }
    return 0.00001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == self.dataArrays.count - 1) {
        YLZAcidCheckTableFooterView *footerView = [[YLZAcidCheckTableFooterView alloc] init];
        return footerView;
    } else {
        UIView *footerView = [[UIView alloc] init];
        return footerView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == self.dataArrays.count - 1)  {
        return UITableViewAutomaticDimension;
    } else {
        return 16;
    }
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
    if (indexPath.row == 0) {
        YLZAcidCheckStatusCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZAcidCheckStatusCell class])];
        if (! viewCell){
            viewCell = [[YLZAcidCheckStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZAcidCheckStatusCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSMutableArray <YLZFunctionModel *>*funcModels = self.dataArrays[indexPath.section];
        YLZFunctionModel *funcModel = funcModels[indexPath.row];
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.funcModel = funcModel;
        return viewCell;
    } else {
        YLZAcidCheckInfoCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZAcidCheckInfoCell class])];
        if (! viewCell){
            viewCell = [[YLZAcidCheckInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZAcidCheckInfoCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSMutableArray <YLZFunctionModel *>*funcModels = self.dataArrays[indexPath.section];
        YLZFunctionModel *funcModel = funcModels[indexPath.row];
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.funcModel = funcModel;
        return viewCell;
    }
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
        [_tableView registerClass:[YLZAcidCheckStatusCell class] forCellReuseIdentifier: NSStringFromClass([YLZAcidCheckStatusCell class])];
        [_tableView registerClass:[YLZAcidCheckInfoCell class] forCellReuseIdentifier: NSStringFromClass([YLZAcidCheckInfoCell class])];
    }
    return _tableView;
}

- (NSMutableArray *)dataArrays
{
    if (!_dataArrays) {
        _dataArrays = [NSMutableArray array];
        for (int i = 0; i<5; i++) {
            if (i == 0) {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<5; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.iconName = @"ylz_acid_check_yes";
                        funcModel.functionName = @"阴性";
                    } else if (j == 1) {
                        funcModel.functionName = @"姓名";
                        funcModel.subName = @"*磊";
                    } else if (j == 2) {
                        funcModel.functionName = @"采样时间";
                        funcModel.subName = [self fetchSamplingTime:1];
                    } else if (j == 3) {
                        funcModel.functionName = @"报告时间";
                        funcModel.subName = [self fetchResultTime:1];
                    } else if (j == 4) {
                        funcModel.functionName = @"检测机构";
                        funcModel.subName = @"深圳华大（厦门火眼）医学检验实验室";
                        funcModel.bottomFillet = YES;
                    }
                    [funcModels addObject:funcModel];
                }
                [_dataArrays addObject:funcModels];
            } else if (i == 1) {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<5; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.iconName = @"ylz_acid_check_yes";
                        funcModel.functionName = @"阴性";
                    } else if (j == 1) {
                        funcModel.functionName = @"姓名";
                        funcModel.subName = @"*磊";
                    } else if (j == 2) {
                        funcModel.functionName = @"采样时间";
                        funcModel.subName = [self fetchSamplingTime:2];
                    } else if (j == 3) {
                        funcModel.functionName = @"报告时间";
                        funcModel.subName = [self fetchResultTime:2];
                    } else if (j == 4) {
                        funcModel.functionName = @"检测机构";
                        funcModel.subName = @"深圳华大（厦门火眼）医学检验实验室";
                        funcModel.bottomFillet = YES;
                    }
                    [funcModels addObject:funcModel];
                }
                [_dataArrays addObject:funcModels];
            } else if (i == 2) {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<5; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.iconName = @"ylz_acid_check_yes";
                        funcModel.functionName = @"阴性";
                    } else if (j == 1) {
                        funcModel.functionName = @"姓名";
                        funcModel.subName = @"*磊";
                    } else if (j == 2) {
                        funcModel.functionName = @"采样时间";
                        funcModel.subName = [self fetchSamplingTime:4];
                    } else if (j == 3) {
                        funcModel.functionName = @"报告时间";
                        funcModel.subName = [self fetchResultTime:4];
                    } else if (j == 4) {
                        funcModel.functionName = @"检测机构";
                        funcModel.subName = @"深圳华大（厦门火眼）医学检验实验室";
                        funcModel.bottomFillet = YES;
                    }
                    [funcModels addObject:funcModel];
                }
                [_dataArrays addObject:funcModels];
            } else if (i == 3) {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<5; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.iconName = @"ylz_acid_check_yes";
                        funcModel.functionName = @"阴性";
                    } else if (j == 1) {
                        funcModel.functionName = @"姓名";
                        funcModel.subName = @"*磊";
                    } else if (j == 2) {
                        funcModel.functionName = @"采样时间";
                        funcModel.subName = [self fetchSamplingTime:6];
                    } else if (j == 3) {
                        funcModel.functionName = @"报告时间";
                        funcModel.subName = [self fetchResultTime:6];
                    } else if (j == 4) {
                        funcModel.functionName = @"检测机构";
                        funcModel.subName = @"深圳华大（厦门火眼）医学检验实验室";
                        funcModel.bottomFillet = YES;
                    }
                    [funcModels addObject:funcModel];
                }
                [_dataArrays addObject:funcModels];
            } else {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<5; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.iconName = @"ylz_acid_check_yes";
                        funcModel.functionName = @"阴性";
                    } else if (j == 1) {
                        funcModel.functionName = @"姓名";
                        funcModel.subName = @"*磊";
                    } else if (j == 2) {
                        funcModel.functionName = @"采样时间";
                        funcModel.subName = [self fetchSamplingTime:9];
                    } else if (j == 3) {
                        funcModel.functionName = @"报告时间";
                        funcModel.subName = [self fetchResultTime:9];
                    } else if (j == 4) {
                        funcModel.functionName = @"检测机构";
                        funcModel.subName = @"深圳华大（厦门火眼）医学检验实验室";
                        funcModel.bottomFillet = YES;
                    }
                    [funcModels addObject:funcModel];
                }
                [_dataArrays addObject:funcModels];
            }
        }
    }
    return _dataArrays;
}
      
@end


