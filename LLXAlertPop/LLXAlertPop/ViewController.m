//
//  ViewController.m
//  LLXAlertPop
//
//  Created by 李林轩 on 2018/3/5.
//  Copyright © 2018年 李林轩. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LLXAlertPop.h"
#define APPSIZE [[UIScreen mainScreen] bounds].size

@interface ViewController ()
{
    UILabel *lab;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"弹弹弹，弹出鱼尾纹";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(137, 100, 100, 60);
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(did) forControlEvents:UIControlEventTouchUpInside];

    lab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame)+40, APPSIZE.width, 20)];
    lab.textColor = [UIColor redColor];
    lab.textAlignment = 1;
    [self.view addSubview:lab];
    
}
-(void)did{
    
    NSArray *arrayTitle = @[@"我是第一个",@"我是第二个",@"我是第三个",@"我是第四个",@"我是第五个",@"我是第N..."];
    
    NSArray *arrayImage = @[@"zhifubao",@"weixin",@"zhifubao",@"weixin",@"zhifubao",@"weixin"];
    
    /**
     *  注意事项：文件中引用了pop动画库，如果您项目中没有或者不想添加，请到 UIView+LLXAlertPop.m中注释掉动画代码
     *  array ：弹出的选项标题
     *  arrayImage ：数组图标，没有写nil
     *  textColor ：选项标题的字体颜色 设置和标题对应的数组颜色或者单个颜色（NSArray/UIColor）
     *  font ：选项标题的字体
     *  spacing ：文字与图片间距自行调试（无图片可填0）
     *  取消 按钮字体请到.m文件自行设置。默认黑色-16号
     **/
    
    
    //字体颜色  二选一 数组颜色/单个颜色
    NSArray *arrayColor = @[[UIColor redColor],[UIColor blueColor],[UIColor orangeColor],[UIColor blackColor],[UIColor grayColor],[UIColor greenColor]];
    UIColor *color = [UIColor orangeColor];
    
    [self.view createAlertViewTitleArray:arrayTitle arrayImage:arrayImage textColor:arrayColor font:[UIFont systemFontOfSize:16] spacing:-15 actionBlock:^(UIButton * _Nullable button, NSInteger didRow) {
        //获取点击事件
        NSLog(@"%@,%ld",button.currentTitle,(long)didRow);
        lab.text = [NSString stringWithFormat:@"%@,下标%ld",button.currentTitle,(long)didRow];
    }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
