/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

*/

%hook RDInAppPurchaseManager

- (_Bool)inDebugMode {
	return YES;
}

%end

%hook RDSubscriptionManager

- (_Bool)inDebugMode {
	return YES;
}

%end


%hook RDSharedSubscriptionInfo

- (NSString*) subscriptionState {
	return @"temporaryActive";
}

%end

%hook RD2Settings

- (NSString*) subscriptionState {
	return @"temporaryActive";
}

%end
