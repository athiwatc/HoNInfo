/*
 * AppController.j
 * HoNIdd
 *
 * Created by You on January 3, 2012.
 * Copyright 2012, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
	@outlet CPTextField expNeeded;
	@outlet CPPopUpButton level;
	
	//damage reduction
	@outlet CPTextField plusArmor;
	@outlet CPTextField minusArmor;
	@outlet CPTextField resultReduction;
	
	//EHP
	@outlet CPTextField actualHealth;
	@outlet CPTextField armor;
	@outlet CPTextField ehp;
	
	//Attack speed
	@outlet CPTextField ias;
	@outlet CPTextField bat;
	@outlet CPTextField aps;
	
	//mana regen
	@outlet CPTextField baseManaRegen;
	@outlet CPTextField mInt;
	@outlet CPTextField perIncrease;
	@outlet CPTextField staticIncrease;
	@outlet CPTextField manaRegenPerSec;
	
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];


	//Add the level popup box to level 25
	for (var i=4; i < 26; i++) {
		[level addItemWithTitle:i.toString()];
	};
}

- (@action)manaRegenChanged:(id)sender
{
	[manaRegenPerSec setObjectValue:(([baseManaRegen floatValue] + 0.04*[mInt floatValue]) * (1+[perIncrease floatValue])) + [staticIncrease floatValue]];
}

- (@action)asChanged:(id)sender
{
	[aps setObjectValue:(1 + [ias doubleValue]*0.01) / [bat doubleValue]];
}

- (@action)ehpChanged:(id)sender
{
	[ehp setObjectValue: [actualHealth doubleValue] * (1 + 0.06*[armor doubleValue])];
}

- (@action)reductionChanged:(id)sender
{
    var totalArmor =[plusArmor doubleValue] - [minusArmor doubleValue];
 	var newArmor = 0;
	if (totalArmor >= 0) {
		newArmor = (0.06 * totalArmor) / (1 + 0.06 * totalArmor);
	} else {
		newArmor = Math.pow(0.94, (-totalArmor)) - 1;
	}
	
	[resultReduction setObjectValue: newArmor*100];
}

- (@action)levelChanged:(id)sender {
	var currentLevel = [level indexOfSelectedItem] + 1;
	var expChart = [];
	expChart[1] = 0;
	expChart[2] = 200;
	expChart[3] = 500;
	expChart[4] = 900;
	expChart[5] = 1400;
	expChart[6] = 2000;
	expChart[7] = 2700;
	expChart[8] = 3500;
	expChart[9] = 4400;
	expChart[10] = 5400;
	expChart[11] = 6500;
	expChart[12] = 7700;
	expChart[13] = 9000;
	expChart[14] = 10400;
	expChart[15] = 11900;
	expChart[16] = 13500;
	expChart[17] = 15200;
	expChart[18] = 17000;
	expChart[19] = 18900;
	expChart[20] = 20900;
	expChart[21] = 23000;
	expChart[22] = 25200;
	expChart[23] = 27500;
	expChart[24] = 29900;
	expChart[25] = 32400;
	
    [expNeeded setObjectValue:expChart[currentLevel]];
}


@end
