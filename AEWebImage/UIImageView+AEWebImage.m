//
//  UIImageView+AEWebImage.m
//  AEWebImageExample
//
//  Created by Adam Ernst on 1/26/12.
//  Copyright (c) 2012 cosmicsoft. All rights reserved.
//

#import "UIImageView+AEWebImage.h"
#import "AEURLConnection.h"
#import <objc/runtime.h>

static char kAEWebImageURLKey;

@implementation UIImageView (AEWebImage)

- (void)setImageWithURL:(NSURL *)url {
    [self setImageWithURL:url scale:1.0f];
}

- (void)setImageWithURL:(NSURL *)url scale:(CGFloat)scale {
    objc_setAssociatedObject(self, &kAEWebImageURLKey, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [AEURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                                   processor:[AEURLResponseProcessors chainedResponseProcessor:
                                              [AEURLResponseProcessors imageResponseProcessor],
                                              ^(NSURLResponse *urlResponse, UIImage *image, NSError **error) {
                                                  if (fabsf(scale - 1.0f) > 0.01) {
                                                      return [UIImage imageWithCGImage:[image CGImage] scale:scale orientation:[image imageOrientation]];
                                                  } else {
                                                      return image;
                                                  }
                                              }, nil]
                           completionHandler:^(NSURLResponse *urlResponse, UIImage *image, NSError *error) {
                               NSURL *currentURL = (NSURL *) objc_getAssociatedObject(self, &kAEWebImageURLKey);
                               if ([currentURL isEqual:url]) {
                                   [self setImage:image];
                               }
                           }];
}

@end
