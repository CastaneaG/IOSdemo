//
//  ViewController.m
//  加法计算器
//
//  Created by 王康力 on 2019/10/14.
//  Copyright © 2019 王康力. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//action方法
- (IBAction)compute;
- (IBAction)left:(id)sender;
- (IBAction)up:(id)sender;
- (IBAction)right:(id)sender;
- (IBAction)down:(id)sender;
- (IBAction)scale:(UIButton *)sender;


//outleth属性
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;

@property (weak, nonatomic) IBOutlet UITextField *txtNum1;
@property (weak, nonatomic) IBOutlet UITextField *txtNum2;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
     

- (IBAction)compute {
    NSLog(@"compute");
    //获取用户输入
    NSString *num1 =  self.txtNum1.text,*num2 = self.txtNum2.text;
    
    int n1 = [num1 intValue];
    int n2 = [num2 intValue];
    
    //计算和
    int result = n1+n2;
    
    //显示结果到label上
    self.lblResult.text = [NSString stringWithFormat:@"%d",result];
    
    //叫回键盘
    //谁叫出键盘，谁就是第一响应者，让第一响应者辞去，就可以将键盘叫回
    /*
    [self.txtNum2 resignFirstResponder];
    [self.txtNum1 resignFirstResponder];*/
    
    //叫回键盘方法2
    //self.view表示当前控制器管理的那个view（每个控制器都会管理一个view）
    //让控制器所管理的view停止编辑，凡是这个view中的子空间叫出的键盘就都回去了
    [self.view endEditing:YES];
    
}
- (IBAction)up:(id)sender {
    NSLog(@"up");
    
    //获取按钮的y坐标值，让y的值递减，然后再把新的值复制给按钮的y
    //获取头像按钮的坐标
    //获取按钮的原始frame值，其中包含了按钮大小和坐标
    CGRect originFrame =  self.btnIcon.frame;
    //设置y值-10
    originFrame.origin.y -=10;
    //把新的frame复制给btnIcon的frame
    self.btnIcon.frame = originFrame;
}

- (IBAction)left:(id)sender {
    NSLog(@"left");
    CGRect originFrame =  self.btnIcon.frame;
    //设置y值-10
    originFrame.origin.x -=10;
    //把新的frame复制给btnIcon的frame
    self.btnIcon.frame = originFrame;
}

- (IBAction)right:(id)sender {
    NSLog(@"right");
    CGRect originFrame =  self.btnIcon.frame;
    //设置y值-10
    originFrame.origin.x +=10;
    //把新的frame复制给btnIcon的frame
    [UIView animateWithDuration:0.5 animations:^{
        self.btnIcon.frame = originFrame;
    }];
    
}

- (IBAction)down:(id)sender {
    NSLog(@"down");
    CGRect originFrame =  self.btnIcon.frame;
    //设置y值-10
    originFrame.origin.y +=10;
    //把新的frame复制给btnIcon的frame
    //没有动画执行一句
    //self.btnIcon.frame = originFrame;
    //开启动画
    [UIView beginAnimations:nil context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:1];
    //
    self.btnIcon.frame = originFrame;
    //
    //提交动画
    [UIView commitAnimations];
    
   
}

- (IBAction)scale:(UIButton *)sender {
    CGRect originFrame =  self.btnIcon.frame;
    //设置y值-10
    //根据tag判断按钮
    if (sender.tag == 10) {
        originFrame.size.width +=5;
        originFrame.size.height +=5;
    }else if (sender.tag ==20){
        originFrame.size.width -=5;
        originFrame.size.height -=5;
    }


    
    //把新的frame复制给btnIcon的frame
    
    
    self.btnIcon.frame = originFrame;
}




@end
