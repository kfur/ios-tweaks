/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

*/

%hook IAPHelper

- (_Bool)productPurchased:(id)arg1 {
	return YES;
}

- (_Bool)isJailbroken {
	return NO;
}

%end
