//
//  MyMovieView.h
//  studioapp
//
//  Created by George Williams on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "AVPlayerDemoPlaybackView.h"
#import "ZoomPicViewDelegate.h"
#import "MyMoviePlayer.h"

@interface MyMovieView : UIView

@property (strong,nonatomic) AVPlayerDemoPlaybackView *player;
@property (strong,nonatomic) AVPlayer *av;
@property (strong,nonatomic) UITapGestureRecognizer *tap;
@property (nonatomic) BOOL playing;
@property (strong,nonatomic) NSString *movie;
@property (assign) enum Section section;
@property (assign) id *vparent;
@property (assign) id<ZoomPicViewDelegate> delegate;
@property (assign) int offset;
@property (strong,nonatomic) UIImageView *playv;
@property (strong,nonatomic) MyMoviePlayer *moviePlayer;

- (id)initWithFrame:(CGRect)frame:(NSString *)mv:(int)offset;
- (void) stop;
- (void) pause;
- (void)loadMoviePlayer;

@end
