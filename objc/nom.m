#import <Nu/Nu.h>

static int load_nu_files(NSString *bundleIdentifier, NSString *mainFile)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSBundle *bundle = [NSBundle bundleWithIdentifier:bundleIdentifier];
    NSString *main_path = [bundle pathForResource:mainFile ofType:@"nu"];
    if (main_path) {
        NSString *main_nu = [NSString stringWithContentsOfFile:main_path];
        if (main_nu) {
            id parser = [Nu parser];
            id script = [parser parse: main_nu];
            [parser eval:script];
        }
    }
    [pool release];
    return 0;
}

void NomNomNom()
{
    static int initialized = 0;
    if (!initialized) {
        initialized = 1;
        load_nu_files(@"nu.programming.nom", @"nom");
    }
}