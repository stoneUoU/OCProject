//
//  YLZHealthCodeView.h
//  OCProject
//
//  Created by stone on 2021/9/24.
//


#import <UIKit/UIKit.h>

@protocol YLZHealthCodeViewDelegate <NSObject>

@optional

//声明代理方法
- (void)toOperate;
    
@end
    
@interface YLZHealthCodeView : UIView {
}
    
@property (nonatomic ,weak) id <YLZHealthCodeViewDelegate> delegate;
    
@end
