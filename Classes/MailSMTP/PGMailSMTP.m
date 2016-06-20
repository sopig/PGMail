//
//  PGMailSMTP.m
//  PGMail
//
//  Created by 张正超 on 16/6/20.
//  Copyright © 2016年 jiuxian.com. All rights reserved.
//

#import "PGMailSMTP.h"
#import "SKPSMTPMessage.h"
@interface PGMailSMTP ()<SKPSMTPMessageDelegate>

@property (nonatomic, retain) SKPSMTPMessage * skpSMTP;

@end

@implementation PGMailSMTP

@synthesize delegate, hostname, username, password, from, to, subject, content;

- (void) sendMail {
    self.skpSMTP = [[SKPSMTPMessage alloc] init];
    self.skpSMTP.delegate = self;
    self.skpSMTP.fromEmail = from;
    self.skpSMTP.toEmail = to;
    self.skpSMTP.relayHost = hostname;
    self.skpSMTP.requiresAuth = YES;
    if (self.skpSMTP.requiresAuth) {
        self.skpSMTP.login = username;
        self.skpSMTP.pass = password;
    }
    self.skpSMTP.wantsSecure = YES;
    self.skpSMTP.subject = subject;
    
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8", kSKPSMTPPartContentTypeKey,
                               content, kSKPSMTPPartMessageKey, @"8bit", kSKPSMTPPartContentTransferEncodingKey,nil];
    
    self.skpSMTP.parts = [NSArray arrayWithObjects:plainPart,nil,nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.skpSMTP send];
    });
}

- (void)messageSent:(SKPSMTPMessage *)message {
    [delegate onSuccess:@"Message sent success"];
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error {
    [delegate onFailed:@"Message send failed"];
}




@end
