//
//  UIImage+Rotate.m
//  Delirium
//
//  Created by arnaud on 11/02/11.
//  Copyright 2011 Arnaud Coomans. All rights reserved.
//

#import "UIImage+Rotate.h"


@implementation UIImage (Rotate)


- (UIImage*)rotate:(UIImageOrientation) orientation {
	
	UIImage *image = self;
    CGImageRef imgRef = image.CGImage;
	
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
	
    CGAffineTransform transform = CGAffineTransformIdentity;  
    CGRect bounds = CGRectMake(0, 0, width, height);  
	CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));  
    CGFloat boundHeight;  
	
    switch(orientation) {  
			
        case UIImageOrientationUp: //EXIF = 1  
            transform = CGAffineTransformIdentity;  
            break;  
			
        case UIImageOrientationUpMirrored: //EXIF = 2  
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);  
            transform = CGAffineTransformScale(transform, -1.0, 1.0);  
            break;  
			
        case UIImageOrientationDown: //EXIF = 3  
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);  
            transform = CGAffineTransformRotate(transform, M_PI);  
            break;  
			
        case UIImageOrientationDownMirrored: //EXIF = 4  
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);  
            transform = CGAffineTransformScale(transform, 1.0, -1.0);  
            break;  
			
        case UIImageOrientationLeftMirrored: //EXIF = 5  
            boundHeight = bounds.size.height;  
            bounds.size.height = bounds.size.width;  
            bounds.size.width = boundHeight;  
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);  
            transform = CGAffineTransformScale(transform, -1.0, 1.0);  
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);  
            break;  
			
        case UIImageOrientationLeft: //EXIF = 6  
            boundHeight = bounds.size.height;  
            bounds.size.height = bounds.size.width;  
            bounds.size.width = boundHeight;  
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);  
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);  
            break;  
			
        case UIImageOrientationRightMirrored: //EXIF = 7  
            boundHeight = bounds.size.height;  
            bounds.size.height = bounds.size.width;  
            bounds.size.width = boundHeight;  
            transform = CGAffineTransformMakeScale(-1.0, 1.0);  
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);  
            break;  
			
        case UIImageOrientationRight: //EXIF = 8  
            boundHeight = bounds.size.height;  
            bounds.size.height = bounds.size.width;  
            bounds.size.width = boundHeight;  
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);  
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);  
            break;
    }
	
	
    UIGraphicsBeginImageContext(bounds.size);
	
    CGContextRef context = UIGraphicsGetCurrentContext();
	
    CGContextConcatCTM(context, transform);
	CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);  
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();  
    UIGraphicsEndImageContext();  
	
    return imageCopy; 
	
}


@end
