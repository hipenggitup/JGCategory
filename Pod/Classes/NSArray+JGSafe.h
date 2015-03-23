//
//  NSArray+JGSafe.h
//  category
//
//  Created by 孙海朋 on 15/3/23.
//  Copyright (c) 2015年 JG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JGSafe)
- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSArray *)uniqueArray;

- (NSArray *)randomArray;
@end

@interface NSMutableArray (JGSafe)
- (void)safeAddObject:(id)object;

- (void)uniqueAddObject:(id)objcet;

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)safeAddNilObject;

@end

@interface NSMutableDictionary (JGSafe)
- (void)safeSetObject:(id)anObject forKey:(id)aKey;

- (void)safeSetValue:(id)value forKey:(NSString *)key;

- (void)safesetNilObject:(id)anObject forKey:(id)aKey;

- (void)safeSetNilValue:(id)value forKey:(NSString *)key;

//Important Raises an NSInvalidArgumentException if aKey is nil.
- (void)safeRemoveObjectForKey:(id)aKey;
@end
