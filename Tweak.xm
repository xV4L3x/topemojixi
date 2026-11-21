 @interface SBLockScreenViewControllerBase : UIViewController
 @end



static BOOL SCisEnabled = YES; 
static NSString* SCtext = nil;
static NSString* SCX = nil;
static NSString* SCY = nil;

static void loadPrefs()
 {
     NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.xvalex.topemojixi.plist"];

      SCisEnabled = ( [prefs objectForKey:@"SCisEnabled"] ? [[prefs objectForKey:@"SCisEnabled"] boolValue] : SCisEnabled );
      SCtext = ( [prefs objectForKey:@"SCtext"] ? [prefs objectForKey:@"SCtext"] : SCtext );
      [SCtext retain];
      SCX = ( [prefs objectForKey:@"SCX"] ? [prefs objectForKey:@"SCX"] : SCX );
      [SCX retain];
      SCY = ( [prefs objectForKey:@"SCY"] ? [prefs objectForKey:@"SCY"] : SCY );
      [SCY retain];
     [prefs release];
 }

%hook SBLockScreenViewControllerBase
- (void)viewDidLoad {
	%orig;

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.xvalex.topemojixi/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();

    double x = [SCX doubleValue];
    double y = [SCY doubleValue];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, self.view.bounds.size.width, self.view.bounds.size.height)];
	
	if (SCisEnabled) {
		label.text = SCtext;
	} else {
		label.text = nil;
	}
	
	label.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(35.0)];
	label.textColor = [UIColor whiteColor];
	label.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:label];
}
%end
