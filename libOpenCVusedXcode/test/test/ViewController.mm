//
//  ViewController.m
//  test
//
//  Created by DLGames on 13/08/05.
//  Copyright (c) 2013年 DLGames. All rights reserved.
//

#import "ViewController.h"
//#import <opencv2/opencv.hpp>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ///*1
    // cv::Matを生成

    //cvNamedWindow("Sample", 1);
    //CvCapture *capture = cvCaptureFromCAM(-1);
    
    //IplImage* image;
    
    //テキストの表示
    //cvPutText(image, "test", cvPoint(50, 50), &dfont, CV_RGB(255, 255, 255));
    
    //画像の表示
    //cvShowImage("Sample", image);
    //int a = 0;
    //a = cvGetThreadNum();
    
    //int b = cvGetNumThreads();
    
    cv::Mat srcImg(cv::Size(480,640), CV_8UC3);

    // グラデーションで塗りつぶす
    for( int y = 0; y < srcImg.rows; y++ ) {
        cv::Vec3b* ptr = srcImg.ptr<cv::Vec3b>( y );
        for( int x = 0; x < srcImg.cols; x++ ) {
            cv::Vec3b bgr = ptr[x];
            ptr[x] = cv::Vec3b(1.0 * x / srcImg.cols * 255, 0, 0);
        }
    }

    // UIImageViewに表示する
    UIImage *image = [self UIImageFromMat:srcImg];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imgView];
    // 1*/
}

///*1
- (UIImage *)UIImageFromMat:(cv::Mat)image {

    NSData *data = [NSData dataWithBytes:image.data length:image.elemSize()*image.total()];

    CGColorSpaceRef colorSpace;

    if (image.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }

    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);

    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(image.cols, image.rows,
                                        8, 8 * image.elemSize(),
                                        image.step.p[0], colorSpace,
                                        kCGImageAlphaNone|kCGBitmapByteOrderDefault,
                                        provider, NULL, false,
                                        kCGRenderingIntentDefault);
    
    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);

    return finalImage;
}
//1*/


/*
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    //picture.image = [self greyMatFromUIImage:picture.image];
    NSLog(@"pushButton");
}

/*2
- (cv::Mat)cvMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,// Pointer to  data
                                                        cols, // Width of bitmap
                                                        rows, // Height of bitmap
                                                        8,// Bits per component
                                                        cvMat.step[0], // Bytes per row
                                                        colorSpace, // Colorspace
                                                        kCGImageAlphaNoneSkipLast |
                                                        kCGBitmapByteOrderDefault); // Bitmap info flags

    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpace);
    
    return cvMat;
}



- (UIImage *)greyMatFromUIImage:(UIImage *)srcImage
{
    cv::Mat srcMat = [self cvMatFromUIImage:srcImage];
    cv::Mat greyMat;
    cv::cvtColor(srcMat, greyMat, CV_BGR2GRAY);
    
    return [self UIImageFromCVMat:greyMat];
}
*/
@end
