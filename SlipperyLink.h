#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlipperyLink : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *urlString;
@property (nonatomic, strong, readonly) UIImage *icon;

+ (instancetype)linkWithTitle:(NSString *)title
                     urlString:(NSString *)urlString
                          icon:(UIImage *)icon;

// Lien "Source Code" tout fait : icône GitHub embarquée dans la lib,
// rendue en mode template + labelColor -> passe au blanc toute seule
// en mode sombre, sans code de switch à écrire côté tweak.
+ (instancetype)githubLinkWithURLString:(NSString *)urlString;

// Les 3 liens standard, identiques et réutilisables sur tous les tweaks
// Slippery : URL et icônes fixes, embarquées dans la lib.
+ (instancetype)githubSourceCodeLink;   // -> https://pizzasdu83.github.io/source_code/
+ (instancetype)moreLink;              // "More" (icône vibin)
+ (instancetype)discordLink;           // "Address me on discord"

// Les 3 liens standard ci-dessus, dans l'ordre attendu par le footer.
+ (NSArray<SlipperyLink *> *)standardLinks;

@end

NS_ASSUME_NONNULL_END
