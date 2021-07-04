//
//  YLZCollegeAreaPickerView.h
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import <UIKit/UIKit.h>

@protocol YLZCollegeAreaPickerViewDelegate <NSObject>

@optional

// 确定按钮点击回调
- (void)ylz_selected:(NSString *)nameString;

// 取消按钮点击回调
- (void)ylz_cancel;

@end

@interface YLZCollegeAreaPickerView : UIView

/** 选择器代理 */
@property (nonatomic, weak) id<YLZCollegeAreaPickerViewDelegate> delegate;

/** 显示选择器 */
- (void)ylz_show;

@end
