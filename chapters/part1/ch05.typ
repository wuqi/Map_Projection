
= 投影的工作原理

== 投影的实质

地图投影的实质是什么？制图者依据何种规则确定海岸线在图上的位置？如何定义从球面坐标到平面点的映射关系（数学上即为两组数值间的转换）？应如何评估这种转换的优劣？

#strong[“透视”投影与“算法”投影]

方位投影、圆柱投影和圆锥投影中的某些类型具有直观的几何解释：可视为光线自光源发出，照射地球，并依据透视法则在地图表面“绘制”其特征。该表面可为平面（直接生成地图），亦可为圆柱面或圆锥面等中间曲面。

然而，许多投影仅间接源自几何原理。例如，墨卡托圆柱投影无法以透视过程直观呈现，除非满足以下非寻常条件：

+ 光线沿非直线轨迹传播；
+ 光源非点或线状；
+ 投影面非简单圆柱面。

在上述任一情况下，透视模型均因过于复杂而失去实用价值。

事实上，众多投影完全不具备几何或物理解释，仅通过数学公式进行描述。即制图者依据某些预期特性或约束条件，设计出球面至平面的映射关系。

=== 正向与逆向公式

无论是否基于透视原理，投影均可由两组映射方程定义：

- #strong[正向（直接）关系]：将极坐标（经度 $lambda$、纬度 $phi$、地球半径 $R$ 或椭球体等效值）转换为笛卡尔坐标（横坐标 $x$、纵坐标 $y$）。
- #strong[逆向关系]：执行相反的转换。
#v(0.5em)
#grid(
  columns: (1fr, 2fr),
  gutter: 20pt,
  [
    此类关系通常并非函数，因球面上同一点可能对应地图上多个位置。除笛卡尔坐标外，亦可使用平面极坐标（半径 $rho$、角度 $theta$），这对许多投影的表达更为简便。
  ],
  figure(
    image("../../img/image_1623467215794_0.png", width: 100%),
    caption: [由映射关系定义的坐标变换]
  )
)

尽管本文未全面展开，逆向映射使得根据地图点位或航摄/卫星影像推算地理位置成为可能。因此，它在多种应用中至关重要，例如交互式地图系统（用户点击地图时，系统依据该处地理参照信息作出响应）。同时，逆向映射对重投影（将已投影地图转换为其他投影）以及不同地理数据库间的转换亦不可缺。

=== 投影公式的推导

即便对数学无特别兴趣，理解若干投影公式亦能增进对地理科学的认识；读者亦可选择跳过此节，直接阅读主要投影类型介绍。

后续章节将简要阐述几种投影映射公式的推导过程：

- #strong[正射方位投影]：纯几何投影，仅需基础三角学即可计算。
- #strong[布劳恩及其他球面圆柱投影]：任意几何投影。
- #strong[卡夫拉伊斯基 VII 型投影]：表述简洁的折衷投影。
- #strong[桑逊-弗兰斯蒂德（正弦）投影]：仅需简单三角学的简明实用算法投影。
- #strong[克拉斯特抛物线投影]：需运用积分求解的三次方程有趣案例。
- #strong[摩尔魏特投影]：略复杂的投影，需借助数值分析方法。
- #strong[两种非透视方位投影]（等距与等积），涵盖极地与赤道方位。
- #strong[等距圆柱投影]：极为简单的任意投影及其两种混合衍生型——温克尔 I 型（广义埃克特 V 型）与 II 型。
- #strong[艾托夫、哈默和温克尔三重投影]：源自方位与圆柱投影的衍生型。

除温克尔、卡夫拉伊斯基 VII 型及（取决于推导方法的）桑逊-弗兰斯蒂德投影外，其余投影的地图形状均预先定义；后三者的形状是其投影约束条件的结果。仅摩尔魏特、克拉斯特、方位等积及温克尔衍生投影需运用基础微积分、数值方法或二者结合。

=== 若干约定

在制图数学中，所有角度（包括经纬度）采用弧度制比度分秒制更为实用，因为圆弧长度（即大圆距离）可直接通过半径与弧度值的乘积计算。例如，$180^degree$ 平角等于 $pi$ 弧度；所有北纬 $60^degree$ 与南纬 $60^degree$ 的点位距赤道均为  $(R pi) / 3$ 单位。约定北纬与东经为正角度；例如南纬 $45^degree$ 表示为 $-pi / 4$。

正向与逆向映射均需设定#strong[比例因子]，该因子决定但不等同于地图比例尺：比例因子为常数，而地图比例尺必然随点位与方向变化。本文公式中的比例因子以常数 $R$ 表示，其为地球实际半径的一个非负小数倍。

== 正射方位投影的推导

纯几何的正射方位投影可通过物理模型完整呈现。本文以北极半球为例，阐述其极地方位的推导过程。

=== 物理模型阐述

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    #v(1em)
    假设地球静止于一个与赤道平面平行的平面上。光线从南北极轴线上无限远处发出，穿透半透明的北半球，将其地表特征“投射”至该平面。在此模型中，南半球被视为完全透明。

  ],
  figure(
    image("../../img/image_1623483854543_0.png", width: 100%),
    caption: [正射方位投影几何结构的两种完全等效示意图。]
  )
)

    
亦可设想观察者位于该轴线的无限远处。地球表面发出的平行光线照射在垂直于光线的平面上，形成影像。由于所有光线平行（即透视方式为“圆柱投影”），无论该平面是否与球面相切，结果均不受影响。但需注意，任意时刻仅能观测到一个半球。

通过调整光源位置，可生成其他类型的透视方位投影。在实际制图中，可于玻璃地球仪或球面容器上绘制海岸线等地理要素，借助反射日光或特定距离的强光源，将地球影像直接投射至墙面，从而获得正射、球面等多种方位投影。

=== 几何推导过程



#grid(
  columns: (1fr, 2fr),
  gutter: 20pt,
  [
    //#set math.equation(block: true, numbering: none)
    #show math.equation.where(block: true): set align(left)

    从几何角度，正射方位投影可理解为将极坐标转换为三维笛卡尔空间中的点，再通过忽略某一坐标实现“平面化”。对于地表任意点 $P$，其在极坐标系中的正向方程可推导如下：

    $ w = R cos(phi) = rho $
    $ theta = lambda $

   （其中仅当 $phi >= 0$（北极视角）或 $phi <= 0$（南极视角）时点 $P$ 可见）

  ],
  figure(
    grid(
      columns: (1fr, 1fr),
      gutter: 5pt,
      image("../../img/image_1623484138331_0.png", width: 100%),
      image("../../img/image_1623484143890_0.png", width: 100%),
    ),
    caption: [位于东经 $75^degree$、北纬 $55^degree$ 的点 $P$，通过方位投影的极地方位进行映射。]
  )
)

转换为笛卡尔坐标形式：

$ x = R cos(phi) sin(lambda) $
$ y = R cos(phi) cos(lambda) $

#v(1em)
逆向映射方程的推导同样直接。

=== 通用方位拓展

#grid(
  columns: (3fr, 5fr),
  gutter: 20pt,
  // 左侧插图
  figure(
    image("../../img/image_1623485104932_0.png", width: 100%),
    caption: [最终生成的地图。]
  ),
  // 右侧文字
  [
    要获得赤道方位或斜轴方位等更一般的投影形式，可先对地球坐标进行三维空间旋转变换，再应用上述极地方位方程。在数字计算机普及前，制图者通过先绘制极地方位坐标网，据此确定赤道方位的纬线位置，最终借助多组平行线标注的关键坐标网交点，构建出斜轴方位的坐标网。
  ]
)

== 布劳恩及其他球面圆柱投影的推导

=== 布劳恩投影

#figure(
  image("../../img/image_1623486653474_0.png", width: 80%),
  caption: [布劳恩球面圆柱投影地图]
)

#grid(
  columns: (4fr, 1fr), // 保持左框右文 2:1 的比例
  gutter: 20pt,
  // 左侧 Box
  block(
    fill: luma(248),
    stroke: 0.5pt + gray,
    inset: 12pt,
    radius: 4pt,
    [
      #set text(font: ("LXGW WenKai Mono", "KaiTi"), size: 9pt)
      #set par(first-line-indent: 0pt, leading: 0.6em)
      
      // 内部 Grid：两张图及其描述水平排列
      #grid(
        columns: (2fr, 1fr),
        gutter: 15pt,
        [
          #image("../../img/image_1623486171619_0.png", width: 100%)
          #v(0.5em)
          布劳恩球面圆柱投影的构建过程图示：左侧东半球已展开，光线穿透半透明地球仪绘制出地图右侧边缘。位于赤道的光源绕极轴旋转。
        ],
        [
          #image("../../img/image_1623486479675_0.png", width: 100%)
          #v(0.5em)
          地球仪与切投影面示意图。该地图的高度为地球仪直径的两倍。
        ]
      )
    ]
  ),
  // 右侧文字
  [
    C.布劳恩提出的球面圆柱投影虽可通过几何模型呈现，但其复杂程度高于前述正射方位投影。该投影不直接采用平面作为投影面，而是使用一个与赤道紧密贴合的圆柱面。
    
    每条经线由其对跖经线赤道点发出的光线投射至该圆柱面形成。随后沿任意经线剖开圆柱面并展平，即可获得平面地图。


  ]
)

需指出，类似的圆柱投影构建方法虽存在，但并非所有圆柱投影均基于此类简单模型。事实上，墨卡托投影与等距圆柱投影等经典投影是通过特定数学约束定义，而非基于透视过程。

=== 正轴方位映射方程推导

正轴方位的直接映射方程推导如下。考虑将地球表面点 $P$ 投影至地图点 $P'$。根据圆柱投影的共性，在此方位下经线被映射为垂直直线，其间距仅与经度 $lambda$ 成正比，故有：

//#show math.equation.where(block: true): set align(center)
$ x = R lambda $

由纬度 $phi$ 决定的纬线则映射为水平直线。其纵坐标 $y$ 可通过图示比例关系导出：

$ h / (w + R) = y / (2R) $

其中：

$ h = R sin phi, w = R cos phi $

代入得：

$ y = (2R sin phi) / (1 + cos phi) $

令 $theta = phi / 2$，并运用三角恒等式：

$ sin(2theta) = 2 sin theta cos theta; cos(2theta) = 1 - 2 sin^2 theta $

在 $-pi / 2 <= phi <= pi / 2$ 范围内，纵坐标可简化为：

$ y = (2R dot [2 sin theta cos theta]) / (1 + (1 - 2 sin^2 theta)) = (4R sin theta cos theta) / (2(1 - sin^2 theta)) = 2R tan theta $

因此投影方程为：

$ x = lambda R $
$ y = 2R tan(phi / 2) $

逆向映射方程可通过相应逆运算求得。


=== 高尔球面投影及其变体

在布劳恩投影中，圆柱面与赤道相切，赤道即标准纬线。上述推导可推广至任意标准纬线 $phi_0$，仅需将圆柱半径调整为 $R cos phi_0$。若采用割圆柱面，比例关系修正为：

$ (R sin phi) / [R(1 + cos phi)] = y / [R(1 + cos phi_0)] $

由此得到如高尔球面投影（$phi_0 = 45^degree$）与 BSAM 圆柱投影（$phi_0 = 30^degree$）的通用方程：

$ x = R cos phi_0 dot lambda $
$ y = R (1 + cos phi_0) tan(phi / 2) $

=== 广义形式：伪墨卡托投影与中心圆柱投影

进一步推广可将光源位置从赤道点（距极轴 $R$）调整至距离 $k R$ 处。保留三角函数形式的方程为：

$ x = R cos phi_0 dot lambda $ 
$ y = (R (k + cos phi_0) sin phi) / (k + cos phi) $

其中两个典型特例为：布劳恩伪墨卡托投影（$k = 0.4$）与中心圆柱投影（$k = 0$），两者标准纬线均为 $phi_0 = 0^degree$。

#v(1em)

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 15pt,
  radius: 4pt,
  width: 100%,
  [
    #set align(center)
    #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[形状与面积的权衡：制图学的根本命题]
    #v(0.8em)
    
    #set align(left)
    #set text(font: ("LXGW WenKai Mono", "KaiTi"), size: 9pt)
    #set par(first-line-indent: 0pt, leading: 0.6em)

    所有圆柱投影的核心区别在于垂直比例尺，在赤道方位下表现为纬线间距的分布。多数此类投影（如布劳恩与高尔球面投影）的设计均使纬线间距向两极递增。其原因何在？

    #grid(
      columns: (1fr, 1fr),
      gutter: 15pt,
      [
        
        观察一系列具有固定“宽度”与“高度”（如 $10^degree$）的经纬网格单元：在地球表面，这些单元在赤道附近近似方形，但随着纬度升高逐渐变窄，至极点处成为极细的球面三角形。圆柱投影的本质决定其无法缩窄单元宽度，只能通过垂直拉伸进行近似。特别地，墨卡托投影的拉伸量经精确计算以完全保持局部角度，这导致两极被映射至无穷远处。

        垂直拉伸必然加剧圆柱投影中高纬度地区固有的面积夸张。与之相对，兰伯特等积圆柱投影及其变体通过压缩而非拉伸纬度来保持面积不变，但形状保真度因此显著受损。此类取舍贯穿于地图投影设计的始终。

        选取的 $10^degree$ 经纬网格单元清晰显示：多数圆柱投影通过向两极方向增加高度（进而扩大面积）以更好地保持形状。布劳恩投影的夸张效应已较明显，但较之墨卡托投影仍显克制。
      ],
      figure(
        image("../../img/image_1623489249091_0.png", width: 100%),
        caption: [以相同比例尺绘制的斜轴正射方位投影地图叠加于部分布劳恩球面圆柱赤道投影地图之上。]
      )
    )
    
    #v(0.5em)
    
  ]
)

== 卡夫拉伊斯基 VII 型投影推导

#strong[定义解析]

考量卡夫拉伊斯基（Kavrayskiy/Kavraisky）VII 型投影。在赤道方位下，该投影可描述为：#strong[伪圆柱投影、极线长度为赤道之半、纬线等距、120° 经线位于地图中心的圆周上]。其具体涵义如下：

- #strong[1. 伪圆柱投影特性]
  - 在赤道方位中，所有纬线呈现为水平直线，经线则为任意曲线。

- #strong[2. 极线长度设定]
  - 根据定义，伪圆柱投影的极点可为点或直线（“极线”）。相较于“尖极”投影，“平极”设计通常能减少高纬度区域的形状变形。多数平极投影采用简单的极线/赤道长度比例，如 1/2 或 1/3。

- #strong[3. 等距纬线特性]
  - 除个别特例外，等积伪圆柱投影的纬线间距通常可变；而非等积的卡夫拉伊斯基 VII 型投影采用恒定纬线间距。需注意，这并不意味着沿经线方向的比例尺恒定或均匀。若无额外约束，设定 $y = phi R$ 将使中央经线成为唯一的标准线。

- #strong[4. 120° 经线的圆周约束]
  - 在任何伪圆柱投影中，沿同一纬线的比例尺恒定。因此，除中央经线（此处定义为 $0^degree$）保持笔直外，所有经线形态相似且形状受经度影响。在本投影中，若 120° 经线（即 $2 pi / 3$）为圆弧，则其余经线（除中央经线外）均为椭圆弧——其曲率向中央经线方向渐趋扁平，向地图边界方向逐渐伸长。

// 延续您的 project 模板环境

=== 公式推导过程

#show math.equation.where(block: true): set align(left)
#show math.equation.where(block: true): it => pad(left: 4em, it)

#grid(
  columns: (1fr, 1fr), // 左侧文字占剩余空间，右侧图片固定宽度
  column-gutter: 1em,
  [
    #v(1em)
    现考虑卡夫拉伊斯基 VII 型投影的东北象限。令 $W$ 为极线长度的一半，$H$ 为极线至赤道的距离；根据等距特性，$H = R pi / 2$。对于给定纬度 $lambda$，令 $x_c$ 为圆形 120° 经线的横坐标，$x_b$ 为 180° 经线（即基本边界经线）的横坐标。

    由于在伪圆柱投影中，各纬线上真实距离与横坐标成线性关系，因此 $x_b$ 及任意纬度下的通用横坐标 $x$ 均与 $x_c$ 成比例：

      $ x_b = 180 / 120 x_c = 3  / 2 x_c $
      $ x =  lambda / pi x_b $
  ],
  [
    #set align(center)
    #figure(
      image("../../img/image_1623491472605_0.png", width: 100%),
      caption: [卡夫拉伊斯基 VII 型投影地图（东北象限）],
    )
  ]
)




参考圆的半径 $4W/3$ 由此直接得出。根据勾股定理：

  $ H^2 + ((2W)/3)^2 = ((4W)/3)^2 $ 

  $ H^2 = (16W^2 - 4W^2) / 9 $ 

  $ H = sqrt(4/3) W  $



#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    赤道长度的一半为：

      $ 2W =  sqrt(3) H = R pi sqrt(3) / 2 $
    再次应用勾股定理：

      $ x_c^2 + y^2 = 16W^2 / 9 = pi^2 R^2 / 3 $
      $ y = phi R $
      $ x_c = R sqrt(pi^2 / 3 - phi^2) $
  ],
    figure(
    image("../../img/image_1623493188016_0.png", width: 100%),
    caption: [卡夫拉伊斯基 VII 型投影全图]
  ),
)


最终得到映射方程：

  $ x = 3 lambda R sqrt(pi^2 / 3 - phi^2) / (2 pi) $ 
  $ y = phi R $

=== 投影特征总结

卡夫拉伊斯基 VII 型投影结构简明、易于计算。该投影不具备特殊的数学属性——既不保持形状也不保持面积，其优势在于整体形态均衡协调。对于许多非精密测量用途而言，这种平衡性已能满足实际需要。

== 桑逊-弗兰斯蒂德（正弦）投影的推导

#grid(
  columns: (1fr, 1fr), // 右侧固定宽度给图片
  column-gutter: 1em,
  align: horizon,
  [考虑一种赤道方位的投影，其具备与卡夫拉伊斯基 VII 型投影相似但约束更为严格的特性：
  
  - 伪圆柱投影
  - 所有纬线均为标准线
  - 中央经线为直线标准线

  设地球表面一点 $P$。该点至赤道的距离为 $m = phi R$（此简洁表达式展现了以弧度表示角度坐标的优势），该距离即为投影点的纵坐标。通过点 $P$ 的纬线半径为 $r = R cos phi$，其周长为 $p = 2 pi r$。根据伪圆柱投影的特性，该点的横坐标与此周长的一半成正比，比例系数为 $lambda / pi$。因此，

  $ x = R lambda cos phi $
  $ y = R phi $

  
  ],
  [#figure(image("../../img/image_1623493435626_0.png", width: 100%), caption: "与正弦投影几何相关的球面维度参数")]
)



#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5em,
  align: horizon,
  [
    由此得到一种经典的投影，历史上其发明常被归于多位学者，尤以墨卡托、桑逊与弗兰斯蒂德最为著称。如今，因其经线呈现 $x = k sin(y + pi / 2)$ 的形式（其中 $-1 <= k <= 1$），该投影更普遍地被称为*正弦投影*。

    尽管该投影历史悠久，但其*等积性质*似乎长期未被认识或受到忽略。此现象颇为令人意外，因为正弦投影与球面之间的面积对应关系，可通过卡瓦列里原理或类比于一系列等距圆柱投影地图获得直观理解。以下提供一个基于微积分的非形式化证明。],
  [
    #figure(
      image("../../img/image_1623493860040_0.png", width: 100%),
      caption: [赤道方位的正弦投影地图]
    )
  ]
)

定义球面上一个位于纬度 $phi$ 处的薄环带作为面积微元。已知该环带半径为 $R cos phi$；其厚度（同样因角度采用弧度制表示）为 $R d phi$，故其面积为 $2 pi R^2 cos phi d phi$。令 $S_s$ 表示赤道与纬线 $Phi$ 之间的区域面积：

#block(
  fill: luma(248),
  stroke: 0.5pt + gray,
  inset: 15pt,
  radius: 4pt,
  width: 100%,
  [
    #grid(
      columns: (1fr, 2fr),
      column-gutter: 1.5em,
      // 左侧：第一张图 + 它的描述
      [
        #set align(center)
        #image("../../img/image_1623495007758_0.png", width: 100%)
        #v(0.5em)
        #text(size: 0.85em)[球面与正弦投影地图上沿纬线的对应无穷小面积微元]
      ],
      // 右侧：第二张图
      [
        #set align(center)
        #image("../../img/image_1623495070008_0.png", width: 100%)
      ]
    )
  ]
)


$ S_s &= integral_0^Phi 2 pi R^2 cos phi d phi \
     &= 2 pi R^2 sin phi |_0^Phi \
     &= 2 pi R^2 sin Phi $



在地图上，对应的面积微元为一个水平条带，其宽度由 $lambda = pi$ 确定为：$2 R pi cos(phi)$。其高度为 $d y = R d phi$，其面积为 $2 R^2 pi cos phi d phi$。地图上赤道与纬线 $Phi$ 之间的区域面积 $S_m$ 为：

$ S_m = integral_0^Phi 2 R^2 pi cos phi d phi = 2 pi R^2 sin Phi = S_s $

任意两条纬线所界定“条带”的面积，仅需改变积分限即可计算，且在地球与地图上保持相同。此外，对于给定的条带，其在任意两条经线之间的面积，由于沿所有纬线的比例尺恒定，在地球与地图上也保持相等。因此，由任意两对纬线与经线所界定的对应“网格单元”面积相等。最终，通过组合可知，地球与地图上任何对应区域的面积均保持相等。

== 克拉斯特抛物线投影的推导

假设存在一种赤道方位的尖极等积伪圆柱投影，其边界经线为以赤道为轴的抛物线弧，且赤道长度为中央经线的两倍。



#grid(
  columns: (1.5fr, 1fr),
  column-gutter: 2em,
  align: top,
  [

    由于该投影属于伪圆柱投影，故有：
    $ (partial y) / (partial lambda) = 0 $

    换言之：
    $ y = f(phi) $

    根据对称性，不失一般性地仅考虑东北象限，其中 $0 <= phi <= pi/2, 0 <= lambda <= pi$。对于 $H > 0$，存在以下约束：
    $ 0 <= x' = k y^2 <= 2H $
    $ 0 <= y <= H $
    $ x_b = 2H - x' $
  ],
  figure(
    image("../../img/image_1623499957228_0.png", width: 100%),
    // caption 会自动在下方生成：图 1: 克拉斯特...
    caption: [克拉斯特抛物线投影的图解推导示意图],
    supplement: [图], // 如果你希望显示“图 1”而不是默认的“Figure 1”
  )
)

当 $x_b = 0$ 时，$y = H$，因此 $k = 2/H$，边界经线由下式定义：
$ x_b = 2H - (2y^2) / H $

如正弦投影推导所示，赤道与纬线 $phi$ 之间地球表面面积的一半为 $pi R^2 sin phi$。但此处我们将该等积特性作为约束条件以计算纵坐标 $y$。地图上赤道与任一给定纵坐标 $Y$ 之间区域的一半面积为：

$ S(Y) = integral_0^Y x_b d y = integral_0^Y 2H - (2y^2)/H d y = (2H y - (2y^3)/(3H)) |_0^Y = 2 H Y - (2Y^3) / (3H) $

当 $phi = pi/2$ 时，$Y = H$，且：
$ S = pi R^2 = 2H^2 - (2H^2)/3 = (4H^2)/3 $

因此：$H = (sqrt(3 pi) / 2) R$ 且：
$ x_b = sqrt(3 pi) R - (4 y^2) / (sqrt(3 pi) R) $

故：
$ S(y) = -4 / (3 sqrt(3 pi) R) y^3 + sqrt(3 pi) R y $

求解三次方程 $S(y) - pi R^2 sin phi = 0$：
$ a = -4 / (3 sqrt(3 pi) R) , quad b = 0 , quad c = sqrt(3 pi) R , quad d = -pi R^2 sin phi $

$ Delta &= 18 a b c d - 4 b^3 d + b^2 c^2 - 3 a c^3 - 27 a^2 d^2 \
  &= (16(3 pi)^(3/2) R^3) / (3 sqrt(3 pi) R) - (27 * 16 pi^2 R^4 sin^2 phi) / (9 * 3 pi R^2) \
  &= 16 pi R^2 (1 - sin^2 phi) \
  &= 16 pi R^2 cos^2 phi $

由于 $Delta >= 0$，存在三个实根；然而，因：
$ -27a^2 Delta = -256 cos^2 phi <= 0 $

根式涉及复数表达式。通过代换化为简化三次方程：
$ p = (3a c - b^2) / (3a^2) = (-9 pi R^2) / 4 $
$ q = (2b^3 - 9a b c + 27a^2 d) / (27a^3) = (R^3 sin phi (3 pi)^(3/2)) / 4 $


并应用韦达方法，对于 $k = 0, 1, 2$，根为：

$ t_k = 2 sqrt((-p)/3) cos( (arccos( (3q)/(2p) sqrt(-3/p) ))/3 - (2k pi)/3 ) $

因为：
$ p < 0 $
$ 4p^3 + 27q^2 = 729/16 pi^3 R^6 (sin^2 phi - 1) <= 0 $



#grid(
  columns: (2fr, 1fr),
  column-gutter: 2em,
  [
    三个根均为实数，且 $t_2 <= t_1 <= t_0$。

    通过分析 $S(y)$ 的函数图像可知，所需的最小正根为中间根 $t_1$：

    $ t_1 &= 2 sqrt((-p)/3) cos( 1/3 arccos( (3q)/(2p) sqrt((-3)/p) ) - (2 pi)/3 ) \
        &= sqrt(3 pi) |R| cos( 1/3 arccos( (-sin phi |R|) / R ) - (2 pi)/3 ) \
        &= sqrt(3 pi) R cos( 1/3 arccos(-sin phi) - (2 pi)/3 ) $
  ],
  figure(
    image("../../img/image_1623508055073_0.png", width: 100%),
    caption: [函数 $S(y)$ 的图像],
  )
)



对于 $-pi/2 <= alpha <= pi/2$，有 $arccos(-sin alpha) = alpha + pi/2$，因此：

$ t_1 &= sqrt(3 pi) R cos( (phi + pi/2)/3 - (2 pi)/3 ) \
     &= sqrt(3 pi) R cos( phi/3 - pi/2 ) \
     &= sqrt(3 pi) R sin (phi / 3) = y $

$ x_b &= sqrt(3 pi) R - (4y^2)/(sqrt(3 pi) R) \
      &= sqrt(3 pi) R - 4 sqrt(3 pi) R sin^2 (phi / 3) \
      &= sqrt(3 pi) R ( 1 - 4 sin^2 (phi / 3) ) $

$ x &= lambda / pi x_b \
    &= sqrt(3 / pi) R lambda ( 1 - 4 sin^2 (phi / 3) ) $



#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  [ 
    利用恒等式 $sin^2 alpha = (1 - cos 2 alpha) / 2$，得最终方程：
    $ x = sqrt(3 / pi) R lambda ( 2 cos (2 phi / 3) - 1 ) \
      y = sqrt(3 pi) R sin (phi / 3) $

    以上即为克拉斯特所提出的投影中最广为人知的一种。 
    ],

  figure(
    image("../../img/image_1623509472340_0.png", width: 100%),
    caption: [J.E.E.克拉斯特抛物线投影],
  )
)

=== 与正弦投影的对比
#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  [
    正弦投影与抛物线投影的整体形状易于混淆，但存在以下差异：
    - 在相同比例尺下，正弦投影更高且更宽。
    - 抛物线投影的中央经线不是标准线。
    - 在高纬度区域，抛物线投影的变形区域略小。
  ],
  figure(

        grid(
          columns: 1,
          row-gutter: 1em,
          image("../../img/image_1623509544326_0.png", width: 100%),
          image("../../img/image_1623424424876_0.png", width: 100%),
        ),
        caption: [克拉斯特抛物线投影（左上及右下象限）与正弦投影的变形模式对比],
        supplement: [图],
      )
)

== 摩尔魏特投影的推导

尽管前述正弦投影（桑逊-弗兰斯蒂德投影）具有等积性、数学形式简单且纬线等距的优点，但由于高纬度区域剪切变形过甚且经线过于密集，其表现尚未臻完善。克拉斯特抛物线投影的经线曲率稍大，但极点仍呈尖角形态。通过稍复杂的分析可导出摩尔魏特投影。



#grid(
  columns: (1fr, 180pt),
  column-gutter: 2em,
  align: top,
  [ 
    假设存在一种赤道方位的等积投影，其具备以下特性：
    - 世界地图的边界为一个椭圆，其长轴长度为短轴的两倍；
    - 纬线映射为具有均匀比例尺的平行直线；
    - 中央经线为直线标准线；其余所有经线均为半椭圆弧，关于赤道与中央经线对称。
    
    由于该投影为预设经线形状的伪圆柱投影，可采用与抛物线投影方程确定相似的方法：对任意纬线，求取使地图与地球对应面积相等的纵坐标。 ],
  figure(
    image("../../img/image_1623587264731_0.png", width: 100%),
    caption: [摩尔魏特投影的几何图示],
  )
)

考虑一个以原点为中心、长轴 $a$ 位于 $x$ 轴上的椭圆：
$ x^2 / a^2 + y^2 / b^2 = 1 $

由此得：
$ x^2 = a^2 (1 - y^2 / b^2) $

对于 $-b <= y <= b$，有：
$ x = a sqrt(b^2 - y^2) / b $

$x$ 轴与映射至 $y = Y$ 的纬线之间区域的面积为：
$ S_m &= 2 integral_0^Y x d y \
      &= 2 a / b integral_0^Y sqrt(b^2 - y^2) d y $

对于 $0 <= y <= b$，令 $y = b sin theta$（其中 $0 <= theta <= pi / 2$，$d y = b cos theta d theta$）：
$ integral sqrt(b^2 - y^2) d y &= integral sqrt(b^2 (1 - sin^2 theta)) d y \
  &= integral b cos theta dot b cos theta d theta \
  &= b^2 integral cos^2 theta d theta $

由于：
$ cases(
  display(cos^2 alpha) &= display((1 + cos 2 alpha) / 2),
  display(integral cos n beta d beta) &= display(1/n sin n beta + C)
) $



可得：
$ b^2 integral cos^2 theta d theta &= b^2 / 2 ( integral d theta + integral cos 2 theta d theta ) \
  &= b^2 / 2 ( theta + (sin 2 theta) / 2 ) + C $

因此：
$ S_m &= (2 a b) / 2 (2 theta + sin 2 theta) / 2 + C \
      &= (a b (2 theta + sin 2 theta)) / 2 $

对某一 $0 <= theta <= pi / 2$ 成立。

#grid(
  columns: (1fr, 180pt),
  column-gutter: 2em,
  align: top,
  [
    因 $a = 2b$，整个椭圆的面积为 $a b pi = a^2 pi / 2$。
    地球球面总面积为 $4 pi R^2$，故有：
    $ a = R sqrt(8) $
    $ y = (R sqrt(8) sin theta) / 2 $
    $ S_m = 2 R^2 (2 theta + sin 2 theta) $

    由正弦投影的推导可知，球面上赤道与纬线 $phi$ 所界定的球带面积为：
    $ S_s = 2 pi R^2 sin phi $

    令 $S_m = S_s$，得：
    $ 2 theta + sin 2 theta = pi sin phi $
  ],
  figure(
    image("../../img/image_1623589324617_0.png", width: 100%),
    caption: [赤道与另一纬线所界定的区域面积示意图],
  )
)

#grid(
  columns: (1fr, 1.5fr),
  column-gutter: 2em,
  align: top,
  [
    与克拉斯特投影不同，此方程不存在将 $phi$（通过 $theta$）直接转换为 $y$ 的闭合代数解，必须借助数值求根方法。该方法本质上是通过反复“猜测” $theta$ 的近似值并评估逐次差值直至达到所需精度。此任务非常适合电子计算机执行。尽管如此，若初始猜测值取 $phi$ 本身，迭代算法仍能较快收敛。
  ],
  figure(
    image("../../img/mp_combined.png", width: 100%),
    caption: [摩尔魏特投影全图],
  )
)

最后，由椭圆方程可得东侧边界经线的横坐标 $x_b$：

$ x_b &= 2 sqrt(2 R^2 - y^2) \
&= 2 sqrt(2 R^2 - 2 R^2 sin^2 theta) \
&= 2 sqrt(2) sqrt(1 - sin^2 theta) $

与所有伪圆柱投影相同，$x = lambda x_b / pi$，因此摩尔魏特投影的方程为：
$ x = 2 sqrt(2) R (lambda / pi) cos theta $
$ y = sqrt(2) R sin theta $

== 两种任意方位投影的两种方位推导

=== 一般极地方位投影

#grid(
  columns: (1fr, 2fr),
  gutter: 15pt,
  align: horizon,
  [

    方位正射投影的数学推导完全是几何性的。尽管若干方位投影——例如这里要说明的两种——并不遵循此类透视过程，但所有方位投影都可以简化为一个通用模式。

    在球面上，两个角度决定任意点 $P$ 相对于投影中心 $T$ 的距离和位置：对于北极方位，$mu$ 等于经度 $lambda$，而 $psi$ 等于余纬度 $Phi$，即 $pi/2 - phi$。
    在地图上，由于方位投影的特性：


  ],
  figure(
    grid(
      columns: 2,
      gutter: 5pt,
      image("../../img/image_1623590568077_0.png", width: 100%),
      image("../../img/image_1623590573515_0.png", width: 100%)
    ),
    caption: [方位投影的一般情况主要取决于一个函数，该函数将距离从投影中心 $T$ 进行变换。],
  )
)

#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  figure(
    image("../../img/image_1623594533434_0.png", width: 100%),
    caption: [若干方位投影的距离定义函数],
  ),
    [
    $ theta = mu $

    方位投影的基本特征是一个函数，该函数将距离从地图中心进行变换，从而决定极地方位中纬线的间距：
    $ rho = f(R psi) $

    且：
    $ x = rho cos theta $
    $ y = rho sin theta $
  ]
)


=== 等距方位投影

对于等距方位投影（一种重要的导航用投影），地图中心到任意其他点的距离 $rho$ 与其真实径向距离成正比。在北极方位下：
$ rho = (pi/2 - phi) R $

南极方位同样简单，有：
$ rho = (pi/2 + phi) R $
$ quad theta = -lambda $


=== 兰伯特等积方位投影
在唯一的兼具方位和等积特性的投影（由兰伯特创建，适用于世界地图）中，地图上各点相对于中心的距离被逐渐压缩以保持面积等效。公式由基础积分学导出；首先我们定义地球和地图上的一个面积微元。

#grid(
  columns: (120pt, 1fr, 120pt),
  gutter: 10pt,
  align: horizon,
  image("../../img/image_1623594940536_0.png", width: 100%),
  [
    #show math.equation.where(block: true): set align(left)
    #show math.equation.where(block: true): it => pad(left: -8em, it)
    给定一个薄球带作为微元，其由余纬度 $Phi$ 决定：
    $ d s = 2 pi R sin Phi dot R d Phi = 2 pi R^2 sin Phi d Phi $
    在极地方位地图上，对应的微元是一个圆环，其面积为：
    $ d s = 2 pi rho d rho $
  ],
  image("../../img/image_1623594955508_0.png", width: 100%)
)

对于任意给定的余纬度 $Phi_1$，我们希望确定 $rho_1$，使得以 $Phi_1$ 为界的球冠与以 $rho_1$ 为界的地图圆盘具有相同的面积。这足以保持面积，因为由于方位投影的特性，球带和圆环沿圆周的比例尺虽然不同，但都是恒定的。

如果目标是南极方位，则应用类似的符号变化。


#grid(
  columns: (1fr, 1fr),
  gutter: 15pt,
  figure(
    image("../../img/image_1623595865579_0.png", width: 100%),
    caption: [组合式北极等距方位投影（上图）与等积方位投影（下图）地图。],
  ),
    [
      #show math.equation.where(block: true): set align(left)
      #show math.equation.where(block: true): it => pad(left: -8em, it)

      $ integral_0^(phi_1) 2 pi R^2 sin phi d phi = integral_0^(rho_1) 2 pi rho d rho $

      $ 2 pi R^2 integral_0^(phi_1) sin phi d phi = 2 pi integral_0^(rho_1) rho d rho $

      $ -R^2 cos phi |_0^(phi_1) = rho^2 / 2 |_0^(rho_1) $

      $ -2 R^2 (cos phi_1 - 1) = rho_1^2 $

      $ rho_1 &= R sqrt(2) sqrt(1 - cos phi_1)  \
              &= 2 R sqrt((1 - cos phi_1) / 2) \
              &= 2 R sin(phi_1 / 2) $

      $ rho = 2 R sin((pi/2 - phi) / 2) $
  ]
)

组合地图(见下)显示，两种投影在北纬 60° 以北几乎相同（如图表预测：$Phi = 0.534$）。超过此范围，纬线在兰伯特部分越来越近，而在等距方位投影部分保持等距。由此产生的面积差异在南极洲清晰可见。

=== 方位地图的一般赤道方位
通过引入空间中的坐标变换和旋转，可以计算方位地图的其他方位。然而，重要的赤道方位可以用更直接的方式获得，利用球面三角形的两个性质。

#block(
  stroke: 0.5pt + gray,
  inset: 10pt,
  radius: 4pt,
  fill: gray.lighten(90%),
  [
    *球面三角形的正弦与余弦定律* \
    #grid(
      columns: (1fr, 0.5fr),
      gutter: 10pt,
      [
        给定球面三角形顶点上的角度 $A, B, C$，以及连接三角形顶点与球心 $O$ 的边之间对应的角度 $alpha, beta, gamma$： 
#v(2em)
        正弦定律$(sin A) / alpha = (sin B) / beta = (sin C) / gamma$  

        余弦定律 $cos gamma = cos alpha cos beta + sin alpha sin beta cos C$
      ],
      image("../../img/image_1623595909307_0.png", width: 100%)
    )
  ]
)

在赤道方位中，投影中心 $T$ 位于赤道和任意中央经线的交点。它是一个球面三角形的一个顶点；第二个顶点是投影点 $P$，第三个顶点位于赤道上与 $P$ 相同经度处。球心对应的角度分别为 $phi, lambda$ 和 $alpha$，而我们想要的是 $theta$，即对应于第一张图中 $mu$ 的 $T$ 点处的角度。

#grid(
  columns: (1fr, 200pt),
  gutter: 15pt,
  align: horizon,
  [
    #show math.equation.where(block: true): set align(left)
    #show math.equation.where(block: true): it => pad(left: -8em, it)
    $ sin theta / sin phi = sin(pi/2) / sin alpha $
    $ cos alpha = cos phi cos lambda + sin phi sin lambda cos(pi/2); $
    $ alpha = arccos(cos phi cos lambda) $
    $ cos phi = cos alpha cos lambda + sin alpha sin lambda cos theta $
    $ cos theta = (cos phi - cos alpha cos lambda) / (sin alpha sin lambda) = cos phi (1 - cos^2 lambda) / (sin alpha sin lambda) $
    $ sin theta = sin phi / sin alpha $
    $ cos theta = cos phi sin lambda / sin alpha $
  ],
  figure(
    image("../../img/image_1623596663364_0.png", width: 100%),
    caption: [球面上的三角形由投影中心 $T$、待投影点 $P$ 以及一个同经度的赤道点定义。],
  )
)

=== 赤道等距方位投影
只需代入 $cos theta$ 和 $sin theta$ 的表达式，且 $rho = r = alpha R$：

$ alpha = arccos(cos phi cos lambda); $
$ x = (alpha R cos phi sin lambda) / (sin alpha) $
$ y = (alpha R sin phi) / (sin alpha) $

如果 $lambda = phi = 0$，则 $sin alpha = 0$ 但 $x = y = 0$

=== 赤道等积方位投影
在兰伯特等积方位投影的方程中，用 $alpha$ 替换 $Phi_1$：

$ x = rho cos theta = rho / (sin alpha) cos phi sin lambda $
$ y = rho sin theta = rho / (sin alpha) sin phi $

现在使用两个三角恒等式，

$ sin(a + b) = sin a cos b + cos a sin b $

$ sin 2a = 2 sin a cos a $

$ cos(a + b) = cos a cos b - sin a sin b $

$ cos 2a = cos^2 a - sin^2 a = 2 cos^2 a - 1 $

$ (cos 2a + 1) / 2 = cos^2 a $


#grid(
  columns: (1fr, 1.5fr),
  gutter: 15pt,
  align: horizon,
  [
    #show math.equation.where(block: true): set align(left)
    #show math.equation.where(block: true): it => pad(left: -4em, it)
    公共因子可以展开：

    $ rho / (sin alpha)
      &= (2 R sin(alpha / 2)) / (sin alpha) \
      &= (2 R sin(alpha / 2)) / (2 sin(alpha / 2) cos(alpha / 2)) \
      &= R / (cos(alpha / 2)) \
      &= R / sqrt((cos alpha + 1) / 2) \
      &= (R sqrt(2)) / sqrt(cos phi cos lambda + 1) $


  ],
  [
    #figure(
      image("../../img/image_1623598580880_0.png", width: 100%),
      caption: [组合式等距方位投影与等积方位投影赤道方位地图。]
    ) <fig-combine> 
  ]

)

最终，

$ x = sqrt(2 / (1 + cos phi cos lambda)) R cos phi sin lambda $

$ y = sqrt(2 / (1 + cos phi cos lambda)) R sin phi $


如 @fig-combine 所示，再次地，两种投影在投影中心附近非常相似：非洲的北部和南部部分几乎无缝连接。

== 一种基础投影及其两种派生投影的推导

=== 等距圆柱投影的推导

考虑一种任意的赤道方位投影，其具备以下特征：
- 所有经线均为等间距的垂直标准线
- 所有纬线均为等间距的水平等长直线

#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  align: top,
  [
    由此得到的矩形投影即为极简形式的*等距圆柱投影*（“等距”特性仅体现在经线及一两条选定的标准纬线上），该投影拥有多种不同名称。它既非等角投影亦非等积投影，尽管其外观与球面圆柱投影相似，但并非通过透视方法实际生成。

    由于沿所有经线的比例尺恒定，$y$ 坐标可简化为 $R phi$；两条标准纬线位于 $plus.minus phi_0$ 位置，其周长为 $R cos phi_0$。沿任意纬线的恒定比例尺意味着：

    $ x = R lambda cos phi_0, quad y = R phi $

    不同的标准纬线仅影响地图的宽高比例。在以赤道为标准纬线的常见特例中（通常称为*普拉特卡雷投影*,法语意为平面方形），$cos phi_0 = 1$，经度和纬度分别线性映射为 $x$ 和 $y$ 坐标，从而将世界地图表现为 2:1 的矩形。这种极其高效的计算特性使其成为计算机图形学中球体贴图以及数字摄影中全景场景存储的首选格式，尽管其细节密度分布和形状变形程度在极地区域远高于赤道附近。
  ],
  [
    #figure(
      image("../../img/image_1623636159109_0.png", width: 100%),
      caption: [等距圆柱投影中改变标准纬度（高亮显示纬线）对地图形态的影响]
    ) <fig-equirect-2>
    #figure(
      image("../../img/image_1623636104530_0.png", width: 100%),
      caption: [等距圆柱投影（普拉特卡雷投影实例）]
    ) <fig-equirect-1>

  ]
)

=== 温克尔 I 型与埃克特 V 型投影的推导

等距圆柱投影计算迅速，且具备若干实用特性，例如可直接根据两点坐标计算角距离和线性距离。然而该投影在极地区域存在无限的水平拉伸缺陷。另一方面，正弦投影在高纬度区域因强烈剪切变形而影响判读。这两种投影的共同特点是每条纬线上的比例尺保持恒定，且所有纬线呈均匀分布。

#grid(
  columns: (1fr, 180pt),
  column-gutter: 2em,
  align: top,
  [
    温克尔 I 型投影是正弦投影与等距圆柱投影的算术平均值。该投影既不等积也不等角，其定义为：
    $ x = R lambda (cos phi_0 + cos phi) / 2, quad y = R phi $
    *埃克特 V 型投影*是 $phi_0 = 0$ 时的特殊情形。温克尔则通过选择特定的标准纬线，使地图总面积与地图宽度保持比例关系。

    考虑地图的东北象限：其边界经线由以下方程确定：
$ x = pi R (cos phi_0 + cos phi) / 2 $

该象限的面积为：
$ S = integral_0^((pi R) / 2) pi R / 2 (cos phi_0 + cos phi) d y $

由于 
$ y = phi R, quad 0 <= y <= (pi R) / 2 $

$ d y = R d phi, quad 0 <= phi <= pi / 2 $

$ S &= (pi R) / 2 integral_0^(pi / 2) (cos phi_0 + cos phi) R d phi \
    &= (pi R^2) / 2 ( cos phi_0 integral_0^(pi / 2) d phi + integral_0^(pi / 2) cos phi d phi ) \
    &= (pi R^2) / 2 ( pi / 2 cos phi_0 + 1 ) $


  ],
  [


    #figure(
      image("../../img/image_1623637055635_0.png", width: 100%),
      caption: [温克尔第一方案及其基础投影的边界经线对比]
    ) <fig-w1-boundary>
  ]
)



#grid(
  columns: (1fr, 180pt),
  column-gutter: 2em,
  [
    若地球球面总面积 $4 pi R^2 = 4 S$，则：

$ pi R^2 = (pi R^2) / 2 ( pi / 2 cos phi_0 + 1 ) $

$ 1 = pi / 2 cos phi_0 $

$ phi_0 = arccos(2 / pi) $

    因此标准纬线约为 $plus.minus 50 degree 27' 35''$。
  ],
  [
    #figure(
      image("../../img/mp_w1C.png", width: 100%),
      caption: [温克尔 I 型投影地图]
    ) <fig-w1-map>
  ]
)

=== 阿皮安第二球状投影与温克尔 II 型投影的推导

温克尔在其第二项提案中采用了另一种辅助性伪圆柱投影作为基础，该投影的赤道方位特征为：
- 纬线为等间距水平线
- 经线为等间距椭圆弧线
- 整个地图内切于 2:1 椭圆

这种中间椭圆投影形态类似摩尔魏特投影但不等积，本质上是阿皮安第二球状投影设计的全球扩展版本。考虑中心在原点的椭圆方程，其水平长轴为 $a$，短轴为 $a/2$：

$ x^2 / a^2 + (4 y^2) / a^2 = 1 $

在东北象限中，边界经线表达式为 

$ x_b = sqrt(a^2 - 4 y^2) $

纬线等间距特性意味着
 
 $ y = R phi $
 
 因此 $a = pi R$。由于经线同样等间距分布，水平比例尺保持恒定，故 $x = lambda x_b / pi$，该辅助投影方程为：

$ x = lambda R sqrt(pi^2 - 4 phi^2) $
$ y = R phi $

#grid(
  columns: (1fr, 180pt),
  column-gutter: 2em,
  align: top,
  [
    *温克尔 II 型投影*是该椭圆投影与等距圆柱投影的简单算术平均：
$ x = R / 2 lambda ( cos phi_0 + sqrt(pi^2 - 4 phi^2) / pi ) $

$ y = R phi $
    同样地，该投影既不等角也不等积，原作者推荐采用北纬和南纬 $50 degree 27' 35''$ 作为标准纬度。
  ],
  figure(
    image("../../img/image_1623640079205_0.png", width: 100%),
    caption: [温克尔 II 型投影地图]
  ) 
)

== 方位投影的三种变体

=== 艾托夫投影的推导

方位等距投影的赤道方位呈现了人们熟悉的“横向”世界地图形态，但地图边缘区域存在显著的面积夸大现象。


#grid(
  columns: (0.5fr, 1fr), // 左侧文字，右侧图片大包围块
  column-gutter: 2em,
  align: top,
  [
    注意到方位等距地图将“内部”半球包含在一个圆盘内，该圆盘半径是整个地图半径的一半，艾托夫提出了一种非常简单却富有吸引力的修改方案：
    1. 使用加倍后的经度坐标进行投影，实质上将所有区域压缩到内部半球内
    2. 将水平比例尺加倍，使圆盘拉伸为 2:1 的椭圆

    方位投影的这种变体通过两步简单的几何拉伸，有效地缓解了边缘面积变形问题。这种演变逻辑在投影学中具有代表性。
  ],
  // 右侧复杂的 2x4 图片矩阵
  block(
    fill: luma(248),
    stroke: 0.5pt + gray,
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    [
      #set align(center)
      #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[从方位等距投影到艾托夫投影及其发展]
      #v(0.8em)
      
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr), // 划分为四列
        rows: (auto, auto),
        gutter: 6pt,
        // 图1：占据前两行、前两列 (2x2)
        grid.cell(colspan: 2, rowspan: 2, align: horizon)[
          #figure(
            image("../../img/image_1623641217220_0.png", width: 100%),
            caption: [普通赤道方位等距投影地图，内部半球已高亮标示],
          )
        ],
        // 图2：第一行第三列
        grid.cell(colspan: 1, rowspan: 1)[
          #figure(
            image("../../img/image_1623641256600_0.png", width: 100%),
            caption: [内部半球],
          )
        ],
        // 图3：第一行第四列
        grid.cell(colspan: 1, rowspan: 1)[
          #figure(
            image("../../img/image_1623641271026_0.png", width: 100%),
            caption: [经度加倍],
          )
        ],
        // 图4：第二行第三、四列 (1x2)
        grid.cell(colspan: 2, rowspan: 1)[
          #figure(
            image("../../img/image_1623641307078_0.png", width: 100%),
            caption: [水平比例尺加倍：艾托夫投影],
          )
        ]
      )
    ]
  )
)

所得投影不再具有方位特性，仅沿赤道和中央经线保持等距性。

正向投影方程可直接由赤道方位等距投影公式推导，将 $lambda$ 替换为 $lambda / 2$ 并在横坐标上乘以系数 2：

$ alpha = arccos( cos phi cos lambda / 2 ) $

$ k = cases(
  0 & "if" alpha = 0,
  (alpha R) / (sin alpha) & "otherwise"
) $

$ x = 2 k cos phi sin lambda / 2 $

$ y = k sin phi $

艾托夫的方法其实由约翰·兰伯特首创，其通过对方位球面投影进行压缩得到了“拉格朗日”投影。

=== 哈默投影与埃克特-格里芬多夫投影的推导

#grid(
  columns: (2fr, 1fr),
  column-gutter: 2em,
  align: horizon,
  // 左侧装饰块
  block(fill: luma(248), stroke: 0.5pt + gray, inset: 12pt, radius: 4pt)[
    #set align(center)
    #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[压缩经度效果]
    #v(0.5em)
    #figure(
      image("../../img/image_1623641721428_0.png", width: 100%),
      caption: [这一系列修改后的赤道方位等距投影地图展示了将经度压缩 1 至 2 倍后，如何使整个世界容纳在原先仅单个半球所占的空间内。]
    ) <fig-comp-lon>
  ],
  [

    哈默对艾托夫的方案进行了进一步改进，其投影应用了相同的思路，但改为基于兰伯特的方位等积投影。其结果是：
    - 整体比例尺小于艾托夫投影
    - 投影后的内部半球宽度并非整个地图的一半，而是占据其一半面积
    - 最终的加倍操作恢复了比例关系，且最终地图仍保持等积特性
    - 沿主轴的比例尺不再恒定
  ]
)

同样，公式可通过在兰伯特方程中将 $lambda$ 替换为 $lambda / 2$ 推导得出：

$ x = 2 R sqrt(2 / (1 + cos phi cos lambda / 2)) cos phi sin lambda / 2 $

$ y = R sqrt(2 / (1 + cos phi cos lambda / 2)) sin phi $

#grid(
  columns: (1fr, 200pt),
  column-gutter: 2em,
  align: top,
  [
    艾托夫与哈默投影的比例尺不同，但整体轮廓线相当相似。坐标网间距的差异在内部半球几乎不可见，导致这两种投影常被错误标识。

    哈默的设计又被埃克特-格里芬多夫进一步修改，其投影应用了进一步的 2:1 重新缩放。因此方程基本相同，仅需将 $lambda / 2$ 替换为 $lambda / 4$，并将 $x$ 系数从 2 改为 4。

    对于基于压缩经度并按倒数因子扩展横坐标、同时保持中央经线比例尺恒定的等积投影，其极限情况是四次等积投影——一种伪圆柱投影。
  ],
  [
    #figure(
      image("../../img/image_1623642603615_0.png", width: 100%),
      caption: [等比例尺下的艾托夫投影地图（上半）与哈默投影地图（下半）]
    ) <fig-aitoff-hammer>
  ]
)

=== 温克尔三重投影

温克尔提出了艾托夫投影的另一种变体。与其第一、第二混合投影类似，他的三重投影对等距圆柱投影与艾托夫投影的 $x$、$y$ 坐标进行平均。同样地，

$ phi_0 = plus.minus arccos(2 / pi) $


#grid(
  columns: (2fr, 1fr),
  column-gutter: 2em,
  [
    #set align(center)
    #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[纬线展平效果]
    #v(1em)
    #figure(
      image("../../img/image_1623643193272_0.png", width: 100%),
      caption: [经过经度压缩/水平扩展的互逆因子调整后的赤道方位等积投影地图。]
    ) <fig-lat-flat>
  ],
  [

    温克尔三重投影通过这种复杂的平均算法，在维持世界全图轮廓的同时，极大地改善了高纬度地区的面积与形状变形，是目前最常用的世界地图投影之一。

    通常被选作圆柱基投影的标准纬线（尽管最终投影并无标准纬线）。

    方程可直接由艾托夫投影和等距圆柱投影公式导出：
  ]
)

#grid(
  columns: (1fr, 1.6fr),
  column-gutter: 2em,
  align: top,
  [
    #show math.equation.where(block: true): set align(left)
    #show math.equation.where(block: true): it => pad(left: -8em, it)

    $ alpha = arccos(cos phi cos lambda/2) $

    $ w = cases(
      0 & "if" alpha = 0,
      1 / (sin alpha) & "otherwise"
    ) $

    $ x = R / 2 (lambda cos phi_0 + 2 w alpha cos phi sin lambda/2) $

    $ y = R / 2 (phi + w alpha sin phi) $

  ],
  // 右侧装饰块
  block(
    fill: luma(248),
    stroke: 0.5pt + gray,
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    [
      #figure(
        image("../../img/image_1623643273981_0.png", width: 100%),
        caption: [采用常规标准纬线（上半）与 40° 参考纬线的温克尔三重投影地图]
      ) <fig-winkel-tripel>
    ]
  )
)

#pagebreak(weak: true)

