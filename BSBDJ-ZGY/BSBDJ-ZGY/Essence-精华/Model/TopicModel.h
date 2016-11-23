//
//  TopicModel.h
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/23.
//  Copyright © 2016年 张高远. All rights reserved.
//
typedef NS_ENUM(NSInteger , TopicType) {
    /** 全部 */
    AllTopicType = 1,
    /** 图片 */
    PictureTopicType = 10,
    /** 段子 */
    WordTopicType = 29,
    /** 音频 */
    VoiceTopicType = 31,
    /** 视频 */
    VideoTopicType = 41,
};
#import <Foundation/Foundation.h>
#import <MJExtension.h>
@interface TopicModel : NSObject
/** 用户id */
@property(nonatomic,copy) NSString *ID;
/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *created_at;
/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
/** 中间内容类型 */
@property(nonatomic,assign)TopicType type;
/** 图片真实高度 */
@property(nonatomic,assign)CGFloat height;
/** 图片真实宽度 */
@property(nonatomic,assign)CGFloat width;

@property(nonatomic,assign)BOOL is_gif;
/** 小图 */
@property(nonatomic,strong)NSString *small_image;
/** 大图原图 */
@property(nonatomic,strong)NSString *large_image;
/** 中图 */
@property(nonatomic,strong)NSString *middle_image;


/** video播放时间 */
@property(nonatomic,assign)NSInteger videotime;
/** voice播放时间 */
@property(nonatomic,assign)NSInteger voicetime;
/** 播放次数 */
@property(nonatomic,assign)NSInteger playcount;

@property(nonatomic,strong)NSString *videouri;

@property(nonatomic,strong)NSString *voiceuri;
@end
