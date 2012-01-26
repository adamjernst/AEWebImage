//
//  AEViewController.m
//  AEWebImageExample
//
//  Created by Adam Ernst on 1/26/12.
//  Copyright (c) 2012 cosmicsoft. All rights reserved.
//

#import "AEViewController.h"
#import "UIImageView+AEWebImage.h"

@implementation AEViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _imageURLs = [[[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AESampleImages" ofType:@"plist"]] objectForKey:@"images"] retain];
    }
    return self;
}

- (void)dealloc {
    [_imageURLs release];
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_imageURLs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kReuseIdentifier = @"kReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseIdentifier] autorelease];
    }
    [[cell textLabel] setText:[NSString stringWithFormat:@"Video %d", [indexPath row]]];
    [[cell imageView] setImage:[UIImage imageNamed:@"placeholder.png"]];
    [[cell imageView] setImageWithURL:[NSURL URLWithString:[_imageURLs objectAtIndex:[indexPath row]]]];
    return cell;
}

@end
