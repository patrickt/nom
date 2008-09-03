#import <Nu/Nu.h>

void NomInit()
{
    static int initialized = 0;
    if (!initialized) {
        initialized = 1;
        [Nu loadNuFile:@"nom" fromBundleWithIdentifier:@"nu.programming.nom" withContext:nil];
    }
}

@interface Nom : NSObject
{
}
@end

@implementation Nom

+ (void)load
{
    NSLog(@"Loading");
    NomInit();
}

@end
