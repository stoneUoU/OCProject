#import "TraeFootprintViewController.h"
#import "YLZKitCategory.h"
#import <QuartzCore/QuartzCore.h>

@interface TraeFootprintItemCell : UITableViewCell

@property (nonatomic, strong) UIView *cardView;
@property (nonatomic, strong) UIView *iconContainerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *verticalDashImageView;

- (void)configureWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor;

@end

@implementation TraeFootprintItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        [self setupConstraints];
    }
    return self;
}

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = UIColor.clearColor;
    self.contentView.backgroundColor = UIColor.clearColor;
    
    self.cardView = [[UIView alloc] init];
    self.cardView.layer.cornerRadius = 8.0;
    self.cardView.layer.masksToBounds = YES;
    
    self.iconContainerView = [[UIView alloc] init];
    self.iconContainerView.layer.cornerRadius = 18.0;
    self.iconContainerView.layer.masksToBounds = YES;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [YLZFont regular:14];
    self.titleLabel.textColor = YLZColorTitleOne;
    
    self.verticalDashImageView = [[UIImageView alloc] init];
    self.verticalDashImageView.backgroundColor = UIColor.clearColor;
    
    [self.contentView addSubview:self.verticalDashImageView];
    [self.contentView addSubview:self.cardView];
    [self.cardView addSubview:self.iconContainerView];
    [self.cardView addSubview:self.titleLabel];
}

- (void)setupConstraints {
    [self.verticalDashImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).offset(48);
        make.width.mas_equalTo(2);
    }];
    
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        make.left.equalTo(self.verticalDashImageView.mas_right).offset(24);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.height.mas_greaterThanOrEqualTo(56);
    }];
    
    [self.iconContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cardView);
        make.left.equalTo(self.cardView.mas_left).offset(16);
        make.width.height.mas_equalTo(36);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cardView);
        make.left.equalTo(self.iconContainerView.mas_right).offset(12);
        make.right.lessThanOrEqualTo(self.cardView.mas_right).offset(-16);
    }];
}

- (void)configureWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor {
    self.cardView.backgroundColor = backgroundColor;
    self.iconContainerView.backgroundColor = UIColor.whiteColor;
    self.titleLabel.text = title;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateVerticalDashLine];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.verticalDashImageView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
}

- (void)updateVerticalDashLine {
    [self.verticalDashImageView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    CGFloat height = CGRectGetHeight(self.verticalDashImageView.bounds);
    if (height <= 0) {
        return;
    }
    
    CAShapeLayer *dashLayer = [CAShapeLayer layer];
    dashLayer.strokeColor = YLZColorTitleThree.CGColor;
    dashLayer.lineWidth = 2.0;
    dashLayer.lineDashPattern = @[@4, @2];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat centerX = CGRectGetWidth(self.verticalDashImageView.bounds) / 2.0;
    [path moveToPoint:CGPointMake(centerX, 0)];
    [path addLineToPoint:CGPointMake(centerX, height)];
    
    dashLayer.path = path.CGPath;
    [self.verticalDashImageView.layer addSublayer:dashLayer];
}

@end

@interface TraeFootprintViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *statusView;
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *segmentView;
@property (nonatomic, strong) UIButton *serviceButton;
@property (nonatomic, strong) UIButton *informationButton;
@property (nonatomic, strong) UIButton *policyButton;
@property (nonatomic, strong) UIView *segmentIndicatorView;

@property (nonatomic, strong) UIView *calendarView;
@property (nonatomic, strong) UIView *weekRowView;
@property (nonatomic, strong) UIView *dayRowView;
@property (nonatomic, strong) UIView *calendarSeparatorView;

@property (nonatomic, strong) UILabel *footprintTitleLabel;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<NSDictionary *> *sectionModels;

@end

@implementation TraeFootprintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (BOOL)hidesBottomBarWhenPushed {
    return self.navigationController.topViewController == self;
}

- (void)setupData {
    UIColor *serviceColor = colorSecondaryGray1;
    UIColor *jobColor = colorSecondaryGray2;
    UIColor *recruitColor = colorSecondaryGray3;
    
    self.sectionModels = @[
        @{
            @"date": @"12月5日",
            @"items": @[
                @{@"title": @"法定年龄退休计算器", @"color": serviceColor},
                @{@"title": @"就业在线", @"color": jobColor},
                @{@"title": @"全国招聘服务", @"color": recruitColor}
            ]
        },
        @{
            @"date": @"12月4日",
            @"items": @[
                @{@"title": @"法定年龄退休计算器", @"color": colorSecondaryGray1},
                @{@"title": @"就业在线", @"color": colorSecondaryGray2},
                @{@"title": @"全国招聘服务", @"color": colorSecondaryGray1}
            ]
        }
    ];
}

- (void)setupUI {
    self.view.backgroundColor = YLZColorWhite;
    
    [self.view addSubview:self.statusView];
    [self.view addSubview:self.navigationView];
    [self.navigationView addSubview:self.backButton];
    [self.navigationView addSubview:self.titleLabel];
    
    [self.view addSubview:self.segmentView];
    [self.segmentView addSubview:self.serviceButton];
    [self.segmentView addSubview:self.informationButton];
    [self.segmentView addSubview:self.policyButton];
    [self.segmentView addSubview:self.segmentIndicatorView];
    
    [self.view addSubview:self.calendarView];
    [self.calendarView addSubview:self.weekRowView];
    [self.calendarView addSubview:self.dayRowView];
    
    [self.view addSubview:self.calendarSeparatorView];
    [self.view addSubview:self.footprintTitleLabel];
    [self.view addSubview:self.tableView];
    
    [self setupConstraints];
    [self setupCalendar];
}

- (void)setupConstraints {
    [self.statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(StatusBarHeight);
    }];
    
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(NavBarHeight);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.left.equalTo(self.navigationView.mas_left).offset(16);
        make.height.mas_equalTo(NavBarHeight);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.navigationView);
    }];
    
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    [self.serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.segmentView);
        make.left.equalTo(self.segmentView.mas_left).offset(40);
    }];
    
    [self.policyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.segmentView);
        make.right.equalTo(self.segmentView.mas_right).offset(-40);
    }];
    
    [self.informationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.segmentView);
        make.centerX.equalTo(self.segmentView);
    }];
    
    [self.segmentIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.segmentView.mas_bottom);
        make.centerX.equalTo(self.serviceButton);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(2);
    }];
    
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(96);
    }];
    
    [self.weekRowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.calendarView.mas_top).offset(12);
        make.left.equalTo(self.calendarView.mas_left).offset(16);
        make.right.equalTo(self.calendarView.mas_right).offset(-16);
        make.height.mas_equalTo(20);
    }];
    
    [self.dayRowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weekRowView.mas_bottom).offset(8);
        make.left.equalTo(self.calendarView.mas_left).offset(16);
        make.right.equalTo(self.calendarView.mas_right).offset(-16);
        make.height.mas_equalTo(40);
    }];
    
    [self.calendarSeparatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.calendarView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(8);
    }];
    
    [self.footprintTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.calendarSeparatorView.mas_bottom).offset(16);
        make.left.equalTo(self.view.mas_left).offset(16);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.footprintTitleLabel.mas_bottom).offset(8);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)setupCalendar {
    NSArray *weekTitles = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    NSMutableArray<UILabel *> *weekLabels = [NSMutableArray array];
    for (NSString *title in weekTitles) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [YLZFont regular:12];
        if ([title isEqualToString:@"日"] || [title isEqualToString:@"六"]) {
            label.textColor = YLZColorRed;
        } else {
            label.textColor = YLZColorTitleThree;
        }
        label.textAlignment = NSTextAlignmentCenter;
        label.text = title;
        [self.weekRowView addSubview:label];
        [weekLabels addObject:label];
    }
    
    [weekLabels mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                          withFixedSpacing:0
                               leadSpacing:0
                               tailSpacing:0];
    [weekLabels mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.weekRowView);
    }];
    
    NSArray *dayNumbers = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    NSMutableArray<UILabel *> *dayLabels = [NSMutableArray array];
    UILabel *selectedDayLabel = nil;
    UIView *selectedCircleView = nil;
    for (NSString *day in dayNumbers) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [YLZFont regular:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = day;
        label.textColor = YLZColorTitleTwo;
        [self.dayRowView addSubview:label];
        [dayLabels addObject:label];
        
        if ([day isEqualToString:@"7"]) {
            UIView *circleView = [[UIView alloc] init];
            circleView.backgroundColor = colorMain;
            circleView.layer.cornerRadius = 16.0;
            circleView.layer.masksToBounds = YES;
            [self.dayRowView insertSubview:circleView belowSubview:label];
            
            [circleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(label);
                make.width.height.mas_equalTo(32);
            }];
            
            label.textColor = YLZColorWhite;
            
            UIView *dotView = [[UIView alloc] init];
            dotView.backgroundColor = colorMain;
            dotView.layer.cornerRadius = 2.0;
            dotView.layer.masksToBounds = YES;
            [self.dayRowView addSubview:dotView];
            
            [dotView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(circleView.mas_bottom).offset(4);
                make.centerX.equalTo(circleView.mas_centerX);
                make.width.height.mas_equalTo(4);
            }];
            
            selectedDayLabel = label;
            selectedCircleView = circleView;
        }
    }
    
    [dayLabels mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                          withFixedSpacing:0
                               leadSpacing:0
                               tailSpacing:0];
    [dayLabels mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dayRowView);
    }];
    
    if (selectedCircleView && selectedDayLabel) {
        [selectedCircleView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(selectedDayLabel);
            make.width.height.mas_equalTo(32);
        }];
    }
}

- (void)toBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)segmentButtonTapped:(UIButton *)sender {
    if (sender == self.serviceButton) {
        [self updateSegmentSelectionIndex:0];
    } else if (sender == self.informationButton) {
        [self updateSegmentSelectionIndex:1];
    } else if (sender == self.policyButton) {
        [self updateSegmentSelectionIndex:2];
    }
}

- (void)updateSegmentSelectionIndex:(NSInteger)index {
    UIButton *buttons[3] = {self.serviceButton, self.informationButton, self.policyButton};
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *button = buttons[i];
        if (i == index) {
            [button setTitleColor:colorMain forState:UIControlStateNormal];
            button.titleLabel.font = [YLZFont medium:16];
        } else {
            [button setTitleColor:YLZColorTitleThree forState:UIControlStateNormal];
            button.titleLabel.font = [YLZFont regular:16];
        }
    }
    
    UIButton *targetButton = buttons[index];
    [self.segmentIndicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.segmentView.mas_bottom);
        make.centerX.equalTo(targetButton);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(2);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.segmentView layoutIfNeeded];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *sectionInfo = self.sectionModels[section];
    NSArray *items = sectionInfo[@"items"];
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TraeFootprintItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TraeFootprintItemCell" forIndexPath:indexPath];
    NSDictionary *sectionInfo = self.sectionModels[indexPath.section];
    NSArray *items = sectionInfo[@"items"];
    NSDictionary *item = items[indexPath.row];
    NSString *title = item[@"title"];
    UIColor *backgroundColor = item[@"color"];
    [cell configureWithTitle:title backgroundColor:backgroundColor];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = YLZColorWhite;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = colorSecondaryGray3;
    
    UIView *dateContainer = [[UIView alloc] init];
    dateContainer.backgroundColor = colorMain;
    dateContainer.layer.cornerRadius = 4.0;
    dateContainer.layer.masksToBounds = YES;
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.font = [YLZFont regular:12];
    dateLabel.textColor = YLZColorWhite;
    dateLabel.textAlignment = NSTextAlignmentCenter;
    NSDictionary *sectionInfo = self.sectionModels[section];
    dateLabel.text = sectionInfo[@"date"];
    
    [headerView addSubview:lineView];
    [headerView addSubview:dateContainer];
    [dateContainer addSubview:dateLabel];
    
    [dateContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).offset(16);
        make.centerY.equalTo(headerView);
        make.height.mas_equalTo(24);
        make.width.mas_greaterThanOrEqualTo(64);
    }];
    
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(dateContainer).insets(UIEdgeInsetsMake(0, 8, 0, 8));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(dateContainer.mas_centerX);
        make.top.equalTo(headerView.mas_top);
        make.bottom.equalTo(headerView.mas_bottom);
        make.width.mas_equalTo(2);
    }];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

#pragma mark - Lazy load

- (UIView *)statusView {
    if (!_statusView) {
        _statusView = [[UIView alloc] init];
        _statusView.backgroundColor = colorMain;
    }
    return _statusView;
}

- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc] init];
        _navigationView.backgroundColor = colorMain;
    }
    return _navigationView;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"ylz_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(toBack) forControlEvents:UIControlEventTouchUpInside];
        _backButton.tintColor = YLZColorWhite;
    }
    return _backButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [YLZFont medium:18];
        _titleLabel.textColor = YLZColorWhite;
        _titleLabel.text = @"我的足迹";
    }
    return _titleLabel;
}

- (UIView *)segmentView {
    if (!_segmentView) {
        _segmentView = [[UIView alloc] init];
        _segmentView.backgroundColor = YLZColorWhite;
    }
    return _segmentView;
}

- (UIButton *)serviceButton {
    if (!_serviceButton) {
        _serviceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_serviceButton setTitle:@"服务" forState:UIControlStateNormal];
        [_serviceButton setTitleColor:colorMain forState:UIControlStateNormal];
        _serviceButton.titleLabel.font = [YLZFont medium:16];
        [_serviceButton addTarget:self action:@selector(segmentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _serviceButton;
}

- (UIButton *)informationButton {
    if (!_informationButton) {
        _informationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_informationButton setTitle:@"资讯" forState:UIControlStateNormal];
        [_informationButton setTitleColor:YLZColorTitleThree forState:UIControlStateNormal];
        _informationButton.titleLabel.font = [YLZFont regular:16];
        [_informationButton addTarget:self action:@selector(segmentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _informationButton;
}

- (UIButton *)policyButton {
    if (!_policyButton) {
        _policyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_policyButton setTitle:@"政策" forState:UIControlStateNormal];
        [_policyButton setTitleColor:YLZColorTitleThree forState:UIControlStateNormal];
        _policyButton.titleLabel.font = [YLZFont regular:16];
        [_policyButton addTarget:self action:@selector(segmentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _policyButton;
}

- (UIView *)segmentIndicatorView {
    if (!_segmentIndicatorView) {
        _segmentIndicatorView = [[UIView alloc] init];
        _segmentIndicatorView.backgroundColor = colorMain;
        _segmentIndicatorView.layer.cornerRadius = 1.0;
        _segmentIndicatorView.layer.masksToBounds = YES;
    }
    return _segmentIndicatorView;
}

- (UIView *)calendarView {
    if (!_calendarView) {
        _calendarView = [[UIView alloc] init];
        _calendarView.backgroundColor = YLZColorWhite;
    }
    return _calendarView;
}

- (UIView *)weekRowView {
    if (!_weekRowView) {
        _weekRowView = [[UIView alloc] init];
    }
    return _weekRowView;
}

- (UIView *)dayRowView {
    if (!_dayRowView) {
        _dayRowView = [[UIView alloc] init];
    }
    return _dayRowView;
}

- (UIView *)calendarSeparatorView {
    if (!_calendarSeparatorView) {
        _calendarSeparatorView = [[UIView alloc] init];
        _calendarSeparatorView.backgroundColor = colorBg;
    }
    return _calendarSeparatorView;
}

- (UILabel *)footprintTitleLabel {
    if (!_footprintTitleLabel) {
        _footprintTitleLabel = [[UILabel alloc] init];
        _footprintTitleLabel.font = [YLZFont medium:16];
        _footprintTitleLabel.textColor = YLZColorTitleOne;
        _footprintTitleLabel.text = @"足迹";
    }
    return _footprintTitleLabel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = YLZColorWhite;
        [_tableView registerClass:[TraeFootprintItemCell class] forCellReuseIdentifier:@"TraeFootprintItemCell"];
    }
    return _tableView;
}

@end
