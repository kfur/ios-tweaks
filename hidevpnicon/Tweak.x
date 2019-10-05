// ===== ITEM HIDING ===== //

@interface UIStatusBarItem : NSObject
+(id)itemWithType:(int)arg1 idiom:(long long)arg2;
@end

%hook SBStatusBarStateAggregator
-(BOOL)_setItem:(int)index enabled:(BOOL)enableItem {

  UIStatusBarItem *item = [%c(UIStatusBarItem) itemWithType:index idiom:0];

  if ([item.description containsString:@"VPN"]) {
    return %orig(index, NO);
  }

  return %orig;
}
%end

