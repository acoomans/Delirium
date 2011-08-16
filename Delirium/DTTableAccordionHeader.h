//
//  DTAccordionHeader.h
//  Delirium
//
//  Created by Arnaud Coomans on 10/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTTableAccordionHeader : UIView

@property (nonatomic, retain, readonly) UILabel *title;
@property (nonatomic, assign, readonly) NSUInteger section;
@property (nonatomic, retain, readonly) UIImageView *indicator;
@property (nonatomic, retain, readonly) UIImageView *indicatorShadow;

- (id)initWithFrame:(CGRect)frame forSection:(NSUInteger)s;

@end
