//
//  ViewController.m
//  12-获取硬件信息
//
//  Created by Romeo on 15/12/19.
//  Copyright © 2015年 heima. All rights reserved.
//

#import "ViewController.h"
#import "SystemServices.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SystemServices * sys =[SystemServices sharedServices];
    
    self.textView.text = [sys.allSystemInformation description];
}



@end
