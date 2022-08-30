//
//  YLZRouteCodeView.h
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import <UIKit/UIKit.h>

@protocol YLZRouteCodeViewDelegate <NSObject>

@optional

//声明代理方法
- (void)toExcute:(NSInteger )index;
//核酸检测+疫苗接种：
- (void)toRecord:(NSInteger )index;
//扫一扫：
- (void)toScan;
//点击查询行程卡：
- (void)toProcess;
    
@end
    
@interface YLZRouteCodeView : UIView {
}

@property (nonatomic, strong) UITableView *tableView;
    
@property (nonatomic ,weak) id <YLZRouteCodeViewDelegate> delegate;

@property (nonatomic, assign) BOOL isLoading;
    
@end
