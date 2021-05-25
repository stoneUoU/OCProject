//
//  YLZNetWork.m
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "YLZNetWork.h"

@implementation YLZNetWork



#pragma mark - shareManager
/**
 *  获得全局唯一的网络请求实例单例方法
 *
 *  @return 网络请求类的实例
 */

+ (instancetype)shareManager {

    static YLZNetWork * manager = nil;

    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{

        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@""]];
    });

    return manager;
}


#pragma mark - 重写initWithBaseURL
/**
 *
 *
 *  @param url baseUrl
 *
 *  @return 通过重写夫类的initWithBaseURL方法,返回网络请求类的实例
 */

- (instancetype)initWithBaseURL:(NSURL *)url
{
    if (self = [super initWithBaseURL:url]) {
        //可根据具体情况进行设置
        NSAssert(url,@"您需要为您的请求设置baseUrl");
        /**设置相应的缓存策略*/

        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;

        /**分别设置请求以及相应的序列化器*/
        self.requestSerializer = [AFJSONRequestSerializer serializer];

        /**复杂的参数类型 需要使用json传值-设置请求内容的类型*/

        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

        //此处做为测试 可根据自己应用设置相应的值
        /**设置apikey ------类似于自己应用中的tokken---此处仅仅作为测试使用*/
        //[self.requestSerializer setValue:apikey forHTTPHeaderField:@"apikey"];
        /**设置接受的类型*/
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil,nil];

    }

    return self;
}


#pragma mark - 网络请求的类方法---get/post

/**
 *  网络请求的实例方法
 *
 *  @param type         get / post
 *  @param urlString    请求的地址
 *  @param paraments    请求的参数
 *  @param successBlock 请求成功的回调
 *  @param failureBlock 请求失败的回调
 */

+(void)requestWithType:(YLZHttpRequestType)type withUrlString:(NSString *)urlString withParaments:(id)paraments Authos:(NSString *)Authos withSuccessBlock:(requestSuccess)successBlock withFailureBlock:(requestFailure)failureBlock
{

    switch (type) {

        case YLZHttpRequestTypeGet:
        {
            //设置请求头
            [[YLZNetWork shareManager].requestSerializer setValue:Authos forHTTPHeaderField:@"token"];
            /**设置请求超时时间*/
            [[YLZNetWork shareManager].requestSerializer setTimeoutInterval:30];
            [[YLZNetWork shareManager] GET:urlString parameters:paraments headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if([responseObject isKindOfClass:[NSData class]]){   //根据后台返回的数据类型进行判断，若为NSData，则转成NSDict
                    successBlock([NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
                }else{
                    successBlock(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureBlock(error);
            }];
            break;
        }
        case YLZHttpRequestTypePost: {
            //设置请求头
            [[YLZNetWork shareManager].requestSerializer setValue:Authos forHTTPHeaderField:@"token"];
            /**设置请求超时时间*/
            [[YLZNetWork shareManager].requestSerializer setTimeoutInterval:30];
            [[YLZNetWork shareManager] POST:urlString parameters:paraments headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if([responseObject isKindOfClass:[NSData class]]){   //根据后台返回的数据类型进行判断，若为NSData，则转成NSDict
                    successBlock([NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil]);
                }else{
                    successBlock(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failureBlock(error);
            }];
        }
    }
}

@end
