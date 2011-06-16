//
//  DTParallaxViewController.h
//  Delirium
//
//  Created by Arnaud Coomans on 16/06/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTParallaxViewController : UIViewController <UIScrollViewDelegate> {
	UIView *mWrapperView;
	UIImageView *mBackgroundView;
	UIScrollView *mScrollView;
	UIView *mContentView;
}

@property (nonatomic, retain) UIView *wrapperView;
@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIView *contentView;

- (void)setBackgroundImage:(UIImage*)image;
- (UIImage*)backgroundImage;

- (void)scrollToZeroAnimated:(BOOL)animated;
- (void)scrollToTopAnimated:(BOOL)animated;
- (void)scrollToLeftAnimated:(BOOL)animated;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)scrollToRightAnimated:(BOOL)animated;
- (void)scrollToCenterAnimated:(BOOL)animated;
- (void)scrollToPoint:(CGPoint)point animated:(BOOL)animated;

@end
