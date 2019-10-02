%hook NSUserDefaults

- (BOOL)boolForKey:(NSString *)defaultName {
	if ([defaultName isEqualToString: @"user_premium"] || [defaultName isEqualToString: @"user_premium_purchased"] || [defaultName isEqualToString: @"premium"]) {
		return YES;
	}
	return %orig;
}

- (void)setBool:(BOOL)value 
         forKey:(NSString *)defaultName {
	if ([defaultName isEqualToString: @"user_premium"] || [defaultName isEqualToString: @"user_premium_purchased"] || [defaultName isEqualToString: @"premium"]) {
		return;
        }

	return %orig;
}

%end

%hook APDAdNetwork

+ (id)mrecAdRegistry {
	return NULL;
}
+ (id)nativeAdRegistry {
	return NULL;
}
+ (id)skippableVideoRegistry {
	return NULL;
}
+ (id)interstitialAdRegistry {
	return NULL;
}
+ (id)bannerRegistry {
	return NULL;
}

%end

%hook APIController

- (void)syncronize:(id)arg1 syncParams:(id)arg2 forceSync:(_Bool)arg3 {
	return;
}

%end
