# ComboAlertView
UIAlertView is deprecated in iOS 8.
This instance can auto judge iOS version, then use UIAlertView in iOS7 and earlier, use UIAlertController in iOS8 and later.

# Usage:
ComboAlertView *alert = [[ComboAlertView alloc] init];

[alert showWithVC:self delegate:self title:@"Hello" message:@"My ComboAlertView" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"aaa",@"bbb",@"ccc"]];
