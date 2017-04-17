//
//  Money.m
//  lb_21_Try_Catch
//
//  Created by admin on 4/17/17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "Money.h"

@implementation Money
-(Money *) subSumma:(Money *)money {
    if (money == nil) {
        @throw [[NSException alloc]initWithName:@"Неправильное значение параметров" reason:@"Указатель на объект равен nil" userInfo:nil];
    }
    
    int res = self->grn * 100 + self->kop - (money->grn * 100 + money->kop);
    
    if (res < 0) {
        @throw [[NSException alloc]initWithName:@"Неправильное значение суммы" reason:@"Сумма не должна быть отрицательной" userInfo:nil];
    }
    return [[Money alloc] initWithSumma:0 :res];
}

-(id) initWithSumma:(int)inputGrn :(int)inputKop {
    if (inputGrn < 0) {
        @throw [[NSException alloc]initWithName:@"Неправильное значение для суммы" reason:@"Гривны меньше нуля" userInfo:nil];
    }
    if (inputKop < 0) {
        @throw [[NSException alloc]initWithName:@"Неправильное значение для суммы" reason:@"Копейки меньше нуля" userInfo:nil];
    }
    
    self = [super init];
    if (self != nil){
        self->grn = inputGrn + inputKop / 100;
        self->kop = inputKop % 100;
    }
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"%i.%iгрн",self->grn, self->kop];
}

@end
