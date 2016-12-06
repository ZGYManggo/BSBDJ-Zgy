//
//  TopicCell.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/24.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "TopicCell.h"
#import <UIImageView+WebCache.h>
#import "CenterContentView.h"
#import "UIImageView+ZgyCornerRadiusExtension.h"
@interface TopicCell()

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *textTopicLabel;
@property (nonatomic,strong) UIButton *rightTopButton;
@property (nonatomic,strong) UIButton *likeButton;
@property (nonatomic,strong) UIButton *unlikeButton;
@property (nonatomic,strong) UIButton *shareButton;
@property (nonatomic,strong) UIButton *commentButton;
@property (nonatomic,strong) UIView *line;
@property (nonatomic,weak) CenterContentView *centerContentView;
@end

@implementation TopicCell

-(UIView *)centerContentView{
    if (!_centerContentView) {
        CenterContentView *centerContentView = [[CenterContentView alloc]init];
        centerContentView.backgroundColor = [UIColor clearColor];
        _centerContentView = centerContentView;
        [self.contentView addSubview:centerContentView];
    }
    return _centerContentView;
}

-(UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]initWithRoundingRectImageView];
    }
    return _headImageView;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:13.f];
        _timeLabel.textColor = [UIColor grayColorWithRGB:111 a:1];
    }
    return _timeLabel;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:13.f];
        _nameLabel.textColor = [UIColor grayColorWithRGB:111 a:1];


    }
    return _nameLabel;
}

-(UILabel *)textTopicLabel{
    if (!_textTopicLabel) {
        _textTopicLabel = [[UILabel alloc]init];
        _textTopicLabel.numberOfLines = 0;
        _textTopicLabel.font = [UIFont systemFontOfSize:15.f];
    }
    return _textTopicLabel;
}

-(UIButton *)rightTopButton{
    if (!_rightTopButton) {
        _rightTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightTopButton setImage:[UIImage imageNamed:@"cellmorebtnnormal"] forState:UIControlStateNormal];
    }
    return _rightTopButton;
}

-(UIButton *)likeButton{
    if (!_likeButton) {
        _likeButton = [self setupBottomButton:_likeButton title:@"顶" image:[UIImage imageNamed:@"mainCellDing"]];
        
    }
    return _likeButton;
}

-(UIButton *)unlikeButton{
    if (!_unlikeButton) {
        _unlikeButton = [self setupBottomButton:_unlikeButton title:@"踩" image:[UIImage imageNamed:@"mainCellCai"]];
        }
    return _unlikeButton;
}

-(UIButton *)shareButton{
    if (!_shareButton) {
        _shareButton = [self setupBottomButton:_shareButton title:@"分享" image:[UIImage imageNamed:@"mainCellShare"]];
    }
    return _shareButton;
}

-(UIButton *)commentButton{
    if (!_commentButton) {
        _commentButton = [self setupBottomButton:_commentButton title:@"评论" image:[UIImage imageNamed:@"mainCellComment"]];
    }
    return _commentButton;
}

- (UIButton *)setupBottomButton:(UIButton *)setButton title:(NSString *)title image:(UIImage *)image{
    setButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [setButton setImage:image forState:UIControlStateNormal];
    [setButton setTitleColor:[UIColor colorWithr:111 g:113 b:121 a:1] forState:UIControlStateNormal];
    [setButton setTitle:title forState:UIControlStateNormal];
    setButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    setButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    setButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
    return setButton;
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor grayColorWithRGB:228 a:1];
//        [self.contentView addSubview:_line];
    }
    return _line;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addChildView];
        [self drawSubView];
    }
    return self;
}
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= Margin;
    //   frame.origin.y += CLMargin;
    [super setFrame:frame];
}
- (void)addChildView{
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.textTopicLabel];
    [self.contentView addSubview:self.line];
    [self.contentView addSubview:self.likeButton];
    [self.contentView addSubview:self.unlikeButton];
    [self.contentView addSubview:self.shareButton];
    [self.contentView addSubview:self.commentButton];

}

- (void)drawSubView{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(36);
        make.left.and.top.equalTo(self).offset(Margin);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView);
        make.left.equalTo(self.headImageView.mas_right).offset(Margin);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.left.equalTo(self.nameLabel);
    }];
    [self.textTopicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView.mas_bottom).offset(Margin);
        make.left.equalTo(self.headImageView);
        make.right.equalTo(self).offset(-Margin);
        make.bottom.equalTo(self.centerContentView.mas_top);
    }];
    [self.centerContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(Margin);
        make.right.equalTo(self).offset(-Margin);
        make.height.mas_equalTo(0);
        make.bottom.equalTo(self.line.mas_top);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.and.right.equalTo(self);
        make.bottom.equalTo(self.likeButton.mas_top);
    }];
    NSArray *buttonArr = @[self.likeButton,self.unlikeButton,self.shareButton,self.commentButton];
    __block UIView *lastView = nil;
    for (int i = 0; i < buttonArr.count; i ++) {
        UIView *view = buttonArr[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(34);
            make.bottom.equalTo(self);
        }];
        if (i == 0) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self);
            }];
        }else if(i == buttonArr.count - 1){
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self);
                make.left.equalTo(lastView.mas_right);
                make.width.equalTo(lastView);

            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastView.mas_right);
                make.width.equalTo(lastView);
            }];
        }
        lastView = view;
    }
}

-(void)setTopicModel:(TopicModel *)topicModel{
    _topicModel = topicModel;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:topicModel.profile_image]];
    self.nameLabel.text = topicModel.name;
    self.timeLabel.text = topicModel.created_at;
    self.textTopicLabel.text = topicModel.text;
    [self.likeButton setTitle:[NSString stringWithFormat:@"%ld",topicModel.ding] forState:UIControlStateNormal];
    [self.unlikeButton setTitle:[NSString stringWithFormat:@"%ld",topicModel.cai] forState:UIControlStateNormal];
    [self.shareButton setTitle:[NSString stringWithFormat:@"%ld",topicModel.repost] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%ld",topicModel.comment] forState:UIControlStateNormal];
    self.centerContentView.model = topicModel;
    [self.centerContentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([CenterContentView heighOfContentView:topicModel]);
    }];
    [self layoutIfNeeded];
}

+ (CGFloat)getHeightOfCell:(TopicModel *)topicModel{
    
    CGSize textSize = [topicModel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
    
    return Margin*4 + 36 + textSize.height + 35 + [CenterContentView heighOfContentView:topicModel];
}



@end
