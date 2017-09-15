## WebAssembly Demo之Canvas中随机运动圆球


### 1、Demo功能介绍
实现了一个圆球在800px * 600px画布内随机运动，固定时间间隔随机运动一次，运动方向由x和y轴组成的
矢量决定，这个矢量是随机值（后面会称它为**随机矢量**），从C语言代码中的随机函数获取，JS代码
实现小球的画布渲染、越界纠正等工作。

Demo同时实现了纯JS（即不使用WebAssembly）和WebAssembly两个版本，都在Demo地址中。

### 2、Demo地址
github : https://github.com/cunzaizhuyi/wasm-canvasDemo

### 3、Demo目录结构
因为demo比较简单，也没有什么js库依赖，所以本库的所有demo都是按照目录区分的（一个目录是一个demo），而没有使用诸如src、doc、dist
之类的结构。

**canvasDemo-wasm1**：C代码中未加随机时间种子的**一种实现**，因此每次刷新HTML页面实际上产生的是**同一个随机序列**，
也就是说**每次刷新页面后，若观察小球的运动轨迹，都是一样的**。不过因为没有随机时间种子，所以，
不管JS setInerval设定的时间间隔多短暂，这一个随机序列的每个值都是新鲜随机出来的，即：与上一个随机值
重复的概率仅等于随机范围分之一。因此，这种实现下，小球的运动轨迹在canvas内的分布更加的均匀。

**canvasDemo-wasm2** :C代码中加了随机时间种子的**一种实现**，小球移动不均匀，因为随机种子的时间粒度比较粗，而随机运动的
时间间隔远小于这个时间粒度，所以同一对随机值（矢量）会连续重复好几次，这就造成了小球某次运行实际上
并不随机的效果。
```
Note:上面两种实现只有下面两句C代码的差别：
#include<time.h>
srand(time(NULL))
```
**canvasDemo-JS**: JS实现的版本。
**canvasTranslateDemo-wasm**:实现小球从左到右平移运动的demo，wasm实现，使用的wasm的API，没有用胶水代码。**本文
不讲这个demo。**
**其他demo**：后面可能会放入一些其他的wasm demo。

### 4、Demo中主要函数介绍
#### **C语言部分**
有三个函数

|函数名|参数|返回值|描述|
|----|-----|------|---|
|Radom|int m,int n|int x|使用c语言的rand（）函数生成m和n之间的整数，以x返回。|
|randomInTwoSection|int m,int n|int x|给定一个随机区间，如果生成的随机值在左半边，则生成一个负的移动值，以x返回；反之，x返回正的移动值|
|randomGenerator|int xpos,int ypos,int radius|char* a|给定当前小球在画布内的位置：[xpos,ypos]和小球半径，生成下一次移动的向量，之所以有半径参数传入，是设定了一个规则，如果小球pos加减radius已经到达canvas边界，则下次移动，某个方向的随机值必须为负。比如已经到达左边界，则下次运动,X方向的随机数必须是正数，小球才会向右滚动，否则会出左边界。|
#### **JS部分**
功能1：初始化canvas
功能2：run函数，内部是接受C代码传过来的随机向量，赋给canvas的ctx.arc()以画圆。
功能3：设定移动变换的时间间隔。

### 5、编译C代码过程解释

本demo使用的emscripten编译命令为：
```
emcc -o a.html a.c -Os -s WASM=1 --shell-file shell_minimal.html
```
执行完，会生成，一个a.HTML，一个a.wasm，一个a.js。
加上a.c和shell_minimal.html，共五个文件。所以第3节中的random和random2目录下都有这5个文件，
为方便大家重复编译，还附加了1个使用的编译命令的文本文件。

说明：
（1）a.c，a.html中的a是举例，自己开发编译时 请按实际的c文件名称和想要输出的html文件名；
（2）-Os是优化参数，生成的a.js是已经压缩过的，这是胶水代码，它里面有引用生成的a.wasm，有使用WebAssembly API，如WebAssembly.memory和
WebAssembly.Table()等；不加就不压缩，js体积变大；
（3）shell_minimal.html是模板文件，7KB大小，有一些胶水代码，按官方说法，不建议自己写模板。
关于到底使用什么开发模式，用asm?用wasm?用wasm的话用不用胶水代码？这几个问号分别对应什么编译命令？
若想理清以上五个问题，请关注以下网址：

### 6、Demo使用或查看
直接运行canvasDemo-wasm1和canvasDemo-wasm1目录下的HTML文件应该不行，因为是ftp协议，fetch之类的函数会报错，
建议git clone后到webstorm开发环境，这样直接运行html文件就可以了。
当然也可以写个node server跑一下。