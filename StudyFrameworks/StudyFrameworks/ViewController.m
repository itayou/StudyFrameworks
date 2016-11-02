//
//  ViewController.m
//  StudyFrameworks
//
//  Created by lizq on 16/11/2.
//  Copyright © 2016年 lizq. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *objStr = [NSString stringWithFormat:@"I am s %@",@"string"];
    Class class1 = object_getClass(objStr);
    NSLog(@"class1 is %@",class1);
    NSObject *obj = [NSObject new];
    Class class2 = object_setClass(obj, [NSString class]);
    NSLog(@"class2 is %@",class2);
    NSLog(@"obj is kind of %@",object_getClass(obj));
    NSLog(@"obj %@ class object",object_isClass(obj)?@"is a ":@"is not a");
    NSLog(@"class1 %@ class object",object_isClass(class1)?@"is a ":@"is not a");
   // objc_lookUp
    NSLog(@"NSABC %@ registered",objc_lookUpClass([@"NSABC" cStringUsingEncoding:NSASCIIStringEncoding])?@"had":@"had not");
    NSLog(@"ViewController %@ registered",objc_lookUpClass([@"ViewController" cStringUsingEncoding:NSASCIIStringEncoding])?@"had":@"had not");
    @try {
       Class class3 = objc_getRequiredClass([@"NSArray" cStringUsingEncoding:NSASCIIStringEncoding]);
        NSLog(@"class3 is %@",class3);
    } @catch (NSException *exception) {
        NSLog(@"NSASD had not register");
    } @finally {

    }
    Class *classList;
    NSLog(@"The project has %@ classes",@(objc_getClassList(classList, 10000)));
    unsigned int classCount = 0;
    classList = objc_copyClassList(&classCount);
    NSLog(@"The project has %@ classes",@(classCount));
//    for(unsigned int i = 0 ;i < classCount;i++) {
//        NSLog(@"the %@ class is  %s",@(i),class_getName(*classList));
//        classList++;
//    }
    NSLog(@"process go on ");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
