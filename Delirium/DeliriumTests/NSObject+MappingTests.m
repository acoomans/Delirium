//
//  NSObject+MappingTests.m
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "NSObject+MappingTests.h"


@implementation TestObject
@synthesize string, unaffected, number, mapped;
- (NSDictionary*)mappingForContext:(NSDictionary*)context {
	return [NSDictionary dictionaryWithObjectsAndKeys:@"mapped", @"toBeMapped", nil];
}
@end


@implementation NSObject_MappingTests
@synthesize testObject, dict;

- (void)setUp {
    [super setUp];
	
	self.testObject = [[TestObject alloc] init];
	STAssertTrue(testObject.string == nil, @"string is not null");
	STAssertTrue(testObject.number == nil, @"number is not null");
	
	self.dict = [NSDictionary dictionaryWithObjectsAndKeys:
				 @"hello", @"string",
				 [NSNumber numberWithInt:3], @"number",
				 [NSNumber numberWithInt:999], @"toBeMapped",
				 @"bad", @"notToBeMapped",
				 nil];
}

- (void)tearDown {
	self.dict = nil;
	self.testObject = nil;
    [super tearDown];
}


- (void)testMapDictionary {
	[testObject mapDictionary:dict];
	
	STAssertTrue(testObject.string == [dict objectForKey:@"string"], @"object string is not equal to dict string");
	STAssertTrue(testObject.number == [dict objectForKey:@"number"], @"object number is not equal to dict number");
	STAssertTrue(testObject.mapped == [dict objectForKey:@"toBeMapped"], @"object mapped is not equal to dict toBeMapped");
	STAssertTrue(testObject.unaffected == nil, @"object unaffected is not nil");
}

- (void)testMapDictionaryToObject {
	[testObject mapDictionary:dict toObject:testObject];
	
	STAssertTrue(testObject.string == [dict objectForKey:@"string"], @"object string is not equal to dict string");
	STAssertTrue(testObject.number == [dict objectForKey:@"number"], @"object number is not equal to dict number");
	STAssertTrue(testObject.mapped == [dict objectForKey:@"toBeMapped"], @"object mapped is not equal to dict toBeMapped");
	STAssertTrue(testObject.unaffected == nil, @"object unaffected is not nil");
}

@end

