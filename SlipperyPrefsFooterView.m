#import "SlipperyPrefsFooterView.h"

static const CGFloat kSlipperyRowHeight = 44.0;
static const CGFloat kSlipperyIconSide2 = 24.0;
static const CGFloat kSlipperyHPad     = 16.0;
static const CGFloat kSlipperyTopMargin = 24.0;

// One tappable row. UIControl gives free touch-highlight behavior.
@interface SlipperyFooterRow : UIControl
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation SlipperyFooterRow

- (instancetype)initWithLink:(SlipperyLink *)link {
    self = [super initWithFrame:CGRectZero];
    if (!self) return nil;

    self.urlString = link.urlString;

    _iconView = [[UIImageView alloc] initWithImage:link.icon];
    _iconView.contentMode = UIViewContentModeScaleAspectFit;
    if (link.icon.renderingMode == UIImageRenderingModeAlwaysTemplate) {
        _iconView.tintColor = UIColor.labelColor; // suit auto le mode sombre
    }
    [self addSubview:_iconView];

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = link.title;
    _titleLabel.textColor = UIColor.labelColor;
    _titleLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:_titleLabel];

    [self addTarget:self action:@selector(slippery_tapped) forControlEvents:UIControlEventTouchUpInside];

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    _iconView.frame = CGRectMake(kSlipperyHPad, (kSlipperyRowHeight - kSlipperyIconSide2) / 2.0, kSlipperyIconSide2, kSlipperyIconSide2);
    CGFloat labelX = kSlipperyHPad + kSlipperyIconSide2 + 12.0;
    _titleLabel.frame = CGRectMake(labelX, 0, width - labelX - kSlipperyHPad, kSlipperyRowHeight);
}

- (void)slippery_tapped {
    NSURL *url = [NSURL URLWithString:self.urlString];
    if (url) [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

@end

@implementation SlipperyPrefsFooterView {
    NSArray<SlipperyFooterRow *> *_rows;
    NSArray<UIView *> *_separators;
}

- (instancetype)initWithLinks:(NSArray<SlipperyLink *> *)links {
    self = [super initWithFrame:CGRectZero];
    if (!self) return nil;

    self.backgroundColor = UIColor.secondarySystemGroupedBackgroundColor;
    self.layer.cornerRadius = 12.0;
    self.layer.masksToBounds = YES;

    NSMutableArray *rows = [NSMutableArray array];
    NSMutableArray *separators = [NSMutableArray array];
    for (SlipperyLink *link in links) {
        SlipperyFooterRow *row = [[SlipperyFooterRow alloc] initWithLink:link];
        [self addSubview:row];
        [rows addObject:row];

        if (rows.count > 1) {
            UIView *sep = [[UIView alloc] init];
            sep.backgroundColor = UIColor.separatorColor;
            [self addSubview:sep];
            [separators addObject:sep];
        }
    }
    _rows = rows;
    _separators = separators;

    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, kSlipperyTopMargin + (_rows.count * kSlipperyRowHeight));
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat y = kSlipperyTopMargin;
    for (NSUInteger i = 0; i < _rows.count; i++) {
        _rows[i].frame = CGRectMake(0, y, width, kSlipperyRowHeight);
        y += kSlipperyRowHeight;
        if (i < _separators.count) {
            _separators[i].frame = CGRectMake(kSlipperyHPad + kSlipperyIconSide2 + 12.0, y, width - (kSlipperyHPad + kSlipperyIconSide2 + 12.0) - kSlipperyHPad, 0.5);
        }
    }
}

+ (instancetype)standardFooterView {
    return [[self alloc] initWithLinks:[SlipperyLink standardLinks]];
}

@end
