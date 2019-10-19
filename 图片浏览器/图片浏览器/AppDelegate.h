//
//  AppDelegate.h
//  图片浏览器
//
//  Created by 王康力 on 2019/10/19.
//  Copyright © 2019 王康力. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

