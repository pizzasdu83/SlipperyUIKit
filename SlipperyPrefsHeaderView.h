#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// Icon + title shown above the first group of a settings page.
// Generic version of HBTPrefsHeaderView, usable by any Slippery tweak.
@interface SlipperyPrefsHeaderView : UIView

// iconName / bundle: pass the CALLING tweak's own bundle (its icon stays in
// its own PreferenceBundle, only the layout code lives here).
- (instancetype)initWithTitle:(NSString *)title
                      iconName:(NSString *)iconName
                        bundle:(NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
