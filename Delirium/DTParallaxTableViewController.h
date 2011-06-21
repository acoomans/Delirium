//
//  DTParallaxTableViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 20/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTParallaxTableViewController : UITableViewController {
	UIView *mWrapperView;
	UIImageView *mBackgroundView;
	UIScrollView *mScrollView;
}

@property (nonatomic, retain) UIView *wrapperView;
@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, retain) UIScrollView *scrollView;

- (void)setBackgroundImage:(UIImage*)image;
- (UIImage*)backgroundImage;

@end
