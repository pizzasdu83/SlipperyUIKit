#import <UIKit/UIKit.h>
#import "SlipperyLink.h"

NS_ASSUME_NONNULL_BEGIN

// Rounded card of tappable rows (icon + title), one row per link.
// Drop it as your PSListController's table.tableFooterView, same pattern
// as SlipperyPrefsHeaderView for the top.
@interface SlipperyPrefsFooterView : UIView

- (instancetype)initWithLinks:(NSArray<SlipperyLink *> *)links;

// Le footer "Source Code / More / Address me on discord" tout fait,
// identique sur tous les tweaks Slippery (liens + icônes fixes).
+ (instancetype)standardFooterView;

@end

NS_ASSUME_NONNULL_END
