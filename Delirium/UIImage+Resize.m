//
//  UIImage+Resize.m
//  Delirium
//
//  Created by arnaud on 30/11/10.
//  Copyright 2010 Arnaud Coomans. All rights reserved.
//

#import "UIImage+Resize.h"
#import <MobileCoreServices/UTCoreTypes.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}


@implementation UIImage (Resize)


-(UIImage *)resizeImagetoWidth:(NSInteger)width toHeight:(NSInteger)height {
	
	UIImage *image = self;
	
	if (height == 0 && width == 0) return image;
	
	if (image.imageOrientation == UIImageOrientationUp || image.imageOrientation == UIImageOrientationDown) {
		if (height == 0) {
			height = image.size.height * width / image.size.width;
		}
		
		if (width == 0) {
			width = image.size.width * height / image.size.height;
		}
	} else {
		if (height == 0) {
			height = image.size.width * width / image.size.height;
		}
		
		if (width == 0) {
			width = image.size.height * height / image.size.width;
		}
	}
	
	CGImageRef imageRef = [image CGImage];
	CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
	CGColorSpaceRef colorSpaceInfo = CGColorSpaceCreateDeviceRGB();
	
	if (alphaInfo == kCGImageAlphaNone)
		alphaInfo = kCGImageAlphaNoneSkipLast;
	
	CGContextRef bitmap;
	
	if (image.imageOrientation == UIImageOrientationUp || image.imageOrientation == UIImageOrientationDown) {
		bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, alphaInfo);
		
	} else {
		bitmap = CGBitmapContextCreate(NULL, height, width, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, alphaInfo);
		
	}
	
	if (image.imageOrientation == UIImageOrientationLeft) {
		CGContextRotateCTM (bitmap, radians(90));
		CGContextTranslateCTM (bitmap, 0, -height);
		
	} else if (image.imageOrientation == UIImageOrientationRight) {
		CGContextRotateCTM (bitmap, radians(-90));
		CGContextTranslateCTM (bitmap, -width, 0);
		
	} else if (image.imageOrientation == UIImageOrientationUp) {
		// nothing
		
	} else if (image.imageOrientation == UIImageOrientationDown) {
		CGContextTranslateCTM (bitmap, width,height);
		CGContextRotateCTM (bitmap, radians(-180.));
	}
	
	CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
	CGImageRef ref = CGBitmapContextCreateImage(bitmap);
	UIImage *result = [UIImage imageWithCGImage:ref];
	
	CGColorSpaceRelease(colorSpaceInfo);
	CGContextRelease(bitmap);
	CGImageRelease(ref);
	
	return result;	
}


@end
