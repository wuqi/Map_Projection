= 主要投影类型

== 方位投影

=== 引言

给定表面上一个参考点 $A$ 和另外两个点 $B$、$C$，从 $B$ 到 $C$ 的方位角是指最小距离线 $A B$ 和 $A C$（在球面上即测地线或大圆弧）所形成的夹角。换言之，它表示位于 $A$ 点、注视着 $B$ 点的人需要转多少角度才能看到 $C$ 点。从 $A$ 到 $C$ 的方位角（航向角）则是以极点为参考 $B$ 时计算的方位角。
#grid(
  columns: (1fr, 200pt), // 左侧自适应（放文字和Box），右侧固定宽度（放图）
  column-gutter: 2.5em,
  align: top,
  
  // --- 左栏：文字描述 + 灰色 Box ---
  [
    // 原始文字描述
    所有方位投影都能保持从参考点（地图的概念中心）出发的方位角，从而呈现到任意其他点的真实方向（但不一定是距离）。它们也被称为平面投影，因为其中许多投影可以直接通过透视投影到平面得到。这种命名方式略有误导性，因为所有重要的地图投影——无论是否方位、是否透视——最终都会产生平面地图。


    // 灰色 Box
    #block(
      fill: luma(248),
      stroke: 0.5pt + gray,
      inset: 15pt,
      radius: 4pt,
      width: 100%,
      [
        #set align(center)
        #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 11pt, weight: "bold")[透视方位投影的光线路径]
        #v(0.5em)
        #text(size: 0.9em)[选定透视方位投影的示意截面图。红色光线将地球可见的淡蓝色表面“投射”至蓝色投影平面。]
        #v(1em)
        
        #grid(
          columns: (1fr, 1.5fr, 1fr), // 3列排版
          column-gutter: 0.8em,
          row-gutter: 1.2em,
          [ #figure(image("../../img/image_1623807910963_0.png", width: 100%), caption: [正射投影]) ],
          [ #figure(image("../../img/image_1623807939183_0.png", width: 100%), caption: [球面投影]) ],
          [ #figure(image("../../img/image_1623807977050_0.png", width: 100%), caption: [球心投影]) ],
          [ #figure(image("../../img/image_1623808009772_0.png", width: 100%), caption: [垂直透视（近侧）]) ],
          [ #figure(image("../../img/image_1623808034965_0.png", width: 100%), caption: [垂直透视（远侧）]) ],
          [ #figure(image("../../img/image_1623808052799_0.png", width: 100%), caption: [倾斜透视（非方位）]) ]
        )
      ]
    )
  ],

  // --- 右栏：两张对比图 ---
  [
    #figure(
      image("../../img/image_1623807323969_0.png", width: 100%),
      caption: [方位角 $alpha$ 保持不变示意。由于裁剪和重定中心，地图中心未必与投影中心重合。]
    ) <fig-azimuth-alpha>
    
    #v(2.5em)
    
    #figure(
      image("../../img/image_1623807337706_0.png", width: 100%),
      caption: [相同比例尺下选定方位投影极地方位对比，纬线间距 10°。]
    ) <fig-polar-comparison>
  ]
)


极地方位对于方位投影而言易于构建：其中一个极点作为中心点，使坐标网非常简洁：
- 经线为直线，从中心点呈放射状均匀分布
- 纬线为以中心点为圆心的完整圆环
- 不同投影仅通过纬线间距区分

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 15pt,
  radius: 4pt,
  width: 100%,
  [
    #set align(center)
    #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[正射投影地图在不同方位下的示例]
    #v(1em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 15pt,
      [ #figure(image("../../img/image_1623808578645_0.png", width: 100%), caption: [南极方位]) ],
      [ #figure(image("../../img/image_1623810564991_0.png", width: 100%), caption: [斜轴方位（坎皮纳斯）]) ],
      [ #figure(image("../../img/image_1623810606801_0.png", width: 100%), caption: [横轴赤道方位（W 110°）]) ],
      [ #figure(image("../../img/image_1623810626335_0.png", width: 100%), caption: [赤道方位（E 70°）]) ]
    )
  ]
)

在任何方位下，所有经过中心点的直线都是测地线，变形仅取决于与该点的距离，在中心点处变形为零。少数*两点方位投影*能从两个特定位置而非一个位置呈现正确角度。

方位地图能快速显示从中心点到任何地方的方向，而*反方位投影*则具有相反特性：显示从任意位置转向中心点的正确方向。

=== 经典（透视）方位投影

在最古老的投影中，有三种方位设计由纯几何透视构造定义。它们都无法呈现整个地球，通常被裁剪至一个半球或更小范围。

==== 正射方位投影

希腊天文学家希帕克斯在公元前 2 世纪提及（可能更早已知），托勒密称之为日晷投影，其现代名称由德艾吉永（1613 年）确定。该投影主要用于展示目的（有时效果显著），因为它清晰地呈现了从无限远处观察地球的视觉效果，与学生观看地球仪的视角高度吻合。地图边缘严重的形状和面积变形限制了其世界地图的通用性：径向比例尺急剧减小导致特征难以辨认。另一方面，对于任何以投影中心为圆心的圆（如极地方位中的纬线），比例尺完全准确。

现代地图集中正射地图的使用主要限于插图。然而，太空时代提供了月球、其他行星以及从轨道观测地球的高质量图像，使该投影近期重新受到关注。正射地图的几何构造易于解释，并可与其他方位投影进行比较。

==== 球面方位投影

这可能是使用最广泛的方位投影，其极地方位自古希腊时期已知，通常归功于希帕克斯；托勒密称之为平面天球图，德艾吉永（1613 年）命名为球面投影。但其使用长期限于星图；世界地图的应用始于近代。需注意，地图学中的球面投影不可与用于立体影像的“立体投影”技术混淆。（后者通过合成两张图片模拟三维视觉深度，这与高空照片的制图和分析密切相关）

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  [
    #set text(font: ("LXGW WenKai Mono", "KaiTi"), size: 9pt)
    #set par(first-line-indent: 0pt, leading: 0.6em)

    #align(center)[
      #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[球面半球投影地图]
      #v(0.8em)
    ]

    方位球面投影的不同方位展示其等角特性：随着方位变化“移动”大陆位置，远离中心的区域会放大，但局部角度保持不变——经纬线始终以直角相交的圆形呈现。
    
    #v(1em)

    #grid(
      columns: (1fr, 1fr),
      gutter: 12pt,
      [ #figure(image("../../img/image_1623812624077_0.png", width: 100%), caption: [赤道方位，中央经线西经 110°]) ],
      [ #figure(image("../../img/image_1623812651576_0.png", width: 100%), caption: [赤道方位，中央经线东经 70°]) ],
      [ #figure(image("../../img/image_1623812753404_0.png", width: 100%), caption: [一种斜轴方位]) ],
      [ #figure(image("../../img/image_1623812766655_0.png", width: 100%), caption: [另一种斜轴方位]) ],
    )
  ]
)

在方位设计中，球面投影是唯一的等角投影：在小区域内，地图上的角度与地球表面相应角度相同。它还保持圆的形状（无论大小），但球面上的同心圆在地图上通常不再同心。另一方面，恒向线被绘制为对数螺旋线。

球面方位投影有简单的几何解释：从一个点发出的光线穿透地球表面，照射在过该点对跖点的切平面上。得到的是地图的背面，覆盖整个平面；靠近光源点的区域位于无限远处，该点本身无法映射。

由于与正射方位投影相反，远离地图中心的比例尺被极度拉伸，球面方位地图通常被限制在对跖半球或更小区域。作为“经典”等角投影之一，球面投影也被修改用于椭球体情况；等角性得以保持，但结果不再严格方位或保圆。这种形式也是 UTM 坐标网格的辅助部分。

==== 球心投影
球心投影（亦称中心投影、方位中心投影）的构造与球面方位投影类似，但光源位于球心；因此一次只能显示不到一个半球。除切点附近外，距离和形状变形显著。该投影最重要的特性是每条测地线（包括赤道和所有经线）都被映射为直线，便于找到任意两点间的最短路径（但不指示行进方向）。

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  align(center)[ #figure(image("../../img/image_1623815520811_0.png", width: 70%), caption: [球心投影地图（赤道方位），从中心截取 70° 范围]) ],
  align(center)[ #figure(image("../../img/image_1623815537559_0.png", width: 70%), caption: [斜轴方位：赤道与所有经线保持为直线]) ]
)

==== 通用垂直透视投影
通用垂直透视投影是一种方位投影，可由汇聚于通过地心且垂直于投影平面（通常与地表相切）的直线上任意天顶点的直线定义。作为透视投影，对于地球上每个点，通过它的直线与平面相交即定义其投影点。该投影由汇聚点与地心的距离参数化；它是正射、球面和球心投影的通式，其本身也是斜向（或倾斜）透视投影的极限情况（后者不要求投影平面垂直于汇聚线，且不一定方位）。

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  [
    #set text(font: ("LXGW WenKai Mono", "KaiTi"), size: 9pt)
    #set par(first-line-indent: 0pt, leading: 0.6em)

    // 第一部分：左文右双图
    #grid(
      columns: (1fr, 0.8fr),
      gutter: 12pt,
      align: horizon,
      [
        #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[近侧透视地图模拟太空视角]
        #v(0.5em)
        地球曲率和观察者 $V$ 离地表向天顶 $Z$ 的高度决定了可见角范围 $A$ 和地平圈 $H$，超出地平圈的表面无法被观测。下面的垂直近侧透视图片由一架从赤道附近、亚马孙河口假设基地垂直起飞的假想火箭搭载的后视相机拍摄处理。在这个无云的日子里，整个轨迹奇迹般地保持在发射点正上方垂直。原始卫星图像来自 NASA 的“新一代蓝色弹珠”项目。

      ],
      // 右侧两张小图也按 80% 缩放居中
      grid(
        columns: (1fr, 1fr),
        gutter: 4pt,
        align(center)[#image("../../img/image_1623823437728_0.png", width: 80%)],
        align(center)[#image("../../img/image_1623823442763_0.png", width: 80%)],
      )
    )

    #v(1em)
    #line(length: 100%, stroke: 0.5pt + silver)
    #v(1em)

    // 第二部分：下方案例 2x3 网格，图片 80% 宽度并居中
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 10pt,
      row-gutter: 20pt,
      
      // 使用函数简化重复结构
      ..([
        #align(center)[#image("../../img/image_1623823577713_0.png", width: 80%)]
        #v(4pt)
        在 10 公里高度，地平线将视野限制在天顶 3°12' 范围内。
      ],
      [
        #align(center)[#image("../../img/image_1623824068685_0.png", width: 80%)]
        #v(4pt)
        距地面 100 公里处，视野扩大至 10°5'，天际线显得明显压缩。
      ],
      [
        #align(center)[#image("../../img/image_1623824098506_0.png", width: 80%)]
        #v(4pt)
        轨道高度约 330 公里。此处的宇航员视野不超过天顶 18°3'。
      ],
      [
        #align(center)[#image("../../img/image_1623824129088_0.png", width: 80%)]
        #v(4pt)
        在 590 公里处，若可观测地球，其可见角范围约为 23°45'。
      ],
      [
        #align(center)[#image("../../img/image_1623824163169_0.png", width: 80%)]
        #v(4pt)
        在 35,786 公里的地球同步轨道，可见角达 81°18'。
      ],
      [
        #align(center)[#image("../../img/image_1623824252911_0.png", width: 80%)]
        #v(4pt)
        在月球高度 378,000 公里处，可见范围达 89°3'，几乎与正射投影无异。
      ]).map(content => align(center, content)) // 统一让文字也居中对齐
    )
  ]
)

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  [
    #set text(font: ("LXGW WenKai Mono", "KaiTi"), size: 9pt)
    #set par(first-line-indent: 0pt, leading: 0.6em)

    #align(center)[
      #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[远侧垂直透视地图]
      #v(1em)
    ]

    #grid(
      columns: (1fr, 1fr),
      gutter: 12pt,
      align(center)[ #figure(image("../../img/image_1623824763970_0.png", width: 75%), caption: [拉伊尔北半球投影]) ],
      align(center)[ #figure(image("../../img/image_1623824770116_0.png", width: 75%), caption: [H.詹姆斯投影（1857 年）]) ],
      align(center)[ #figure(image("../../img/image_1623824775636_0.png", width: 75%), caption: [詹姆斯与克拉克投影（1862 年）]) ],
      align(center)[ #figure(image("../../img/image_1623824780980_0.png", width: 75%), caption: [克拉克的“暮光”投影]) ],
    )
  ]
)


与方位投影常见情况相同，远离中心点处的形状和面积变形较大；对于切平面，仅在中心点变形为零。地图既不等角（球面投影特例除外）也不等积。

通用透视投影分为两类：当汇聚点位于绘图表面“上方”时为“近侧”，位于“下方”时为“远侧”。前者再现了从空中或太空垂直向下看到的景象，以圆形地平线为界，其范围受地球曲率限制；随着天顶点距离趋于无穷，可见角范围最大可达90°（整个半球），此时即为经典的正射投影。相反，远侧类型通常显示一个多半球；可见角范围随距离增加而缩小；无穷远处的极限情况同样为正射投影。与球面投影类似，投影光线首先“看到”地球的内表面。


虽然近侧通用垂直透视地图长期以来仅用于模拟太空视角，但远侧变体被多位学者采纳，他们根据任意准则选择不同投影距离以最小化整体变形。最著名的远侧透视投影包括菲利普·德·拉伊尔（1701年，距离1.707倍地球半径）、亨利·詹姆斯（1857年，距离1.5倍）和亚历山大·R·克拉克（1862年与詹姆斯合作，距离1.368倍；1879年改为1.4倍，即其更著名的“暮光”投影）。拉伊尔的极地地图中沿经线比例尺非线性，但北纬45°纬线的半径恰好是赤道半径的一半。不久后（1702年）安托万·帕朗提出了三种不同距离以分别最小化距离或面积误差。詹姆斯和克拉克更倾向于采用割平面和斜轴方位以呈现大部分大陆，同时将可见角范围裁剪至实际可显示值以下：詹姆斯为113°30'，“暮光”投影为108°；113°30'等于天顶到可见地平线的90°加上黄赤交角23°30'；108°则等于90°加上定义天文暮光的18°地平下角。

=== 非透视方位投影

与“经典”正射、球面和球心设计不同，等距方位和等积方位等投影是通过数学推导而非实际透视过程得到的。两者都能映射整个球体，形成由“内”半球和环状“外”半球组成的结构。但为减小整体变形，外半球常以对跖点为中心单独呈现。

==== 等距方位投影

能以单幅地图呈现整个地球，且具有恒定径向比例尺（距离从投影中心线性增加）。该投影因其重要特性将在别处详细讨论。北极方位等距投影因作为联合国组织旗帜和徽章的一部分（用橄榄枝取代南极洲）而广为人知。图中南极大陆“内外翻转”展示了该投影在远离中心区域对形状和面积的极端变形。构造简单，该投影有时被裁剪至单一半球，并常用于极地插图中。

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  [ #figure(image("../../img/image_1623825849844_0.png", width: 80%), caption: [等距方位投影，北极方位]) ],
  [ #figure(image("../../img/image_1623825896736_0.png", width: 80%), caption: [等距方位投影，赤道方位]) ]
)

==== 兰伯特等积方位投影

与表面相似的等距方位投影一样，约翰·H·兰伯特 1772 年发表的方位投影在全球地图边界处强烈扭曲形状。但径向比例尺并非常数：在极地方位中，纬线向边缘逐渐靠近，恰好足以保持面积。构造相对简单，该投影在所有方位中常用。其极地方位由安东尼奥-马里奥·洛尔尼亚（1789 年）独立提出，曾短暂以其命名。

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  [
    #set text(font: ("LXGW WenKai Mono", "KaiTi"), size: 9pt)
    #set par(first-line-indent: 0pt, leading: 0.6em)

    #align(center)[
      #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[等积方位投影地图]
      #v(0.8em)
    ]

    #grid(
      columns: (1fr, 1fr),
      gutter: 12pt,
      [ #figure(image("../../img/image_1623833574736_0.png", width: 100%), caption: [北极方位]) ],
      [ #figure(image("../../img/image_1623833613605_0.png", width: 100%), caption: [赤道方位，中央经线东经 5°]) ],
      [ #figure(image("../../img/image_1623833636149_0.png", width: 100%), caption: [西半球，中央经线西经 110°]) ],
      [ #figure(image("../../img/image_1623833673229_0.png", width: 100%), caption: [东半球，中央经线东经 70°]) ],
    )
  ]
)

==== 金兹堡修正方位投影

1949 年，苏联地理学家乔治·A·金兹堡为学校地图提出了两种半球方位投影。由于兰伯特等积投影压缩了从地图中心出发的距离，导致边缘区域形状变形显著，金兹堡在兰伯特方程中加入幂次项，轻微扩展了地图范围。结果既不等角也不等积。

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  [
    #set text(font: ("LXGW WenKai Mono", "KaiTi"), size: 9pt)
    #set par(first-line-indent: 0pt, leading: 0.6em)

    #align(center)[
      #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[金兹堡方位投影地图]
      #v(0.8em)
    ]

    #grid(
      columns: (1fr, 1fr),
      gutter: 10pt,
      [ #figure(image("../../img/image_1623834578761_0.png", width: 70%), caption: [金兹堡 I 型，北极方位]) ],
      [ #figure(image("../../img/image_1623834583526_0.png", width: 70%), caption: [金兹堡 I 型，赤道方位（东经 70°）]) ],
      [ #figure(image("../../img/image_1623834588468_0.png", width: 70%), caption: [金兹堡 II 型，北极方位]) ],
      [ #figure(image("../../img/image_1623834594531_0.png", width: 70%), caption: [金兹堡 II 型，赤道方位]) ],
    )
  ]
)

#v(1em)

#figure(
  image("../../img/image_1623834528160_0.png", width: 50%),
  caption: [底索变形椭圆对比图：显示在相同比例尺下，金兹堡等积投影与兰伯特等积投影绘制同一半球时的变形差异。]
) <fig-tissot-comparison>
