//
//  YLWKWebViewController.m
//  YLPYQ
//
//  Created by 谭林杰 on 2019/6/25.
//  Copyright © 2019 Bksx-cp. All rights reserved.
//

#import "YLWKWebViewController.h"

@interface YLWKWebViewController ()<MMWebViewDelegate>

@end

@implementation YLWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MMWebView *webView = [[MMWebView alloc]initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height)];
    webView.backgroundColor = [UIColor whiteColor];
    webView.opaque = NO;
    webView.delegate = self;
    webView.displayProgressBar = YES;
    webView.allowsBackForwardNavigationGestures = YES;
    webView.progressTintColor = [UIColor redColor];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:webView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)webView:(MMWebView *)webView didUpdateTitle:(NSString *)title{
 
    self.title = title;
}

@end
