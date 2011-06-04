//
//  NSObject+MappingTests.h
//  Delirium
//
//  Created by Arnaud Coomans on 03/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//


#import <SenTestingKit/SenTestingKit.h>
#import "NSObject+Mapping.h"

@interface TestObject : NSObject <NSObjectMapperProtocol> {
	NSString *string;
	NSString *unaffected;
	NSNumber *number;
	NSNumber *mapped;
}
@property (nonatomic, retain) NSString *string;
@property (nonatomic, retain) NSString *unaffected;
@property (nonatomic, retain) NSNumber *number;
@property (nonatomic, retain) NSNumber *mapped;
@end


@interface NSObject_MappingTests : SenTestCase {
    TestObject *testObject;
	NSDictionary *dict;
}
@property (nonatomic, retain) TestObject *testObject;
@property (nonatomic, retain) NSDictionary *dict;
@end
