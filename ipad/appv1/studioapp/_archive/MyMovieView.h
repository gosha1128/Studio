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
//#import "ZoomPicViewDelegate.h"
#import "MyMoviePlayer.h"

enum Section
{
    Section_AboutUs = 0,
    Section_Illustration,
    Section_Film,
    Section_Design,
    Section_Home,
    Section_Preproduction,
    Section_CharacterDevelopment,
    Section_Animation,
    Section_Storyboarding
};


@protocol MyMovieViewDelegate <NSObject>
-(BOOL) movieHandleBleed:(enum Section)sct;
@end


@interface MyMovieView : UIView

@property (strong,nonatomic) AVPlayerDemoPlaybackView *player;
@property (strong,nonatomic) AVPlayer *av;
@property (strong,nonatomic) UITapGestureRecognizer *tap;
@property (nonatomic) BOOL playing;
@property (strong,nonatomic) NSString *movie;
//@property (assign) enum Section section;
//@property (assign) id *vparent;
//@property (assign) id<ZoomPicViewDelegate> delegate;
@property (assign) id<MyMovieViewDelegate> del;
@property (assign) int offset;
@property (strong,nonatomic) UIImageView *playv;
@property (strong,nonatomic) MyMoviePlayer *moviePlayer;
@property (assign) enum Section section;

- (id)initWithFrame:(CGRect)frame:(NSString *)mv:(int)offset;
- (void) stop;
//- (void) pause;
//- (void)loadMoviePlayer;


@end
