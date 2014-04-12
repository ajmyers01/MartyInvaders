//
//  Space_invadersViewController.m
//  Marty_Invaders
//
//  Created by Alex Myers on 11/4/13.
//  Copyright (c) 2013 Alex Myers. All rights reserved.
//

#import "Space_invadersViewController.h"
#import "Space_invadersMyScene.h"
@import AVFoundation;

@interface Space_invadersViewController ()
@property (nonatomic) AVAudioPlayer * backgroundMusicPlayer;
@end

@implementation Space_invadersViewController

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
  NSError *error;
  NSURL * backgroundMusicURL = [[NSBundle mainBundle] URLForResource:@"background-music-aac" withExtension:@"caf"];
  self.backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
  self.backgroundMusicPlayer.numberOfLoops = -1;
  [self.backgroundMusicPlayer prepareToPlay];
  [self.backgroundMusicPlayer play];
  
  // Configure the view.
  SKView * skView = (SKView *)self.view;
  if (!skView.scene) {
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [Space_invadersMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
  }
}


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Configure the view.
  SKView * skView = (SKView *)self.view;
  skView.showsFPS = YES;
  skView.showsNodeCount = YES;
  
  // Create and configure the scene.
  SKScene * scene = [Space_invadersMyScene  sceneWithSize:skView.bounds.size];
  scene.scaleMode = SKSceneScaleModeAspectFill;
  
  // Present the scene.
  [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
