//
//  YLZRunloopViewController.m
//  OCProject
//
//  Created by stone on 2022/8/22.
//

#import "YLZRunloopViewController.h"

// 任务block
typedef void(^runloopHandle)(void);

//    typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
//        kCFRunLoopEntry         = (1UL << 0), // 即将进入Loop
//        kCFRunLoopBeforeTimers  = (1UL << 1), // 即将处理 Timer
//        kCFRunLoopBeforeSources = (1UL << 2), // 即将处理 Source
//        kCFRunLoopBeforeWaiting = (1UL << 5), // 即将进入休眠
//        kCFRunLoopAfterWaiting  = (1UL << 6), // 刚从休眠中唤醒
//        kCFRunLoopExit          = (1UL << 7), // 即将退出Loop
//        kCFRunLoopAllActivities = 0x0FFFFFFFU // 所有事件
//    };

static void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
//    YLZLOG(@"runloop______%@",CFRunLoopGetCurrent());
    YLZRunloopViewController *vc = (__bridge YLZRunloopViewController *)info;
    // 无任务  退出
    if (vc.taskArrays.count == 0) return;
    // 从数组中取出任务
    runloopHandle block = [vc.taskArrays firstObject];
    // 执行任务
    if (block) {
        block();
    }
    // 执行完任务之后移除任务
    [vc.taskArrays removeObjectAtIndex:0];
}

@interface YLZRunloopViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSUInteger maxTaskCount;

@end

@implementation YLZRunloopViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)dealloc {
    YLZLOG(@"界面销毁");
}

- (instancetype)init
{
    self = [super init ];//当前对象self
    if (self !=nil) {//如果对象初始化成功，才有必要进行接下来的初始化
        self.maxTaskCount = 50;
    }
    return self;//返回一个已经初始化完毕的对象；
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBaseUI:YLZColorLightBlueView withTitleString:@"首页" withTitleColor:YLZColorWhite withLeftImageViewString:@"" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    [self.view addSubview:self.tableView];
    // 创建定时器 (保证runloop回调函数一直在执行)
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self
                                                             selector:@selector(doSomething)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];

    //添加runloop观察者
    [self addRunloopObserver];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Private Method
#pragma mark -

- (void)doSomething {
    YLZLOG(@"正在执行中...");
}

// 添加runloop观察者
- (void)addRunloopObserver {
    // 1.获取当前Runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    // 2.创建观察者
    // 2.0 定义上下文
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    // 2.1 定义观察者
    static CFRunLoopObserverRef defaultModeObserver;
    // 2.2 创建观察者
    defaultModeObserver = CFRunLoopObserverCreate(kCFAllocatorDefault,kCFRunLoopBeforeWaiting,YES,0,&callBack,&context);
    // 3. 给当前Runloop添加观察者
    // CFRunLoopMode mode : 设置任务执行的模式
    CFRunLoopAddObserver(runloop, defaultModeObserver, kCFRunLoopCommonModes);
    // C中出现 copy,retain,Create等关键字,都需要release
    CFRelease(defaultModeObserver);
}

- (void)addTasks:(runloopHandle )task {
    // 保存新任务
    [self.taskArrays addObject:task];
    // 如果超出最大任务数 丢弃之前的任务
    if (self.taskArrays.count > self.maxTaskCount) {
        [self.taskArrays removeObjectAtIndex:0];
    }
}

#pragma mark - tableViewDelegate,tableViewDataSource
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 500;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!viewCell) {
        viewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    CGFloat width = (SCREENWIDTH-4*10) /3;
    // 耗时操作可以放在任务中
    [self addTasks:^{
        UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,width,130)];
        img1.image = [UIImage imageNamed:@"ylz_runloop_0.jpg"];
        [viewCell addSubview:img1];
    }];
    [self addTasks:^{
        UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(width+2*10,10,width,130)];
        img2.image = [UIImage imageNamed:@"ylz_runloop_1.jpg"];
        [viewCell addSubview:img2];
    }];
    [self addTasks:^{
        UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(2*width+3*10,10,width,130)];
        img3.image = [UIImage imageNamed:@"ylz_runloop_2.jpg"];
        [viewCell addSubview:img3];
    }];
    return viewCell;
}

#pragma mark - Lazy Load
#pragma mark -

- (NSMutableArray *)taskArrays {
    if (!_taskArrays) {
        _taskArrays = [NSMutableArray array];
    }
    return _taskArrays;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, StatusBarHeight+NavBarHeight, SCREENWIDTH, SCREENHEIGHT - (StatusBarHeight+NavBarHeight+TabBarHeight)) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.rowHeight = 150.f;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

@end
