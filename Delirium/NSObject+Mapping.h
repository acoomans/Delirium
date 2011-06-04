//
//  NSObject+Mapping.h
//  Delirium
//
//  Created by Arnaud Coomans on 02/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol NSObjectMapperProtocol <NSObject>
@optional
- (NSDictionary*)mappingForContext:(NSDictionary*)context;

@end


@interface NSObject (Mapping)

- (id)mapDictionary:(NSDictionary *)dict;
- (id)mapDictionary:(NSDictionary *)dict toObject:(id)object;
- (BOOL)hasSetterForKey:(NSString*)key;

@end


