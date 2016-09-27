//
//  PhotoCell.m
//  WXMovie85
//
//  Created by HJH on 4/17/16.
//  Copyright © 2016  . All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell
{
    UIImageView *imageView;
    UIAlertController *alert;

}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

- (void)_createSubViews
{
    imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;

    imageView.userInteractionEnabled = YES;
    
    [imageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(savePhoto:)]];
    
    [self.contentView addSubview:imageView];
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    [imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl]];
}

- (void)savePhoto:(UIGestureRecognizer *)ge
{
    alert = [UIAlertController alertControllerWithTitle:@"亲，要不要存图片" message:@"存啊" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的！" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImage *image = imageView.image;
        
        if (image) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            hud.labelText = @"Saving";
            hud.dimBackground = YES;
            
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo: ), (__bridge void * _Nullable)(hud));
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"就不存" style:UIAlertActionStyleCancel handler:NULL]];
    
    [self.viewController presentViewController:alert animated:YES completion:NULL];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    MBProgressHUD *hud = (__bridge MBProgressHUD *)(contextInfo);
    
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"Sucuess!";
    [hud hide:YES afterDelay:1.5];
    
    [alert dismissViewControllerAnimated:YES completion:NULL];
}

@end
