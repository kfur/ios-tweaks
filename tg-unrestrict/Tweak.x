#import "substrate.h"



typedef struct {
    int64_t a;
    int64_t b;
}ss;

static ss (*_restrictionText)(void*, ss, int64_t) = NULL;
ss restrictionText(void* self, ss a, int64_t b) {
        ss r = _restrictionText(self, a, b);
	r.a = 0;
	r.b = 0;
        return r;
}


%ctor {
    MSHookFunction(MSFindSymbol(NULL, "_$s7Postbox4PeerP12TelegramCoreE15restrictionText8platform15contentSettingsSSSgSS_AD07ContentI0VtF"), (void*)restrictionText, (void**)&_restrictionText);
}


