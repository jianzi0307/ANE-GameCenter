ANE-GameCenter
==============

GameCenter ANE for flash air ios app


+ 在XXX-app.xml添加扩展依赖

```xml
<extensions>
	...
	<extensionID>com.alanogames.ane.GameCenterExtension</extensionID>
</extensions>
```

+ 初始化

```actionscript
GameCenterExtension.init();
```
  
+ 设备是否支持

```actionscript
GameCenterExtension.isSupported;
```

+ 是否已认证

```actionscript
GameCenterIOSExtension.isAuthenticated;
```

+ 认证

```actionscript
if( !GameCenterIOSExtension.isAuthenticated ) {
    GameCenterIOSExtension.authenticateLocalPlayer();
}
```
  
+ 获取玩家信息
  
```actionscript
GameCenterIOSExtension.localPlayer;
```

+ 提交成绩

```actionscript
GameCenterIOSExtension.reportScore( leaderboard, score );
```

+ 显示排行榜

```actionscript
GameCenterIOSExtension.showStandardLeaderboard( leaderboard (optional), timeScope (optional) );
```

+ 获取排行榜数据

```actionscript
GameCenterIOSExtension.getLocalPlayerScore( "leaderboard" );
```

+ 提交成就

```
GameCenterIOSExtension.reportAchievement( achievement, value );
```

+ 显示成就榜

```actionscript
GameCenterIOSExtension.showAchievements();
```

+ 获取成就

```actionscript
GameCenterIOSExtension.getAchievements();
```

+ 好友列表

```actionscript
GameCenterIOSExtension.getLocalPlayerFriends();
```

+ 感谢

> **ANE-Wizard**

> https://github.com/freshplanet/ANE-Wizard

> **ANE-Game-Center**

> https://github.com/StickSports/ANE-Game-Center

GameCenterIOSExtension 修复了 ANE-Game-Center 在IOS6设备上，关闭排行榜后不再响应任何操作的bug。

App is unresponsive after closing leaderboard in iOS 7 #8

https://github.com/StickSports/ANE-Game-Center/issues/8

App is unresponsive after closing leaderboard\achievements on iOS 6 #13

https://github.com/StickSports/ANE-Game-Center/issues/13
