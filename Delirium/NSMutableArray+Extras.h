//
//  NSMutableArray+Extras.h
//  Delirium
//
//  Created by arnaud on 3/05/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray (Extras)

- (void)insertObjectsFromArray:(NSArray *)otherArray atIndex:(NSUInteger)index;

@end
