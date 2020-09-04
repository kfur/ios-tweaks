/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

*/

%hook FSPurchaseCoordinator

+ (_Bool)isItemActive:(long long)arg1 {
	return YES;
}

+ (_Bool)isItemPurchased:(long long)arg1 {
	return YES;
}

+ (_Bool)hasActivePremium {
	return YES;
}

%end


%ctor {
	%init(FSPurchaseCoordinator=objc_getClass("FineScanner.FSPurchaseCoordinator"));
}

