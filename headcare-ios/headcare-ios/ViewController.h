//
//  ViewController.h
//  headcare-ios
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    __weak IBOutlet UIImageView *imageView;
    NSMutableArray *imgArray;
    CGPoint FirstPoint;
    CGPoint SecondPoint;
    NSInteger Page;
    BOOL touchMove;
}
@property (retain, nonatomic)  UIImageView* imageView;
@property (retain, nonatomic)  NSMutableArray *imgArray;
@property NSInteger Page;

@end
