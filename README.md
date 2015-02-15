KYPageControl
=============

类似Smartisan OS首页的小圆点滚动效果


###How to use
In `viewDidLoad`
```
pageControlView = [[PageControlView alloc]initWithOrigin:CGPointMake(0, self.ImageScrollView.bottom - 40) PageNumber:3];
[self.scrollView addSubview:pageControlView];

```

In `scrollViewDidScroll:`
```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
double distance = self.ImageScrollView.contentOffset.x/ScreenWidth;

if ([pageControlView respondsToSelector:@selector(moveThePage:)]) {
[pageControlView moveThePage:distance];
}
}

```


Blog:[Click here](http://kittenyang.com/pagecontrol/)
