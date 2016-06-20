//
//  PGMailSMTP.h
//  PGMail
//
//  Created by 张正超 on 16/6/20.
//  Copyright © 2016年 jiuxian.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CFNetwork/CFNetwork.h>


@protocol MailSMTPDelegate
@required

-(void)onSuccess:(NSString *)message;
-(void)onFailed:(NSString *)error;

@end


@interface PGMailSMTP : NSObject 

@property(nonatomic, assign) id <MailSMTPDelegate> delegate;

@property(nonatomic, retain) NSString *hostname;
@property(nonatomic, retain) NSString *username;
@property(nonatomic, retain) NSString *password;
@property(nonatomic, retain) NSString *from;
@property(nonatomic, retain) NSString *to;
@property(nonatomic, retain) NSString *subject;
@property(nonatomic, retain) NSString *content;

- (void)sendMail;

@end
