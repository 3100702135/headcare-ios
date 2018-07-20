#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong,nonatomic) NSArray *array;

@end

@implementation ViewController
@synthesize imageView=_imageView;
@synthesize imgArray=_imgArray;
@synthesize Page=_Page;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    _imgArray = [[NSMutableArray alloc] initWithObjects:
                [UIImage imageNamed:@"headcare01.jpg"],
                [UIImage imageNamed:@"headcare02.jpg"],
                [UIImage imageNamed:@"headcare03.jpg"],
                [UIImage imageNamed:@"headcare04.jpg"],nil];
    self.navigationItem.title = @"测试";
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44,768, 1004)];
    [self.imageView setImage:[imgArray objectAtIndex:Page]];
    [self.view addSubview:imageView];
    
}


/*=======================================================
 //触摸事件：点击弹出导航条，左右划动切换经文
 ========================================================*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self.view];
    FirstPoint = point;
    touchMove = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    SecondPoint = point;
    touchMove = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(touchMove == NO)
    {
    }else
    {
        if (FirstPoint.x > SecondPoint.x)
        {
            if(Page < [imgArray count] - 1)
            {
                Page++;
                CGContextRef context = UIGraphicsGetCurrentContext();
                [UIView beginAnimations:nil context:context];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [imageView setAlpha:0.0];
                [UIView setAnimationDuration:0.05];
                [UIView commitAnimations];
                [self performSelector:@selector(ChangeImage) withObject:nil afterDelay:0.1];
            }else if (Page == [imgArray count] -1) {
                CGContextRef context = UIGraphicsGetCurrentContext();
                [UIView beginAnimations:nil context:context];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [imageView setAlpha:0.0];
                [UIView setAnimationDuration:0.05];
                [UIView commitAnimations];
                Page = 0;
                [self performSelector:@selector(ChangeImage) withObject:nil afterDelay:0.1];
            }
        }else {
            if(Page >= 1)
            {
                Page--;
                CGContextRef context = UIGraphicsGetCurrentContext();
                [UIView beginAnimations:nil context:context];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [imageView setAlpha:0.0];
                [UIView setAnimationDuration:0.05];
                [UIView commitAnimations];
                [self performSelector:@selector(ChangeImage) withObject:nil afterDelay:0.1];
            }
        }
    }
}


/*=======================================================
 更新图片显示
 ========================================================*/
-(void)ChangeImage{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5]; //动画长度，单位为秒
    [self.view setAlpha:1];
    [imageView setAlpha:1];
    [imageView setImage:[imgArray objectAtIndex:Page]];
    //[myimageview setAnimationRepeatCount:4]; //设置重复次数
    [UIView commitAnimations];
    self.navigationItem.title = @"测试";
}

@end

