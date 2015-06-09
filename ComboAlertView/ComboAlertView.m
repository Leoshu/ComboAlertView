
#import "ComboAlertView.h"

@implementation ComboAlertView {
    __weak id<ClickComboAlertViewProtocol> privateDelegate;
    ComboAlertView *comboAlert;
}

@synthesize isShowing;

- (id)init {
    self = [super init];
    if(self) {
        comboAlert = self;
    }
    return self;
}

- (void)showWithVC:(UIViewController *)VC delegate:(id<ClickComboAlertViewProtocol>)delegate title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles {
    
    if ([UIAlertController class]) {
        // For ios8 and later
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:title
                                              message:message
                                              preferredStyle:UIAlertControllerStyleAlert];
        if (cancelButtonTitle) {
            UIAlertAction *cancelAction = [UIAlertAction
                                           actionWithTitle:cancelButtonTitle
                                           style:UIAlertActionStyleCancel
                                           handler:^(UIAlertAction *action) {
                                               isShowing = NO;
                                               if ([delegate respondsToSelector:@selector(onClickComboAlertAtIndex:)]) {
                                                   [delegate onClickComboAlertAtIndex:0];
                                               }
                                               if ([delegate respondsToSelector:@selector(onClickComboAlertWithTitle:message:atIndex:)]) {
                                                   [delegate onClickComboAlertWithTitle:title message:message atIndex:0];
                                               }
                                           }];
            [alertController addAction:cancelAction];
        }
        
        if (otherButtonTitles) {
            for (int i=0 ; i<[otherButtonTitles count] ; i++) {
                UIAlertAction *otherAction = [UIAlertAction
                                           actionWithTitle:[otherButtonTitles objectAtIndex:i]
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action) {
                                               isShowing = NO;
                                               if ([delegate respondsToSelector:@selector(onClickComboAlertAtIndex:)]) {
                                                   [delegate onClickComboAlertAtIndex:i+1];// Shift 1, because 0 is cancelButton.
                                               }
                                               if ([delegate respondsToSelector:@selector(onClickComboAlertWithTitle:message:atIndex:)]) {
                                                   [delegate onClickComboAlertWithTitle:title message:message atIndex:i+1];// Shift 1, because 0 is cancelButton.
                                               }
                                           }];
                [alertController addAction:otherAction];
            }
        }
        
        isShowing = YES;
        
        // This a bug report to Apple: rdar://19285091
        // Workaround
        dispatch_async(dispatch_get_main_queue(), ^{
            [VC presentViewController:alertController animated:YES completion:nil];
        });
    }
    else {
        // For ios7 and earlier
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:comboAlert cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        if (otherButtonTitles) {
            for(NSString *buttonTitle in otherButtonTitles) {
                [alertView addButtonWithTitle:buttonTitle];
            }
        }
        isShowing = YES;
        [alertView show];
        privateDelegate = delegate;
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    isShowing = NO;
    if ([privateDelegate respondsToSelector:@selector(onClickComboAlertAtIndex:)]) {
        [privateDelegate onClickComboAlertAtIndex:buttonIndex];
    }
    if ([privateDelegate respondsToSelector:@selector(onClickComboAlertWithTitle:message:atIndex:)]) {
        [privateDelegate onClickComboAlertWithTitle:[alertView title] message:[alertView message] atIndex:buttonIndex];
    }
}

@end
