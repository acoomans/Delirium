//
//  NSObject+Mapping.m
//  Delirium
//
//  Created by Arnaud Coomans on 02/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "NSObject+Mapping.h"


@implementation NSObject (Mapping)



- (id)mapDictionary:(NSDictionary *)dict {
	return [self mapDictionary:dict toObject:self];
}


- (id)mapDictionary:(NSDictionary *)dict toObject:(id)object {
	
	NSDictionary *mapping = nil;
	
	if ([self respondsToSelector:@selector(mappingForContext:)]) {
		mapping = [self performSelector:@selector(mappingForContext:) withObject:dict];
	}
	
    for (NSString *key in [dict allKeys]) {
		
		NSString *propertyName = [mapping objectForKey:key];
		
		if (!propertyName) {
			propertyName = key;
		}
        
		if ([object hasSetterForKey:propertyName]) {
			[object setValue:[dict objectForKey:key] forKey:propertyName];
		}
     	
    }
	
	return self;
}

- (BOOL)hasSetterForKey:(NSString*)key {
	NSString *setterString = [NSString stringWithFormat:@"set%@%@:",
							  [[key substringToIndex:1] capitalizedString],
							  [key substringFromIndex:1]];
	if ([self respondsToSelector:NSSelectorFromString(setterString)]) {
		return YES;
	}
	return NO;
}


@end
