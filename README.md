# ComboAlertView
Based on the iOS version, ComboActionSheet applies compatible native components (could be UIAlertView or UIAlertController)

# Usage:
ComboAlertView *alert = [[ComboAlertView alloc] init];

[alert showWithVC:self delegate:self title:@"Hello" message:@"My ComboAlertView" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"aaa",@"bbb",@"ccc"]];
