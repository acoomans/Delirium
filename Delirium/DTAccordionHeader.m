//
//  DTAccordionHeader.m
//  Delirium
//
//  Created by Arnaud Coomans on 10/08/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "DTAccordionHeader.h"

@implementation DTAccordionHeader

@synthesize title, section, indicator, indicatorShadow;

- (id)initWithFrame:(CGRect)frame forSection:(NSUInteger)s {
    self = [super initWithFrame:frame];
    if (self) {
        title = [[UILabel alloc] initWithFrame:CGRectMake(5, 
														  5,
														  frame.size.width-10,
														  frame.size.height-10)];
		title.backgroundColor = [UIColor clearColor];
		title.shadowColor = [UIColor blackColor];
		title.shadowOffset = CGSizeMake(0, 2);
		[self addSubview:title];
		
		indicatorShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator-shadow"]];		
		indicatorShadow.frame = CGRectMake(frame.size.width-26, (frame.size.height-12)/2+3, 12, 12);
		[self addSubview:indicatorShadow];
		
		indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator"]];
		indicator.frame = CGRectMake(frame.size.width-26, (frame.size.height-12)/2, 12, 12);
		[self addSubview:indicator];
		
		section = s;
    }
    return self;
}


- (void)dealloc {
	[title release];
	[indicator release];
	[indicatorShadow release];
	[super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
