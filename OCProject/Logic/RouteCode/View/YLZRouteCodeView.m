//
//  YLZRouteCodeView.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeView.h"
#import "YLZRouteCodeLoadingCell.h"
#import "YLZRouteCodeCell.h"
#import "YLZRouteCodeRecordCell.h"
#import "YLZRouteCodeInfoCell.h"
#import "YLZRouteCodeTableHeaderView.h"
#import "YLZRouteCodeTableFooterView.h"
#import "YLZFunctionModel.h"

@interface YLZRouteCodeView()<UITableViewDelegate,UITableViewDataSource> {
    
}

@property (nonatomic, strong) NSMutableArray *dataArrays;

@property (nonatomic, assign) NSInteger clickNum;


@end
    
@implementation YLZRouteCodeView
    
#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        self.clickNum = 0;
        self.isLoading = YES;
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
    if (section == 0 || section == 1) {
        return 1;
    } else {
        return funcModels.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (self.isLoading) {
            return 400;
        } else {
            return 556;
        }
    } else if (indexPath.section == 1) {
        return 96;
    } else {
        return 64;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        YLZRouteCodeTableHeaderView *headerView = [[YLZRouteCodeTableHeaderView alloc] init];
        return headerView;
    } else {
        UIView *headerView = [[UIView alloc] init];
        return headerView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 72;
    }
    return 0.00001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == self.dataArrays.count - 1) {
        YLZRouteCodeTableFooterView *footerView = [[YLZRouteCodeTableFooterView alloc] init];
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
    if (indexPath.section == 0) {
        if (self.isLoading) {
            YLZRouteCodeLoadingCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZRouteCodeLoadingCell class])];
            if (! viewCell){
                viewCell = [[YLZRouteCodeLoadingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZRouteCodeLoadingCell class])];
            }
            viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return viewCell;
        }
        YLZRouteCodeCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZRouteCodeCell class])];
        if (! viewCell){
            viewCell = [[YLZRouteCodeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZRouteCodeCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return viewCell;
    } else if (indexPath.section == 1) {
        YLZRouteCodeRecordCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZRouteCodeRecordCell class])];
        if (! viewCell){
            viewCell = [[YLZRouteCodeRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZRouteCodeRecordCell class])];
        }
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return viewCell;
    } else if (indexPath.section == 2 || indexPath.section == 3) {
        YLZRouteCodeInfoCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YLZRouteCodeInfoCell class])];
        if (! viewCell){
            viewCell = [[YLZRouteCodeInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([YLZRouteCodeInfoCell class])];
        }
        NSMutableArray <YLZFunctionModel *>*funcModels = self.dataArrays[indexPath.section];
        YLZFunctionModel *funcModel = funcModels[indexPath.row];
        viewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        viewCell.funcModel = funcModel;
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
        [_tableView registerClass:[YLZRouteCodeLoadingCell class] forCellReuseIdentifier: NSStringFromClass([YLZRouteCodeLoadingCell class])];
        [_tableView registerClass:[YLZRouteCodeCell class] forCellReuseIdentifier: NSStringFromClass([YLZRouteCodeCell class])];
        [_tableView registerClass:[YLZRouteCodeRecordCell class] forCellReuseIdentifier: NSStringFromClass([YLZRouteCodeRecordCell class])];
        [_tableView registerClass:[YLZRouteCodeInfoCell class] forCellReuseIdentifier: NSStringFromClass([YLZRouteCodeInfoCell class])];
    }
    return _tableView;
}

- (NSMutableArray *)dataArrays
{
    if (!_dataArrays) {
        _dataArrays = [NSMutableArray array];
        for (int i = 0; i<4; i++) {
            if (i == 0 || i == 1) {
                [_dataArrays addObject:@[]];
            } else if (i == 2) {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<7; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.iconName = @"ylz_error_phone";
                        funcModel.functionName = @"有异常要打电话";
                        funcModel.topFillet = YES;
                    } else if (j == 1) {
                        funcModel.iconName = @"ylz_personal_info_setting";
                        funcModel.functionName = @"个人信息设置";
                    } else if (j == 2) {
                        funcModel.iconName = @"ylz_add_or_delete";
                        funcModel.functionName = @"添加和删除亲友健康码";
                    } else if (j == 3) {
                        funcModel.iconName = @"ylz_questions";
                        funcModel.functionName = @"有疑问想得到解答";
                    } else if (j == 4) {
                        funcModel.iconName = @"ylz_download_love_card";
                        funcModel.functionName = @"下载福码爱心卡";
                    } else if (j == 5) {
                        funcModel.iconName = @"ylz_manage_code";
                        funcModel.functionName = @"管理张贴码";
                    } else if (j == 6) {
                        funcModel.iconName = @"ylz_add_desktop";
                        funcModel.functionName = @"添加健康码到桌面";
                        funcModel.bottomFillet = YES;
                    }
                    [funcModels addObject:funcModel];
                }
                [_dataArrays addObject:funcModels];
            } else {
                NSMutableArray <YLZFunctionModel *>*funcModels = [NSMutableArray array];
                for (int j = 0; j<4; j++) {
                    YLZFunctionModel *funcModel = [[YLZFunctionModel alloc] init];
                    if (j == 0) {
                        funcModel.iconName = @"ylz_detect_map";
                        funcModel.functionName = @"核酸检测地图";
                        funcModel.topFillet = YES;
                    } else if (j == 1) {
                        funcModel.iconName = @"ylz_yimiao_pre";
                        funcModel.functionName = @"疫苗接种预约";
                    } else if (j == 2) {
                        funcModel.iconName = @"ylz_yimiao_map";
                        funcModel.functionName = @"疫苗接种地图";
                    } else {
                        funcModel.iconName = @"ylz_elec_code";
                        funcModel.functionName = @"医保电子凭证";
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

