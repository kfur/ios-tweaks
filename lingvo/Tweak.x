/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

*/

%hook CSettingsData

- (_Bool)isDictionaryPurchased:(id)arg1 {
	return YES;
}

%end


%hook CPurchaseInfo

- (_Bool)isItemPurchased:(id)arg1 {
	return YES;
}

%end


%hook CContentManager


- (_Bool)registerPurchasedItem:(id)arg1 {
	return YES;
}

- (_Bool)hasPaidPurchasedDictionaries {
	return YES;
}

- (_Bool)isItemCanBeDownloaded:(id)arg1 {
	return YES;
}

- (_Bool)isItemPurchased:(id)arg1 {
	return YES;
}

%end

