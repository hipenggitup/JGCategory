//
//  NSArray+JGSafe.m
//  category
//
//  Created by 孙海朋 on 15/3/23.
//  Copyright (c) 2015年 JG. All rights reserved.
//

#import "NSArray+JGSafe.h"

@implementation NSArray (JGSafe)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"数组越界");
#endif
    }
    
    return nil;
}

- (NSArray *)uniqueArray
{
    NSMutableArray *uniqeArr = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         if (![uniqeArr containsObject:obj]) {
             [uniqeArr safeAddObject:obj];
         }
     }];
    return uniqeArr;
}

- (NSArray *)randomArray
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    NSInteger i = array.count;
    while (--i > 0) {
        int j = arc4random() % (i + 1);
        [array exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    return [NSArray arrayWithArray:array];
}

@end

@implementation NSMutableArray (JGSafe)
- (void)uniqueAddObject:(id)objcet
{
    if (objcet && ![self containsObject:objcet]) {
        [self safeAddObject:objcet];
    }
}

- (void)safeAddObject:(id)object
{
    if (object) {
        
        [self addObject:object];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"不能添加nil Object");
#endif
    }
}

- (void)safeAddNilObject
{
    [self addObject:[NSNull null]];
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"不能添加nil Object");
#endif
    }
}

@end

@implementation NSMutableDictionary (JGSafe)
- (void)safeSetObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
    else {
#if DEBUG_ASSERT
        if (anObject == nil) {
            NSAssert(NO, @"不能添加nil Object");
        }
        else if (aKey == nil) {
            NSAssert(NO, @"key不能为nil");
        }
#endif
    }
}

- (void)safeSetValue:(id)value forKey:(NSString *)key
{
    if (value && key) {
        [self setValue:value forKey:key];
    }
    else {
#if DEBUG_ASSERT
        if (value == nil) {
            NSAssert(NO, @"不能添加nil value");
        }
        else if (key == nil) {
            NSAssert(NO, @"key不能为nil");
        }
#endif
    }
}

- (void)safesetNilObject:(id)anObject forKey:(id)aKey
{
    [self setObject:[NSNull null] forKey:aKey];
}

- (void)safeSetNilValue:(id)value forKey:(NSString *)key
{
    [self setValue:[NSNull null] forKey:key];
}

- (void)safeRemoveObjectForKey:(id)aKey
{
    if (aKey) {
        [self removeObjectForKey:aKey];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"aKey不能为nil");
#endif
    }
}
@end

