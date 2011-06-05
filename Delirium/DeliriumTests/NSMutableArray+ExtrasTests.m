//
//  NSMutableArray+ExtrasTests.m
//  Delirium
//
//  Created by Arnaud Coomans on 04/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "NSMutableArray+ExtrasTests.h"
#import "NSMutableArray+Extras.h"


@implementation NSMutableArray_ExtrasTests


- (void)setUp {
    [super setUp];
	
	
}

- (void)tearDown {
	
    [super tearDown];
}




- (void)testinsertObjectsFromArray {
	NSMutableArray *dst = [NSMutableArray arrayWithObjects:@"a", @"e", nil];
	NSArray *src = [NSArray arrayWithObjects:@"b", @"c", @"d", nil];
	
	[dst insertObjectsFromArray:src atIndex:1];
	
	STAssertTrue([dst count] == 5, @"wrong array items count");
	STAssertTrue([[dst objectAtIndex:0] isEqualToString:@"a"], @"wrong item #0");
	STAssertTrue([[dst objectAtIndex:1] isEqualToString:@"b"], @"wrong item #1");
	STAssertTrue([[dst objectAtIndex:2] isEqualToString:@"c"], @"wrong item #2");
	STAssertTrue([[dst objectAtIndex:3] isEqualToString:@"d"], @"wrong item #3");
	STAssertTrue([[dst objectAtIndex:4] isEqualToString:@"e"], @"wrong item #4");
}

@end
