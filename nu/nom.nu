(import Foundation)

(class NomProcessor is NSObject
    
    (ivar (id) beauty (id) xhtml)
    
    (+ (id) beautifyingProcessor is ((self alloc) initWithBeauty:YES generatesXHTML:YES))
    
    (+ (id) processor is ((self alloc) initWithBeauty:NO generatesXHTML:YES))
    
    (- (id) initWithBeauty:(id)beauty generatesXHTML:(id)xhtml
        (super init)
        (set @beauty beauty)
        (set @xhtml xhtml)
        self)
    
    (- (id) determineSyntacticValidity is
        f))
        
(global Nom (NomProcessor beautifyingProcessor))