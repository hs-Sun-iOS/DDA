//
//  ViewController.m
//  DrawLineByDDADemo
//
//  Created by sunhaosheng on 2017/10/18.
//  Copyright © 2017年 hs sun. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@property (weak, nonatomic) IBOutlet UITextField *point1XText;
@property (weak, nonatomic) IBOutlet UITextField *point1YText;
@property (weak, nonatomic) IBOutlet UITextField *point2XText;
@property (weak, nonatomic) IBOutlet UITextField *point2YText;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.point1XText resignFirstResponder];
    [self.point1YText resignFirstResponder];
    [self.point2XText resignFirstResponder];
    [self.point2YText resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)drawBtnClick:(id)sender {
    [self.drawView beginDrawWithPoint1:CGPointMake([self.point1XText.text floatValue], [self.point1YText.text floatValue]) andPoint2:CGPointMake([self.point2XText.text floatValue], [self.point2YText.text floatValue])];
    
}


@end
