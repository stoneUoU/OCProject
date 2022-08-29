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
    
@end
    
@interface YLZRouteCodeView : UIView {
}

@property (nonatomic, strong) UITableView *tableView;
    
@property (nonatomic ,weak) id <YLZRouteCodeViewDelegate> delegate;

@property (nonatomic, assign) BOOL isLoading;
    
@end
