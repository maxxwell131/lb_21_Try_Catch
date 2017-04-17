//
//  main.m
//  lb_21_Try_Catch
//
//  Created by admin on 4/17/17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

int summa(int a, int b) {
    @try {
        if (a == b) {
            @throw [[NSException alloc] initWithName:@"Error" reason:[NSString stringWithFormat:@"%i == %i", a, b] userInfo:nil];
        }
        return 55;
    } @catch (NSException *exception) {
        return 66;
    } @finally {
        return 99;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        @try {
            @throw [[NSException alloc] initWithName:@"devide by zerro" reason:@"reason" userInfo:nil];
        } @catch (NSException *exception) {
            NSLog(@"Error name %@", exception.name);
            NSLog(@"reason: %@", exception.reason);
        } @finally {
            NSLog(@"finally");
        }
    }
    
    int a,b;
    NSLog(@"input number (1...100):");
    scanf("%i", &a);
    
    NSLog(@"input number two (1...100):");
    scanf("%i", &b);
    
    @try {
        if (a < 1 || a > 100 || b < 1 || b > 100) {
            @throw [[NSException alloc] initWithName:@"out off input diapazone" reason:@"REASSON" userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:a], @"a", [NSNumber numberWithInt:b], @"b", nil]];
        }
        
        if (b == 0) {
            @throw [[NSException alloc] initWithName:@"devide by zerro" reason:@"REASSON" userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:a], @"a", [NSNumber numberWithInt:b], @"b", nil]];
        }
        float c = a / b;
        NSLog(@"result %i / %i = %f", a, b, c);
    } @catch (NSException *exception) {
        NSLog(@"Error name %@", exception.name);
        NSLog(@"reason: %@", exception.reason);
        NSLog(@"result %@ / %@", [exception.userInfo objectForKey:@"a"], [exception.userInfo objectForKey:@"b"]);
    } @finally {
        NSLog(@"finally");
    }
    
    NSLog(@" %i", summa(5, 5));
    
    //--------------Money Class exp.-----------
    Money *money = nil;
    
    while (true) {
        int inputGrn, inputKop;
        NSLog(@"Введите гривны:");
        scanf("%i", &inputGrn);
        NSLog(@"Введите копейки:");
        scanf("%i", &inputKop);

        @try {
            //Money *myMoney = [[Money alloc] initWithSumma:-9 :50];
            //NSLog(@"myMoney = %@", myMoney); // example
            money = [[Money alloc] initWithSumma:inputGrn :inputKop ];
        } @catch (NSException *exception) {
            NSLog(@"Error name %@", exception.name);
            NSLog(@"reason: %@", exception.reason);
        }
        break;
    }
    NSLog(@"Money 1 = %@", money);
    Money *money2 = [[Money alloc] initWithSumma:1 :0];
    @try {
        Money *result = [money subSumma:money2];
        NSLog(@"Result = %@",result);
    } @catch (NSException *exception) {
        NSLog(@"Error name %@", exception.name);
        NSLog(@"reason: %@", exception.reason);
    }
    
    return 0;
}
