//
//  MoreViewController.m
//  WXMovie85
//
//  Created by HJH on 4/9/16.
//  Copyright © 2016 . All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImageView *_iconView;
    UILabel *nickNameLabel;
    NSString *iconName;
    UIImage *iconImage;
}

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getImageFromSandBox];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _createHeaderView];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self readCacheSize];
}

- (void)clearCache
{
    NSString *cache = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    [[NSFileManager defaultManager] removeItemAtPath:cache error:NULL];
    
}

- (void)readCacheSize
{
    NSUInteger size = [self getCacheData];
    
    double mbSize = size / 1024.0 / 1024.0;
    _sizeLabel.text = [NSString stringWithFormat:@"%.2fMB", mbSize];
}

- (NSUInteger )getCacheData
{
    
    NSUInteger size = 0;
    NSString *cache = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];

    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:cache];

    for (NSString *fileName in fileEnumerator) {

        NSString *filePath = [cache stringByAppendingPathComponent:fileName];
        NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:NULL];
      size += [dic fileSize];
    }

    return size;
}

- (void)_createHeaderView
{
    _iconView = [[UIImageView alloc] initWithImage:iconImage];
    _iconView.frame = CGRectMake(10, 10, 100, 100);
    
    _iconView.layer.cornerRadius = _iconView.width / 2;
    _iconView.layer.masksToBounds = YES;
    
    _iconView.userInteractionEnabled = YES;
    [_iconView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickPhoto)]];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    headerView.backgroundColor = [UIColor clearColor];
    [headerView addSubview:_iconView];
    
    nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 150, 50)];
    nickNameLabel.text = iconName;
    nickNameLabel.textColor = [UIColor magentaColor];
    [headerView addSubview:nickNameLabel];
    
    self.tableView.tableHeaderView = headerView;
}

- (void)pickPhoto
{

        UIImagePickerControllerSourceType sourceType  = UIImagePickerControllerSourceTypePhotoLibrary;

        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = sourceType;
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    iconImage = image;
    _iconView.image = iconImage;
    iconName = @"还是那么的帅";
    nickNameLabel.text = iconName;
    
    [self saveImageInSandBox];
}

- (void)saveImageInSandBox
{
    if (iconImage != nil) {
        [[NSUserDefaults standardUserDefaults] setObject:iconName forKey:@"iconName"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSData *data = UIImageJPEGRepresentation(iconImage, 0.8);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"iconImage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)getImageFromSandBox
{
    iconName = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconName"];
    iconImage = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"iconImage"]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"清除缓存" message:[NSString stringWithFormat:@"确定清除缓存%@", self.sizeLabel.text] preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self clearCache];
            [self readCacheSize];
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
        
        [self presentViewController:alert animated:YES completion:NULL];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
