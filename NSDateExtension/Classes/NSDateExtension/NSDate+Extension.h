//
//  NSDate+Extension.h
//  rqbao
//
//  Created by sunny on 2018/4/9.
//  Copyright © 2018年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
+ (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour withNowData:(NSDate *)date;
@end
