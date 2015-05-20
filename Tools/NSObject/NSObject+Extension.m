#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

+ (instancetype)objectWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    NSArray *properties = [self objectProperties];
    
    for (NSString *key in properties) {
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    return obj;
}

///  关联对象键值
const char* propertiesKey = "propertiesKey";

+ (NSArray *)objectProperties {
    
    // 判断是否能存在关联对象
    NSMutableArray *arrayM = objc_getAssociatedObject(self, propertiesKey);
    if (arrayM != nil) {
        return arrayM;
    }
    
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList(self.class, &count);
    
    arrayM = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; ++i) {
        const char *cname = property_getName(list[i]);
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    
    // 释放属性数组
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, propertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    NSLog(@"%@", arrayM);
    
    return arrayM.copy;
}

@end
