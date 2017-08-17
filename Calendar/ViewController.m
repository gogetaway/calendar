//
//  ViewController.m
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import "ViewController.h"
#import "KLCalendarView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KLCalendarView *view = [[KLCalendarView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, self.view.bounds.size.height - 30)];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
