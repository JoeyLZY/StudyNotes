#import <Foundation/Foundation.h>

@interface NSObject (Extension)
///  字典转模型方法
+ (instancetype)objectWithDict:(NSDictionary *)dict;
///  对象属性数组
+ (NSArray *)objectProperties;
@end
