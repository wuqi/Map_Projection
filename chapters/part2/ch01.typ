= 地理坐标系与投影坐标系

在地理信息系统（GIS）与制图学中，理解 GCS 与 PCS 的区别是处理空间数据的基石。其核心矛盾在于*不可展开表面（球面）与平面之间的几何冲突*。

== 定义

#let definition(title, body) = block(
  fill: luma(245),
  inset: 12pt,
  radius: 4pt,
  stroke: (left: 3pt + blue.darken(20%))
)[
  #text(weight: "bold", fill: blue.darken(20%))[#title] \
  #set text(size: 0.95em)
  #body
]

#definition("地理坐标系 (GCS)", [

  描述“圆”的球体参考

  基于三维球面或椭球体模型的参考框架，用于定义地球表面的真实空间位置。它通过经纬度的角度测量值，将不规则的地球表面拟合为规则几何形体，提供统一的全球参照基准。
])

#v(0.5em)

#definition("投影坐标系 (PCS)", [

  描述“平”的数学映射

  建立在地理坐标系之上的二维平面系统，通过数学变换将三维曲面映射为直角坐标平面。它将角度单位转换为线性单位（米/英尺），虽引入了几何变形，但极大地方便了地图测量与工程计算。
])

===  核心定义与维度逻辑

- #strong[地理坐标系 (Geographic Coordinate System, GCS)]
  - *维度本质*：基于#strong[三维椭球体]模型。
  - *定位机制*：使用角度测量值（经度 $lambda$ 与纬度 $phi$）描述点在弯曲表面上的位置。
  - *关键组件*：基准面 (Datum)、参考椭球体 (Spheroid) 及本初子午线。
  - *局限性*：无法直接在平面上进行面积或精确距离的线性测量。

- #strong[投影坐标系 (Projected Coordinate System, PCS)]
  - *维度本质*：基于#strong[二维平面]模型。
  - *实现逻辑*：通过数学变换（即地图投影）将 GCS 的球面坐标“摊平”。
  - *依赖关系*：#underline[每一个 PCS 都必然包含一个底层的 GCS]。
  - *核心参数*：投影算法（如 Mercator, UTM）、中央经线、标准纬线、线性单位（米/英尺）。

===  关键属性对比表

#table(
  columns: (1.2fr, 2fr, 2fr),
  inset: 10pt,
  align: horizon,
  stroke: none,
  fill: (col, row) => if row == 0 { gray.lighten(40%) } else if calc.even(row) { gray.lighten(95%) },
  
  [*特性*], [*地理坐标系 (GCS)*], [*投影坐标系 (PCS)*],
  [物理模型], [椭球体或球体（三维空间）], [笛卡尔坐标平面（二维）],
  [计量单位], [角度单位（度/分/秒/弧度）], [线性单位（米/公里/英尺）],
  [坐标表示], [经度 (Long) / 纬度 (Lat)], [东距 (Easting) / 北距 (Northing)],
  [投影变形], [无（真实反映球面几何）], [必然存在（形状、面积或长度）],
  [运算场景], [全球范围定位、大地测量], [工程测绘、导航、面积统计],
)

===  级联演变关系

坐标系的转换遵循以下层级流向：
$ "真实地球" arrow.r.double "参考椭球体" (#strong[GCS]) arrow.r.double "地图投影" arrow.r.double "平面地图" (#strong[PCS]) $

1. #strong[拟合]：首先通过“基准面”将不规则的地球表面拟合为规则的椭球体（如 WGS84）。
2. #strong[映射]：利用数学公式将球面上的点影射到可展开表面（圆柱、圆锥或平面）。
3. #strong[展平]：将可展开表面切开并铺平，形成直角坐标系统。

===  典型工业实例

- #strong[常用 GCS]：
  - *WGS 1984*：全球卫星定位系统 (GPS) 的标准。
  - *CGCS 2000*：中国当前的国家大地坐标系。
- #strong[常用 PCS]：
  - *UTM (通用横轴墨卡托)*：全球通用的 6 度分带投影，常用于卫星影像。
  - *Web Mercator*：Google Maps 和高德地图等互联网地图的在线显示标准。
  - *高斯-克吕格 (Gauss-Krüger)*：中国 1:50 万及更大比例尺地形图的法定投影。

#block(
  fill: rgb("#6fb7c4").lighten(95%),
  stroke: 0.5pt + rgb("#6fb7c4").lighten(50%),
  inset: 15pt,
  radius: 4pt,
  width: 100%,
  breakable: true  // 关键参数：允许跨页断开
)[
      #set text(font: ("LXGW WenKai Mono GB", "KaiTi"), size: 10pt)
    #set par(first-line-indent: 0pt, leading: 0.6em)

    #align(center)[
      #text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt, weight: "bold")[核心辨析：地理坐标系（GCS）并非地图投影]
      #v(0.8em)
    ]

  从严格的制图学逻辑来看，#strong[地理坐标系（GCS）不是一种地图投影]，而是一套位置定义的参照准则。

  1. “描述”与“转换”的本质区别
  - #strong[GCS（描述）]：本质是#strong[球坐标系统]。它通过经纬度（角度）定义点在三维椭球体上的位置。它回答的是：“这个点在地球表面的哪个方位？”
  - #strong[PCS（转换）]：本质是#strong[直角坐标系统]。它是通过数学函数将三维经纬度映射到二维平面的过程。它回答的是：“如何把这个点画在平面纸张上？”

  2. 视觉错觉的根源：默认的“伪投影”
  当我们在 QGIS 或 ArcGIS 中加载 EPSG:4326 (WGS 84) 数据时，屏幕上依然会出现一张矩形地图。这常使人误以为 GCS 自带投影属性。实际上，这只是软件为了可视化而进行的#strong[临时映射处理]：
  - 它将 *1度经度* 简单映射为屏幕上的 *1个单位横向长度*；
  - 它将 *1度纬度* 简单映射为屏幕上的 *1个单位纵向长度*。

  这种映射在数学上被称为 #strong[等距柱状投影 (Equirectangular Projection)]。换言之，你看到的平面效果是软件施加的“视觉补偿”，而非 GCS 自身的几何属性。

  3. 属性对比总结
  #table(
    columns: (1fr, 2fr, 2fr),
    stroke: none,
    gutter: 3pt,
    fill: (col, row) => if row == 0 { rgb("#2e6f97").lighten(80%) } else if calc.even(row) { white } else { rgb("#2e6f97").lighten(98%) },
    [*特性*], [*地理坐标系 (GCS)*], [*地图投影 (Projection)*],
    [几何本质], [三维曲面（椭球体）], [二维平面（地图）],
    [数学属性], [位置的#strong[度量标准]], [位置的#strong[函数变换]],
    [核心目的], [解决“定位”问题], [解决“展平”问题],
    [单位], [角度（度、分、秒）], [长度（米、英尺）],
  )
]


== 地理坐标系在软件中的显示

=== QGIS 中的 EPSG:4326 为何显示为平面？

在 *QGIS*（以及大多数 GIS 软件）中，当你查看使用 *EPSG:4326 (WGS 84)* 的数据时，屏幕上显示的确实是一个平面。这背后的逻辑如下：

==== 1. 默认的“伪投影”显示：等距柱状投影
虽然 EPSG:4326 定义的是球面经纬度（单位是“度”），但计算机显示器物理上是二维平面的，无法直接显示球体。为了在屏幕上呈现数据，QGIS 默认使用了一种最简单的几何映射方式——#strong[等距柱状投影 (Equirectangular Projection / Plate Carrée)]：

- #strong[映射逻辑]：它直接将经度映射为 $X$ 轴，将纬度映射为 $Y$ 轴。
- #strong[单位转换]：在软件看来，它把“1度”直接当作平面上的“1个单位”来画图。
- #strong[数学表达式]：
  $ x = lambda $
  $ y = phi $
  （其中 $lambda$ 是经度，$phi$ 是纬度）

因此，如果你没有为项目设置特定的投影，QGIS 会使用这个简单的线性映射。因为经度范围是 $[-180, 180]$，纬度范围是 $[-90, 90]$，所以你在画布上看到的总是一个 $2:1$ 的长方形。

==== 2. 视觉畸变：为什么它看起来“怪怪的”？
如果你在 EPSG:4326 下查看中国或高纬度地区（如北欧、加拿大），会发现地图看起来比平时看到的要#strong[扁平]很多：

- #strong[原因]：在真实地球球面上，纬线越往两极越短（极点处缩为一个点）；但在这种平面映射下，两极的纬线被强行拉得和赤道一样长。
- #strong[变形]：这种显示方式会产生巨大的#strong[面积和形状畸变]，除了赤道附近，大部分地区的几何形态都是失真的。

==== 3. QGIS 的“动态投影”机制 (OTF)
QGIS 处理坐标矛盾的核心能力在于其#strong[动态重投影 (On-the-Fly Projection)] 功能：

- #strong[项目坐标系 vs 图层坐标系]：你的原始图层存储的是 EPSG:4326 的经纬度，但 QGIS 屏幕右下角显示的是#strong[项目 (Project)] 的坐标系。
- #strong[自动转换]：如果你的项目坐标系设为 *EPSG:3857*（Web 墨卡托），QGIS 会在内存中实时计算，将经纬度投射到对应的平面坐标上显示，而不需要修改原始矢量文件。


== EPSG:3857投影坐标系的官方标准与事实标准的异同

在现代 Web GIS 领域，EPSG:3857（Web Mercator）是应用最为广泛的投影坐标系。然而，深入研究会发现它存在两个并行的定义版本：一个是测绘界在 2008 年正式收录的 *官方标准 (De Jure Standard)*，另一个则是以 Google Maps 为代表、在工程界广泛使用的 *事实标准 (De Facto Standard)*。理解这两者之间约 11 公里的细微差异，是处理高精度地图对齐问题的核心基础。

从设计初衷来看，事实标准追求的是 *算法的对称美学*。为了极大简化 Web 地图瓦片的切片算法，开发者将地球强制拉伸为一个完美的正方形。根据赤道周长计算，赤道半长（X 轴范围）约为 $20,037,508.34$ 米。为了让地图高宽相等（$1:1$），Y 轴也被强行截断在相同的数值。通过墨卡托公式反算，当 Y 轴取该值时，对应的地理纬度恰好约为 $plus.minus 85.051129^deg$。这就是为什么所有主流 Web 地图切片服务在南北极方向都有一个特定的理论极限值。

相比之下，官方标准（由 IOGP 维护的 EPSG 注册中心定义）在收录此投影时，并未受到切片算法的束缚，而是倾向于 *地理描述的完整性*。官方将该投影的有效适用范围定义为整数倍的 $plus.minus 85.06^deg$。虽然这在数值上仅比事实标准的纬度多了约 $0.009^deg$，但由于墨卡托投影在接近极点时具有指数级的拉伸效应，这微小的差异映射到平面坐标上时，就会在垂直方向上多出约 $11,457.7$ 米。

这种 11 公里的差异导致了一个尴尬的现实：如果你严格按照 EPSG 官方给出的边界数值来渲染地图，你的世界地图将呈现为一个微弱的长方形，从而无法与标准的 Google 或 OpenStreetMap 瓦片实现像素级的完美对齐。

#table(
  columns: (1fr, 1.5fr, 1.5fr),
  inset: 10pt,
  align: horizon,
  stroke: (y: 0.5pt + gray),
  fill: (col, row) => if row == 0 { gray.lighten(80%) },
  [*对比维度*], [*事实标准 (Web Tile 逻辑)*], [*官方标准 (EPSG 定义)*],
  [几何形状], [严格正方形 ($1:1$)], [微长方形],
  [投影边界 (Y轴)], [$plus.minus 20,037,508.34$ 米], [约 $plus.minus 20,048,966.1$ 米],
  [截断纬度], [约 $plus.minus 85.051129^deg$], [严格 $plus.minus 85.06^deg$],
  [应用偏好], [工程易用性、切片对称], [地理范围完整、取整习惯],
)

对于开发者而言，在进行坐标转换或地图切片时，*必须以事实标准 ($85.051129^deg$) 为物理截断线*。EPSG 官网上的数值更多应被视为一种描述性的地理范围界定，而非工程实现的硬性指标。本质上，EPSG:3857 是一场用“球体计算公式”处理“椭球体原始数据”的数学折中，理清这 11 公里的源头是解决所有地图偏移问题的钥匙。

// 1. 设置代码块的字体（建议使用等宽字体，如 Fira Code, Consolas）
#set raw(theme: none) // 如果你想完全自定义颜色，可以关闭内置主题
#show raw: set text(font: "LXGW WenKai Mono GB", size: 9pt, fill: rgb("#2d5a27"))

// 2. 设置带背景的容器样式（针对多行代码块）
#show raw.where(block: true): it => block(
  fill: luma(245),      // 淡灰色背景
  inset: 10pt,          // 内边距
  radius: 4pt,          // 圆角
  width: 100%,
  stroke: 0.5pt + gray, // 边框
  it
)


= WKT-CRS 对投影的描述

WKT 不仅仅是文本，它是一套递归嵌套的“数学转换说明书”。


== WKT-CRS 的完整描述 (WKT2 标准)

在测绘与 GIS 领域，#strong[WKT-CRS] (Well-Known Text for Coordinate Reference Systems) 是交换坐标参考系统定义的通用语言。它将复杂的地理数学参数结构化，使不同软件系统能够精确理解坐标的物理含义。

一个完整的投影坐标系 (PROJCRS) 通常由以下递归嵌套的组件构成：

#strong[地理参考 (BASEGEOGCRS)]：定义投影所依赖的底层地理坐标系，包括参考椭球体 (ELLIPSOID) 和大地基准面 (DATUM)。

#strong[转换方法 (CONVERSION)]：声明所使用的数学模型。例如，使用“横轴墨卡托 (Transverse Mercator)”还是“兰伯特投影 (Lambert Conic Conformal)”。

#strong[投影参数 (PARAMETER)]：针对特定方法的数值设置，如中央经线 (False Easting)、标准纬线 (Standard Parallel) 和比例因子 (Scale Factor)。

#strong[坐标轴定义 (CS & AXIS)]：规定坐标的维度顺序（如 E,N 或 N,E）以及计量单位（如米）。


== 核心结构示例：拆解 EPSG:4526

我们将以中国大比例尺测绘常用的 #strong[EPSG:4526]（CGCS2000 / 3-degree Gauss-Kruger zone 38）为例，拆解其 WKT 描述中的核心信息：

```wkt
  PROJCRS["CGCS2000 / 3-degree Gauss-Kruger zone 38",
    BASEGEOGCRS["China Geodetic Coordinate System 2000",
      DATUM["China Geodetic Coordinate System 2000",
        ELLIPSOID["CGCS2000", 6378137, 298.257222101]]],
    CONVERSION["3-degree Gauss-Kruger zone 38",
      METHOD["Transverse Mercator"],
      PARAMETER["Latitude of natural origin", 0],
      PARAMETER["Longitude of natural origin", 114],
      PARAMETER["Scale factor at natural origin", 1],
      PARAMETER["False easting", 38500000],
      PARAMETER["False northing", 0]],
    CS[Cartesian, 2],
      AXIS["northing (N)", north],
      AXIS["easting (E)", east],
      LENGTHUNIT["metre", 1]]
```

=== WKT 核心信息详细拆解

==== 地理参考 (`BASEGEOGCRS`) - 大地基准与椭球体

```wkt
  BASEGEOGCRS["China Geodetic Coordinate System 2000",
      DATUM["China Geodetic Coordinate System 2000",
        ELLIPSOID["CGCS2000", 6378137, 298.257222101]]
```

-   *含义*：这部分定义了“地球”长什么样以及坐标原点在哪里。它是投影变形前的原始球面坐标系。
-   *椭球体 (`ELLIPSOID`)*：
    -   `["CGCS2000", 6378137, 298.257222101]`：
        -   *6378137*：这是*长半轴 (a)*，单位是米。有趣的是，这个数值和 GPS 使用的 WGS84 椭球体长半轴完全一致。
        -   *298.257222101*：这是*扁率分母 (f)*。通过这个数值可以计算出椭球的扁平程度。CGCS2000 的椭球扁率比 WGS84 略精细（WGS84 的扁率分母约为 298.257223563），这也是两者在大地水准面上细微差异的来源。
-   *大地基准面 (`DATUM`)*：
    -   `"China Geodetic Coordinate System 2000"`：这是中国国家大地坐标系，简称为 *CGCS2000*。它表示这个坐标系的原点位于地球质心，并且定向与 ITRF97 (国际地球参考框架) 一致。
    -   *应用意义*：意味着基于这个投影的坐标，是严格定义在地心、且经过中国地区精密修正的地球模型上的。

==== 转换方法 (`CONVERSION`) - 数学映射

```wkt
  CONVERSION["3-degree Gauss-Kruger zone 38",
      METHOD["Transverse Mercator"]
```

-   *含义*：这是从球面到平面的“魔法公式”。这里使用的是*高斯-克吕格投影*，它在数学上等价于*横轴墨卡托投影*。
-   *3度带*：说明这是按经度每3度划分一个投影带。中国大比例尺地形图（1:1万及以上）通常使用3度带，以保证边缘变形极小。
-   *zone 38 (第38带)*：这是带号。

==== 投影参数 (`PARAMETER`) - 约束变形的关键数值

这是理解投影后坐标数值的关键所在。

```wkt
    PARAMETER["Latitude of natural origin", 0]   // 原点纬度
    PARAMETER["Longitude of natural origin", 114] // 中央经线
    PARAMETER["Scale factor at natural origin", 1] // 中央经线比例因子
    PARAMETER["False easting", 38500000]           // 东偏移
    PARAMETER["False northing", 0]                  // 北偏移
```

-   *`Latitude of natural origin = 0`*：
    -   投影的起点纬度是赤道。虽然中国在北半球，但投影计算的数学原点选在赤道与本带中央经线的交点。
-   *`Longitude of natural origin = 114`*：
    -   *中央经线* = 114°E。
    -   *计算依据*：对于3度带，中央经线的计算公式为：*带号 × 3*。
    -   验证：38 × 3 = 114。完全匹配。这表示这个投影带覆盖的区域是中央经线114°左右各1.5度的范围（即东经112.5° ~ 115.5°），涵盖了湖北大部、湖南东北部、江西北部等地区。
-   *`Scale factor at natural origin = 1`*：
    -   *含义*：在中央经线（114°E）上，投影后长度没有变形（比例因子为1）。
    -   *效果*：离开中央经线越远，变形越大。因为是3度带，带宽只有约330公里，边缘的最大长度变形约为 1/1000 的量级，非常适合大比例尺测图。
-   *`False easting = 38500000` (东偏移 38,500,000 米)*：
    -   *核心逻辑*：为了避免出现负坐标，且能从数字中直接读出带号。
    -   *标准公式*：*带号 × 1,000,000 + 500,000*
    -   *推导*：带号 38 × 1,000,000 = 38,000,000；再加上 500,000 米（为了让中央经线对应的横坐标不是0，而是500公里）。
    -   *结果*：38,000,000 + 500,000 = *38,500,000*。
    -   *实战意义*：当你看到一个坐标为 (X: 38524567.89, Y: 3345678.12) 时：
        -   横坐标 (Easting) 的前三位 *385* 立刻告诉你，这个点位于*第38带*。
        -   该点距离中央经线 (114°E) 的*实际水平距离*为 524,567.89 - 500,000 = *24,567.89 米*（向东为正）。
-   *`False northing = 0`*：
    -   北半球（中国）没有使用南半球的偏移，所以赤道处的纵坐标就是 0 米。中国的纵坐标都是正数，且数值较大（如 334 万米，表示距离赤道约 3340 公里）。

==== 坐标轴与单位 (`CS & AXIS`)

```wkt
CS[Cartesian, 2],
    AXIS["northing (N)", north],
    AXIS["easting (E)", east],
    LENGTHUNIT["metre", 1]
```

-   *含义*：定义了平面直角坐标的组成。
-   *轴序 (`AXIS`)*：
    -   这里是 *(N, E)* 即 *(北坐标, 东坐标)*。
    -   *注意*：这是一个容易踩坑的地方。虽然我们通常口头说 “XY”，但在 CGCS2000 投影坐标的官方定义中，第一个坐标是 *Y (Northing/北方向)*，第二个坐标是 *X (Easting/东方向)*。在 GIS 软件（如 ArcGIS Pro, QGIS）中，如果坐标顺序搞反，数据会显示在错误的位置（通常会飞到非洲或者海里）。
-   *单位 (`LENGTHUNIT`)*：`["metre", 1]` 表示所有坐标值的单位都是米。



== 实例拆解：CGCS2000 / 高斯-克吕格 (EPSG:4523)

== 制图学中的 X 轴

==  投影数学参数

== WKT2 (ISO 19162:2019) 解析

== 分瓣投影在 WKT 与 WKT2 中的表示