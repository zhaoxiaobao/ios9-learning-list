# ios9-learning-list
#1. Search APIs

ios9之前，你只能用聚光灯的名字找到应用程序。随着新ios9搜索发布的API，现在苹果允许开发者选择他们的应用程序，他们想要指数有什么内容，以及如何的结果出现在聚光灯下，当用户点击其中一个结果。

##The 3 APIs
###NSUserActivity
The NSUserActivity API 介绍了在iOS8中切换，但ios9允许活动进行搜索。现在，您可以向这些活动提供元数据，这意味着聚光灯可以索引它们。这是一个历史堆栈，类似于你浏览网页时。用户可以快速打开他们最近的活动从聚光灯。

###Web Markup
Web Markup APIs 在网站上反映其内容的应用程序，以索引其内容。用户不需要有安装在他们的设备上的应用程序的结果出现在聚光灯下。苹果的索引器将抓取的网页，寻找你的网站这一特殊标记。这是当时在Safari和聚光灯提供给用户。

即使你的应用程序不被安装在用户的设备上，这样的结果可能会导致更多的接触潜在用户。从你的应用程序的深层链接，你公开的搜索引擎将被存储在苹果的云指数。要了解更多关于网络标记，官方文档[Use Web Markup to Make App Content Searchable](https://developer.apple.com/library/prerelease/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS9.html#//apple_ref/doc/uid/TP40016198-SW4) .

###CoreSpotlight
CoreSpotlight is 一个新的ios9框架，允许你在你的应用程序的任何内容索引。而nsuseractivity用于保存用户的历史，这个API，你可以任何你喜欢的指标数据。它本质上为你提供低级别的访问的corespotlight指数对用户的设备。

##Using the Core Spotlight APIs
The NSUserActivity and Web Markup APIs 是使用比较简单，但是corespotlight更复杂一点。为了演示如何在新的核心聚光灯的工作，让我们创建一个简单的应用程序，显示了我们的朋友名单，然后一个图片，当你点击他们的名字。 


