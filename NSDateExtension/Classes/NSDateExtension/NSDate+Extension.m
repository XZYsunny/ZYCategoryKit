//
//  NSDate+Extension.m
//  rqbao
//
//  Created by sunny on 2018/4/9.
//  Copyright © 2018年 sunny. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
+ (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour withNowData:(NSDate *)date {
    NSDate *dateDay = [self getCustomDateWithHour:fromHour withNowData:date];
    NSDate *dateNight = [self getCustomDateWithHour:toHour withNowData:date];
    
    NSDate *currentDate = date;
    
    if ([currentDate compare:dateDay] == NSOrderedDescending && [currentDate compare:dateNight] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}
/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间 date比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
+ (NSDate *)getCustomDateWithHour:(NSInteger)hour withNowData:(NSDate *)date {
    //获取当前时间
    NSDate *currentDate = date;
//    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
//    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    /// 8.0
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}
@end
