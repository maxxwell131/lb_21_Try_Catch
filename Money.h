//
//  Money.h
//  lb_21_Try_Catch
//
//  Created by admin on 4/17/17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject
{
    int grn;
    int kop;
}
-(id)initWithSumma:(int) inputGrn :(int) inputKop;
-(NSString*)description;
-(Money*)subSumma : (Money *)m;
@end
