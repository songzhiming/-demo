//
//  HomeViewController.m
//  MaimaiDemo
//
//  Created by 宋志明 on 15-4-13.
//  Copyright (c) 2015年 songzm. All rights reserved.
//

#import "HomeViewController.h"
#import "STTweetLabel.h"

@interface HomeViewController ()
@property (strong) IBOutlet UILabel *displayLabel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    STTweetLabel *tweetLabel = [[STTweetLabel alloc] initWithFrame:CGRectMake(10.0, 60.0, 300.0, 160.0)];
    [tweetLabel setText:@"Hi. This is a new tool for @you! Developed by @SebThiebaud for #iPhone #ObjC... and #iOS7 ;-) My GitHub page: https://t.co/pQXDoiYA"];
    tweetLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:tweetLabel];
    
    CGSize size = [tweetLabel suggestedFrameSizeToFitEntireStringConstraintedToWidth:tweetLabel.frame.size.width];
    CGRect frame = tweetLabel.frame;
    frame.size.height = size.height;
    tweetLabel.frame = frame;
    
    [tweetLabel setDetectionBlock:^(STTweetHotWord hotWord, NSString *string, NSString *protocol, NSRange range) {
        NSArray *hotWords = @[@"Handle", @"Hashtag", @"Link"];
        
        
        NSLog(@"hotWord===%ld",hotWord);
        NSLog(@"hotWord===%@",string);
        NSLog(@"hotWord===%@",protocol);
        
        
        _displayLabel.text = [NSString stringWithFormat:@"%@ [%d,%d]: %@%@", hotWords[hotWord], (int)range.location, (int)range.length, string, (protocol != nil) ? [NSString stringWithFormat:@" *%@*", protocol] : @""];
    }];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
