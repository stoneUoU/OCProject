//
//  YLZVaccineFetchView.m
//  OCProject
//
//  Created by stone on 2022/9/30.
//

#import "YLZVaccineFetchView.h"
#import "YLZAcidCheckInfoCell.h"
#import "YLZVaccineFetchTableHeaderView.h"
#import "YLZAcidCheckTableFooterView.h"
#import "YLZFunctionModel.h"

@interface YLZVaccineFetchView()<UITableViewDelegate,UITableViewDataSource> {
    
}

@property (nonatomic, strong) NSMutableArray *dataArrays;

@end
    
@implementation YLZVaccineFetchView
    
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
    NSMutableArray <YLZFunctionModel *>*funcModels = self.dataArrays[section];
    return funcModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        YLZVaccineFetchTableHeaderView *headerView = [[YLZVaccineFetchTableHeaderView alloc] init];
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
        footerView.supportLabel.text = @"1.当前支持查询全国疫苗接种记录";
        footerView.linkLabel.text = @"2.相关查询结果基于国家、福建省等卫生健康部门数据库，正在不断汇聚更新";
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
        [_tableView registerClass:[YLZAcidCheckInfoCell class] forCellReuseIdentifier: NSStringFromClass([YLZAcidCheckInfoCell class])];
    }
    return _tableView;
}

- (NSMutableArray *)dataArrays
{
    if (!_dataArrays) {
        _dataArrays = [NSMutableArray array];
        for (int i = 0; i<2; i++) {
            if (i == 0) {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<5; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.functionName = @"第二剂";
                        funcModel.fontSize = 18;
                        funcModel.subName = @"2021-08-22 16:05:00";
                    } else if (j == 1) {
                        funcModel.functionName = @"疫苗种类";
                        funcModel.subName = @"新冠疫苗（Vero细胞）";
                        funcModel.functionNameColor = @"#606266";
                    } else if (j == 2) {
                        funcModel.functionName = @"批号";
                        funcModel.subName = @"202107114N";
                        funcModel.functionNameColor = @"#606266";
                    } else if (j == 3) {
                        funcModel.functionName = @"生产企业";
                        funcModel.subName = @"北京科兴中维";
                        funcModel.functionNameColor = @"#606266";
                    } else if (j == 4) {
                        funcModel.functionName = @"接种机构";
                        funcModel.subName = @"殿前街道社区卫生服务中心";
                        funcModel.functionNameColor = @"#606266";
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
                        funcModel.functionName = @"第一剂";
                        funcModel.fontSize = 18;
                        funcModel.subName = @"2021-07-28 10:33:00";
                    } else if (j == 1) {
                        funcModel.functionName = @"疫苗种类";
                        funcModel.subName = @"新冠疫苗（Vero细胞）";
                        funcModel.functionNameColor = @"#606266";
                    } else if (j == 2) {
                        funcModel.functionName = @"批号";
                        funcModel.subName = @"202106061Z";
                        funcModel.functionNameColor = @"#606266";
                    } else if (j == 3) {
                        funcModel.functionName = @"生产企业";
                        funcModel.subName = @"北京科兴中维";
                        funcModel.functionNameColor = @"#606266";
                    } else if (j == 4) {
                        funcModel.functionName = @"接种机构";
                        funcModel.subName = @"禾山街道社区卫生服务中心";
                        funcModel.functionNameColor = @"#606266";
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



