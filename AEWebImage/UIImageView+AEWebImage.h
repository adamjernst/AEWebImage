//
//  UIImageView+AEWebImage.h
//  AEWebImageExample
//
//  Created by Adam Ernst on 1/26/12.
//  Copyright (c) 2012 cosmicsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AEWebImage)

- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url scale:(CGFloat)scale;

@end
