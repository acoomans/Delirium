//
//  NSMutableArray+Extras.m
//  Delirium
//
//  Created by arnaud on 3/05/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "NSMutableArray+Extras.h"


@implementation NSMutableArray (Extras)

- (void)insertObjectsFromArray:(NSArray *)otherArray atIndex:(NSUInteger)index {
	for (id object in [otherArray reverseObjectEnumerator]) {
		[self insertObject:object atIndex:index];
	}
}

@end
