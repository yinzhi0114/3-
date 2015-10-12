//
//  ZYViewController.m
//  断点下载文件
//
//  Created by z y on 15-9-19.
//  Copyright (c) 2015年 zhiyou3g. All rights reserved.
//

#import "ZYViewController.h"

@interface ZYViewController ()<NSURLConnectionDelegate>
{
    NSFileHandle * _handle;
    UIProgressView * pro;
    UIActivityIndicatorView * view;
}

@end

@implementation ZYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSString * filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Xcode51.dmg"];
//    NSLog(@"=======%@",filePath);
//    NSFileManager * fileManager = [NSFileManager defaultManager];
//    if (![fileManager fileExistsAtPath:filePath] ) {
//        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
//    }
//    
//    _handle = [NSFileHandle fileHandleForWritingAtPath:filePath];
//    
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(100, 50, 100, 40);
//    [button setTitle:@"下载文件" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor cyanColor];
//    [button addTarget:self action:@selector(downLoad) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    self.view.backgroundColor = [UIColor lightGrayColor];;
    pro = [[UIProgressView alloc] initWithFrame:CGRectMake(60, 60, 200, 40)];
    pro.progressTintColor = [UIColor redColor];
    pro.trackTintColor = [UIColor greenColor];
    pro.progress = 0.5;
    [self.view addSubview:pro];
    view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    view.frame = CGRectMake(60, 150, 200, 50);
    view.hidesWhenStopped = YES;
    view.color = [UIColor yellowColor];
    [self.view addSubview:view];
    [view startAnimating];
    UISwitch * sw = [[UISwitch alloc] initWithFrame:CGRectMake(60, 250, 100, 40)];
    [sw addTarget:self action:@selector(swAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sw];
    UISegmentedControl * sc = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"1",@"2",@"3", nil]];
    sc.frame = CGRectMake(0, 350, 100, 40);
    [sc addTarget:self action:@selector(scAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sc];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}
- (void)scAction:(UISegmentedControl *)sc{

    NSLog(@"+=====%d",sc.selectedSegmentIndex);
}
- (void)swAction:(UISwitch *)sw{
    BOOL a = sw.isOn;
    NSLog(@"+++++%d",a);
}
- (void)timer{
    static float m = 0;
    m += 0.01;
    if (m >= 1) {
        m = 0;
    }
    pro.progress = m;
}
- (void)downLoad{
    
    NSURL * url = [NSURL URLWithString:@"http://localhost:8080/us/Xcode51.dmg"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSURLConnection * con = [NSURLConnection connectionWithRequest:request delegate:self];
    [con start];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"请求成功!");
    
}
//数据开始返回
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"数据开始返回!");
    
//    [_handle seekToEndOfFile];
//    [_handle writeData:data];
    
    
    
}
//数据请求完毕
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"数据请求完毕!");
    
    
    
    
}
#pragma mark NSURLConnectionDelegate
//请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"请求失败!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
