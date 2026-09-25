#import "SlipperyLink.h"

@implementation SlipperyLink

+ (instancetype)linkWithTitle:(NSString *)title
                     urlString:(NSString *)urlString
                          icon:(UIImage *)icon {
    SlipperyLink *link = [SlipperyLink new];
    [link setValue:[title copy] forKey:@"title"];
    [link setValue:[urlString copy] forKey:@"urlString"];
    [link setValue:icon forKey:@"icon"];
    return link;
}

+ (instancetype)githubLinkWithURLString:(NSString *)urlString {
    NSBundle *bundle = [NSBundle bundleForClass:self];
    UIImage *raw = [UIImage imageNamed:@"github" inBundle:bundle compatibleWithTraitCollection:nil];
    UIImage *templated = [raw imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return [self linkWithTitle:@"Source Code" urlString:urlString icon:templated];
}

+ (instancetype)githubSourceCodeLink {
    return [self githubLinkWithURLString:@"https://pizzasdu83.github.io/source_code/"];
}

+ (instancetype)moreLink {
    NSBundle *bundle = [NSBundle bundleForClass:self];
    UIImage *icon = [UIImage imageNamed:@"vibin" inBundle:bundle compatibleWithTraitCollection:nil];
    return [self linkWithTitle:@"More" urlString:@"https://youtu.be/dtCZMge7oHQ" icon:icon];
}

+ (instancetype)discordLink {
    NSBundle *bundle = [NSBundle bundleForClass:self];
    UIImage *icon = [UIImage imageNamed:@"discord" inBundle:bundle compatibleWithTraitCollection:nil];
    return [self linkWithTitle:@"Address me on discord" urlString:@"https://discord.gg/e4zY6NrX" icon:icon];
}

+ (NSArray<SlipperyLink *> *)standardLinks {
    return @[[self githubSourceCodeLink], [self moreLink], [self discordLink]];
}

@end
