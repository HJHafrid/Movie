//
//  main.m
//  WXMovie85
//
//  Created by wenyuan on 4/9/16.
//  Copyright © 2016 wenyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// main函数的作用 程序进入的入口 开启主线程
// 创建一个全局的自动释放池
// 调用UIApplicationMain
// UIApplicationMain
// 创建 UIApplication 对象 app
// 开启runloop
// 第三个参数 一般为nil 是 UIApplication 类或其子类
// 设置app的代理

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
