/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

*/

%hook StoreManager

+ (_Bool)isSubscriptionItem:(id)arg1 {
	return YES;
}

+ (_Bool)wasItemPurchased:(id)arg1 {
	return YES;
}

%end

%hook Product

- (_Bool)isSubscription {
	return YES;
}

%end

%ctor {
	%init(Product=objc_getClass("textgrabber.Product"));
}

