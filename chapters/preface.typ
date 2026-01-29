#let preface_style(body) = {
  set text(font: ("Zhuque Fangsong (technical preview)", "FangSong"), size: 10.5pt)
  set par(first-line-indent: 2em, leading: 1.0em, justify: true)
  body
}

#show: preface_style

= 译序 <preface>

地图投影是个很复杂的东西，网上和书本上能讲清楚的不多，这块涉及到很多数学原理和制图相关知识，枯燥而且繁复。

以前网络上有一个很好的教程，《Cartographical Map Projections》，作者是 Carlos A. Furuti。作者其实不是一个专业的制图师，是一个系统分析师，精通软件开发、语言、图形界面、和计算机图形学。但是这篇教程图文并茂，特别详细，但是从 19 年开始网站没有维护，已经无法访问了。

大概四年前，我从 #link("https://archive.org")[archive.org] 上把老版本的介绍下载了下来，进行翻译和整理，成果在 #link("https://wuqi.github.io/Map_Projection")[wuqi.github.io/Map_Projection/] 上，当时用的也是机翻加上人修，当时的翻译软件水平有限，我本人英语也不咋地，整体翻译的比较烂，现在想抽时间对翻译进行修正，希望对大家有所帮助。

说是翻译整理，实际也就是先机翻再改改，以前有不少偏差和翻译错误，所以只能说是能读懂，距离通顺都有不少距离。如今 AI 翻译已经趋于成熟，而且正好赶上 Affinity Studio 软件免费，现在Typst看起来也日趋成熟，至少比 LaTeX 简单些,我想把这一整套的东西整理成一本书，来练练手。现在还没有确定是直接用 Affinity 还是用 Typst。

之前用的是 Markdown 格式，直接用 Docsify 来实现的排版，说不上丑，但是排版效果确实一般，现在想试试做成一本书，做的好看点，想深入排版试试水，顺便学点东西。

下面介绍一下整体的构想：

首先第一部分，是对原文进行整体的翻译，完整的介绍制图学中应用的地图投影。其实这套教程整体结构上编排的不是那么严谨，部分地方有点混乱，但是绝对算得上易懂，因为到处都是插图，介绍到概念的地方都有对应投影的介绍，不像普通的地图投影教程，翻过去满眼公式，我买过一本书，结果。原文全文是第一人称，翻译中我就仍然不做修改。这整套教程里，主要内容如下:

  - 投影的基础知识
  - 投影推导方式
  - 主要投影的介绍以及历史
  - 应对形变做的各种努力
  - 关于投影的一些逸闻趣事 

#h(2em)第二部分中，是我自己在实践中碰到的一些地图投影知识的总结，主要包括：

  - 地理坐标系的解释
  - 工作中碰到的投影相关知识
  - WKT-CRS 对投影的描述以及 WKT-CRS 的一些小知识
  - 在实践中碰到的各种疑惑以及对应的解释 

#h(2em)增加这些，主要是为了介绍一些工作中容易遇到的坑，一是做个记录，二是方便后人。

如果觉得这本东西有帮助的话，可以请我喝点奶茶，可乐也行。

#v(2em)

// 二维码布局：0.14.2 推荐使用 grid 或 stack 保持稳定
#align(center)[
  #grid(
    columns: (auto, auto),
    column-gutter: 50pt,
    [
      #image("../img/alipay.png", width: 100pt)
      #v(0.5em)
      #set text(size: 9pt)
      支付宝
    ],
    [
      #image("../img/weixin.png", width: 100pt)
      #v(0.5em)
      #set text(size: 9pt)
      微信
    ]
  )
]

#v(2em)
#align(right)[
  *wuqi* \
  2026 年 1 月
]
