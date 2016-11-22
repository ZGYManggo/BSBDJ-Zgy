//
//  ClearCacheCell.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/17.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "ClearCacheCell.h"
#import <SVProgressHUD.h>
#import <SDImageCache.h>
@implementation ClearCacheCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.text = @"清除缓存(正在计算文件大小...)";
        self.userInteractionEnabled = NO;
        
        UIActivityIndicatorView *indicatorView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [indicatorView startAnimating];
        self.accessoryView = indicatorView;
        
        WEAKSELF(weakSelf);
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            unsigned long long size = [self fileSizeWith:NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject];
            if (weakSelf == nil) {
                return ;
            }
            NSString *sizeText = nil;
            
            if (size >= pow(10, 9)) {
                sizeText = [NSString stringWithFormat:@"%.1fGB",size / 1000.0 / 1000.0 / 1000.0];
            }else if (size >= pow(10, 6)){
                sizeText = [NSString stringWithFormat:@"%.1fMB",size / 1000.0 / 1000.0];
            }else if (size >= pow(10, 3)){
                sizeText = [NSString stringWithFormat:@"%.1fKB",size / 1000.0];
            }else{
                sizeText = [NSString stringWithFormat:@"%zdB",size];
            }
            
            NSString *text = [NSString stringWithFormat:@"清除缓存（%@）",sizeText];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                weakSelf.textLabel.text = text;
                weakSelf.accessoryView = nil;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                weakSelf.userInteractionEnabled = YES;
                
                [weakSelf addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:weakSelf action:@selector(celltap:)]];
                
            });
        });
    }
    return self;
}
-(void)celltap:(UITapGestureRecognizer *)tap
{
    [SVProgressHUD showWithStatus:@"正在清除缓存"];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager removeItemAtPath:NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject error:nil];
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            self.textLabel.text = @"清除缓存（0B）";
        });
    });
//    SDWebImage的clear方法，它清除后会再将文件夹创建出来.
//    - (void)clearDiskOnCompletion:(SDWebImageNoParamsBlock)completion
//    {
    //withIntermediateDirectories:YES ,表示中间文件       如果没有会自动创建，NO 也不会自动创建中间文件，如果发现没有文件则不会创建
//        dispatch_async(self.ioQueue, ^{
//            [_fileManager removeItemAtPath:self.diskCachePath error:nil];
//            [_fileManager createDirectoryAtPath:self.diskCachePath
//                    withIntermediateDirectories:YES
//                                     attributes:nil
//                                          error:NULL];
//            
//            if (completion) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    completion();
//                });
//            }
//        });
//    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(unsigned long long)fileSizeWith:(NSString *)mainPath
{
    unsigned long long size = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL directory = NO;
    BOOL exists = [manager fileExistsAtPath:mainPath isDirectory:&directory];
    // 如果地址为空
    if (!exists) return size;
    // 如果是文件夹
    if (directory) {
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:mainPath];
        for (NSString *path in enumerator) {
            NSString *fullPath = [mainPath stringByAppendingPathComponent:path];
            NSDictionary *attr = [manager attributesOfItemAtPath:fullPath error:nil];
            size += attr.fileSize;
        }
    }else{
        size = [manager attributesOfItemAtPath:mainPath error:nil].fileSize;
    }
    return size;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)self.accessoryView;
    [indicator startAnimating];
    
}
@end
