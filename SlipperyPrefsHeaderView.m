#import "SlipperyPrefsHeaderView.h"

static const CGFloat kSlipperyIconSide   = 96.0;
static const CGFloat kSlipperyPadTop     = 24.0;
static const CGFloat kSlipperyIconToName = 12.0;
static const CGFloat kSlipperyPadBottom  = 20.0;

@implementation SlipperyPrefsHeaderView {
    UIImageView *_iconView;
    UILabel *_titleLabel;
}

- (instancetype)initWithTitle:(NSString *)title
                      iconName:(NSString *)iconName
                        bundle:(NSBundle *)bundle {
    self = [super initWithFrame:CGRectZero];
    if (!self) return nil;

    UIImage *icon = [UIImage imageNamed:iconName inBundle:bundle compatibleWithTraitCollection:nil];
    _iconView = [[UIImageView alloc] initWithImage:icon];
    _iconView.contentMode = UIViewContentModeScaleAspectFit;
    _iconView.layer.cornerRadius = kSlipperyIconSide * 0.22;
    _iconView.layer.masksToBounds = YES;
    [self addSubview:_iconView];

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.text = title;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = UIColor.labelColor;
    _titleLabel.font = [UIFont systemFontOfSize:22 weight:UIFontWeightBold];
    [self addSubview:_titleLabel];

    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat height = kSlipperyPadTop + kSlipperyIconSide + kSlipperyIconToName;
    height += [_titleLabel sizeThatFits:CGSizeMake(size.width, CGFLOAT_MAX)].height;
    return CGSizeMake(size.width, height + kSlipperyPadBottom);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;

    CGRect iconRect = CGRectMake((width - kSlipperyIconSide) / 2.0, kSlipperyPadTop, kSlipperyIconSide, kSlipperyIconSide);
    _iconView.frame = iconRect;

    CGFloat y = CGRectGetMaxY(iconRect) + kSlipperyIconToName;
    CGFloat titleHeight = [_titleLabel sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)].height;
    _titleLabel.frame = CGRectMake(0, y, width, titleHeight);
}

@end
