//
//  YLZNetWork.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

/**定义请求类型的枚举*/

typedef NS_ENUM(NSUInteger,YLZHttpRequestType)
{

    YLZHttpRequestTypeGet = 0,
    YLZHttpRequestTypePost

};


/**定义请求成功的block*/
typedef void(^requestSuccess)( NSDictionary * object);

/**定义请求失败的block*/
typedef void(^requestFailure)( NSError *error);


@interface YLZNetWork : AFHTTPSessionManager


/**
 *  单例方法
 *
 *  @return 实例对象
 */
+ (instancetype)shareManager;

/**
 *  网络请求的实例方法
 *
 *  @param type         get / post
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param successBlock 请求成功的回调
 *  @param failureBlock 请求失败的回调
 */
+ (void)requestWithType:(YLZHttpRequestType)type withUrlString:(NSString *)urlString withParaments:(id)paraments Authos:(NSString *)Authos withSuccessBlock:( requestSuccess)successBlock withFailureBlock:( requestFailure)failureBlock;



@end

NS_ASSUME_NONNULL_END

