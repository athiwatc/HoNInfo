
@interface AppController : NSObject
{
    IBOutlet NSWindow* theWindow;
    IBOutlet NSTextField* expNeeded;
    IBOutlet NSPopUpButton* level;
    IBOutlet NSTextField* plusArmor;
    IBOutlet NSTextField* minusArmor;
    IBOutlet NSTextField* resultReduction;
    IBOutlet NSTextField* actualHealth;
    IBOutlet NSTextField* armor;
    IBOutlet NSTextField* ehp;
    IBOutlet NSTextField* ias;
    IBOutlet NSTextField* bat;
    IBOutlet NSTextField* aps;
    IBOutlet NSTextField* baseManaRegen;
    IBOutlet NSTextField* mInt;
    IBOutlet NSTextField* perIncrease;
    IBOutlet NSTextField* staticIncrease;
    IBOutlet NSTextField* manaRegenPerSec;
}
- (IBAction)manaRegenChanged:(id)aSender;
- (IBAction)asChanged:(id)aSender;
- (IBAction)ehpChanged:(id)aSender;
- (IBAction)reductionChanged:(id)aSender;
- (IBAction)levelChanged:(id)aSender;
@end