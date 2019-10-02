// Apollo Pro Ultra semi functional
//
//

#import <UIKit/UIKit.h>
#import "substrate.h"


// Credits to author
%group hello
%hook SettingsAboutViewController

- (void)viewDidLoad {
	%orig;
	UILabel* label = MSHookIvar<UILabel*>(self, "informationLabel");
	if (label == NULL) {
		//NSLog(@"[tweak] informationLabel label is null");
		return;
	}
	
	UIColor* tc = [label textColor];
	[label setText: [[label text] stringByAppendingString:@"\nBrought To You By kfur"]];
	[label setTextColor: tc];
}

%end
%end

// Credits to author
%hook SView

- (void)tableView:(UITableView *)tableView 
willDisplayFooterView:(UIView *)view 
       forSection:(NSInteger)section {
	%orig;
	UILabel *label  = (UILabel *)([view subviews][0]);
	if (label == NULL) {
		//NSLog(@"[tweak] footer no label");
		return; // COUNT CHECK LINE
	}
	[label setText: @"Apollo Pro Brought To You By kfur"];
}

%end

%group spring
%hook AppDelegate

- (void)productsRequest:(id)arg1 didReceiveResponse:(id)arg2 {
//	%log;
	%orig;
	return;
}

%end
%end

//%hook SKReceiptRefreshRequest

//- (void)start {
//	NSLog(@"[tweak] attempt to recive new receipt");
//}

//%end

%hook NSUserDefaults
// For Ultra 
- (NSString *)stringForKey:(NSString *)defaultName {
	NSLog(@"[tweaks] %@", defaultName);
	if ([defaultName isEqualToString: @"awesome_notifications"] || [defaultName isEqualToString: @"ultra_notifications"]) {
		return @"test";
	}
	return %orig;
}

%end

//%hook NSData

//- (instancetype)initWithContentsOfURL:(NSURL *)url 
//                              options:(NSDataReadingOptions)readOptionsMask 
//                                error:(NSError * _Nullable *)errorPtr {
//	NSLog(@"[tweak] nsdata from url: %@", url);
//	return %orig;
//}

//%end

typedef struct {
	uint64_t _countAndFlagsBits;
	uint64_t BridgeObject;
} string_obj;

static BOOL (*orig_string_compare)(string_obj, string_obj, int) = NULL;
// For Pro and Ultra
BOOL string_compare(string_obj a,string_obj b, int c) {
	NSLog(@"[tweak] a._countAndFlagsBits == %llx && a.BridgeObject == %llx", a._countAndFlagsBits, a.BridgeObject);
	NSLog(@"[tweak] b._countAndFlagsBits == %llx && b.BridgeObject == %llx", b._countAndFlagsBits, b.BridgeObject);
	if (b._countAndFlagsBits == (uint64_t)5942622176697803123U && b.BridgeObject == (uint64_t)17149835407180260197U) {
		NSLog(@"[tweakc] pro bypass checks");
		return YES;
	} else if (b._countAndFlagsBits == (uint64_t)24953U && b.BridgeObject == (uint64_t)16285016252571713536U) {
		NSLog(@"[tweakc] ultra bypass checks");
		return YES;
	} else {
		NSLog(@"[tweakc] return original");
		return orig_string_compare(a,b,c);
	}
}


%ctor {
	NSLog(@"[tweak] Apollo Pro Unltra enabled");
	
	%init(SView=objc_getClass("Apollo.SettingsViewController"));
	%init(hello, SettingsAboutViewController = objc_getClass("Apollo.SettingsAboutViewController"));
	%init(spring, AppDelegate = objc_getClass("Apollo.AppDelegate"));
	MSHookFunction(MSFindSymbol(NULL, "_$ss27_stringCompareWithSmolCheck__9expectingSbs11_StringGutsV_ADs01_G16ComparisonResultOtF"),
                   (void*)string_compare,
                   (void**)&orig_string_compare);
}
