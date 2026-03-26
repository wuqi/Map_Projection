
= 译序 <preface>
#show link: set text(fill: rgb("#2581ccfd"))

地图投影是个很复杂的东西，网上和书本上能讲清楚的不多，这块涉及到很多数学原理和制图相关知识，枯燥而且繁复。

以前网络上有一个很好的教程，《Cartographical Map Projections》，作者是 Carlos A. Furuti。作者其实不是一个专业的制图师，而是一个系统分析师，精通软件开发、语言、图形界面、和计算机图形学。这篇教程图文并茂，插图非常多，特别详细，但是从 19 年开始网站没有维护，已经无法访问了。

大概四年前，我从 #link("https://archive.org")[https://archive.org] 上把老版本的介绍下载了下来，进行翻译和整理，成果在 #link("https://wuqi.github.io/Map_Projection")[https://wuqi.github.io/Map_Projection/] 上。当时用的也是DeepL机翻，部分地方修了一下，当时的翻译软件水平有限，我本人英语也不咋地，整体翻译的比较烂，现在想抽时间对翻译进行修正，希望对大家有所帮助。

说是翻译整理，实际也就是先机翻再改改，以前有不少偏差和翻译错误，所以只能说是能读懂，距离通顺都有不少距离。如今 AI 翻译已经趋于成熟，而且正好赶上 Affinity Studio 软件免费，Typst也日趋成熟，我想把这一整套的东西整理成一本书，来练练手。之前用的是 Markdown 格式，直接用 Docsify 来实现的排版，说不上丑，但是排版效果确实一般，现在想试试做成一本书，做的好看点，想深入排版试试水，顺便学点东西。

Affinity Studio和Typst我都进行了测试使用。下面说一下体验和感想。

Affinity Studio上手还是有一定难度的，但是毕竟有GUI界面，而且自带的排版确实很强，文字环绕什么的确实是很方便。但是本书的图片太多了，手工排版工作量实在是太大了，手动调其实还是没有用模板排方便。

Typst勉强算是一个完成品，虽然有很多不足，但是好歹是一个类似Latex的排版系统，可以使用之前的markdown版本进行修修补补，当然，实际使用下来，排图也有点痛苦，各种grid box进行硬编码。

下面介绍一下整体的构想：

首先第一部分，是对原文进行整体的翻译，完整的介绍制图学中应用的地图投影。其实这套教程整体结构上编排的不是那么严谨，部分结构有点混乱，但是绝对算得上易懂，因为到处都是插图，介绍到概念的地方都有对应投影的介绍，不像普通的地图投影教程，翻过去满眼公式，哪怕退出来。原文全文是第一人称，翻译中我就仍然不做修改。第一部分中所有图片都为原作者#link("carlos.furuti@progonos.com")[Carlos A. Furuti]绘制的，应该是 #strong[禁止商用]的，如有需要请联系Carlos A. Furuti，作者邮箱为：carlos.furuti\@progonos.com。这整套教程里，主要内容如下:

  - 投影的基础知识
  - 投影推导方式
  - 主要投影的介绍以及历史
  - 应对形变做的各种努力
  - 关于投影的一些逸闻趣事以及总结

第二部分中主要是我自己经验的总结。有一些在实践中碰到的问题，在真正实践上碰到的一些容易混淆的概念，以及部分有用但是很少有人总结的经验。主要包括如下内容：

  - 地理坐标系的解释
  - 工作中碰到的投影相关知识
  - WKT-CRS 对投影的描述以及 WKT-CRS 的一些小知识
  - 在实践中碰到的各种疑惑以及对应的解释 

本书中翻译都是使用的DeepSeek，排版使用的是手工加Google AI（其实大部分是手工，毕竟AI不能图文混排），题图是使用Google生成的木版画，第二部分中很多内容也是用AI进行总结的，AI真的是好工具。

书中的字体有几种，都是开源字体：

- 标题、书名等采用#text(font: "LXGW Neo XiHei Plus")[霞鹜新晰黑＋]
- 正文采用#text(font: "LXGW Neo ZhiSong Plus")[霞鹜新致宋]
- 题图以及附图内容采用#text(font: "LXGW WenKai Mono GB")[霞鹜文楷 GB]
#v(3em)

#line(length: 100%, stroke: 0.5pt)
封面动物是网丝蛱蝶（英文俗称 Common Map，学名 Cyrestis thyodamas）。这种蝴蝶的翅膀上布满精密的褐色网状条纹，酷似地图上的坐标与疆界，其英文名“Map”正源于此独特纹路。

网丝蛱蝶主要分布于中国南方、东南亚及日本等地，常见于阔叶林至城市绿地，喜在树冠或石面上停留。其幼虫以榕树等植物为食，凭借绿色的体色与拟态成枯叶的蛹，在自然中隐藏行迹，宛如绘制着一幅生存的隐秘地图。本书封面选用此蝶，意在呼应地图投影学中著名的“沃特曼蝴蝶投影”——其命名正源于将球面展开成蝶翼般对称图形的思路。

其实我最初也考虑过犰狳投影，但是免费的AI现在暂时没法画出正确的犰狳，其他没有版权的钢笔画或者木版画犰狳又不太好找。

图像是用Google AI生成提示词，在ideogram.ai网站上生成的图片，我尝试过豆包还有其他的免费AI，这个效果我最满意，就以此作为封面了。

#line(length: 100%, stroke: 0.5pt)
#v(3em)

本书的Github地址是：#link("https://github.com/wuqi/Map_Projection/tree/typst")[https://github.com/wuqi/Map_Projection/tree/typst]，欢迎提交Issue，因为翻译本身是AI做的，我没有细致的进行编辑工作，排版已经够麻烦了，可能细节会有些错误，欢迎提出各种问题。

除了折腾了这本书以外，我以前还弄了一些东西，有需要可以看看：

- #link("https://headfirst-gdal.readthedocs.io/en/latest/index.html")[*HeadFirst GDAL*]  (#link("https://headfirst-gdal.readthedocs.io")[https://headfirst-gdal.readthedocs.io]) \
  主要是介绍 GDAL 库操作栅格和矢量数据的指南，不算很新，但是入门没有问题。

- #link("https://gis-career-entry-guide.readthedocs.io/zh-cn/latest/")[*GIS 入行指南*]  (#link("https://gis-career-entry-guide.readthedocs.io")[https://gis-career-entry-guide.readthedocs.io]) \
  介绍 GIS 实际工作中的干货，适合想要快速入行的师弟师妹。


如果觉得这本东西有帮助的话，可以请我喝点奶茶，可乐也行。

// 二维码布局：0.14.2 推荐使用 grid 或 stack 保持稳定
#align(center)[
  #image("../img/qrcode.png", width: 300pt)
]

#v(2em)
#align(right)[
  *wuqi* \
  2026 年 1 月
]
