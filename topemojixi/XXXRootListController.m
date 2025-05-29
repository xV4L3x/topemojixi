#include "XXXRootListController.h"
#include <spawn.h>
#include <signal.h>

@implementation XXXRootListController


 




- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
        
	}

	return _specifiers;
}



-(void)save
{
    [self.view endEditing:YES];
}

-(void)contactMethod
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/x_vale_x"]];
}

-(void)contactInsta
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.instagram.com/vale_denicola/?hl=it"]];
}
-(void)contactPaypal
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.paypal.me/xvalex?ppid=PPC000628&cnac=IT&rsta=en_IT(en_AD)&cust=2GGJRYAZQGAQA&unptid=129f38b0-ba3e-11e8-a36f-101f7436f90c&t=&cal=f765d03f54627&calc=f765d03f54627&calf=f765d03f54627&unp_tpcid=ppme-social-user-profile-created&page=main:email&pgrp=main:email&e=op&mchn=em&s=ci&mail=sys"]];
}



-(void)respring 
{
    
    
	[NSThread sleepForTimeInterval: 5];

    pid_t pid;
int status;
const char *argv[] = {"killall", "SpringBoard", NULL};
posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)argv, NULL);
waitpid(pid, &status, WEXITED);
}


@end
