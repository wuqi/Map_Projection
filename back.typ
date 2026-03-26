#page(header: none, footer: none)[
  #set align(top)
  #set text(font: ("LXGW Neo XiHei Plus", "SimSun"), size: 11pt)

  // 顶部装饰条
  #rect(width: 100%, height: 4pt, fill: rgb("#1c81e0"))
  #v(2em)

  // 1. 图书简介
  #block(inset: (x: 2cm))[
    #text(size: 1.5em, weight: "bold", fill: rgb("#1c81e0"))[关于本书]
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.5em)
    本书系统探讨了地图投影的核心理论与现代 GIS 实践。从地理坐标系（GCS）与投影坐标系（PCS）的本质辨析，到 WKT-CRS 标准的演进与 EPSG:3857 等互联网地图投影的深度拆解，为读者构建了一套严谨的制图学认知框架。
  ]

  #v(3em)

  // 2. 作者与译者简介（纯文字排版）
  #block(inset: (x: 2cm))[
    #stack(spacing: 1.5em)[
      // 作者部分
      
        #text(weight: "bold", size: 1.1em)[#h(-2em)作者简介 | About the Author] \
        #v(0.3em)
        #text(weight: "bold")[Carlos A. Furuti] \
        资深系统分析师、制图学教育专家。拥有巴西坎皮纳斯州立大学（Unicamp）计算机科学硕士学位，深耕软件开发与计算机图形学领域。他是一位坚定的开源主义者，其编写的地图投影教程以严谨的逻辑与精美的图形著称，是 GIS 爱好者的重要参考资源。
      

      // 译者部分
      
        #v(2.3em)
        #text(weight: "bold", size: 1.1em)[#h(-2em)译者简介 | About the Translator] \
        #v(0.3em)
        #text(weight: "bold")[wuqi] \
        GIS 技术专家，拥有武汉大学地理信息系统硕士学位。长期深耕于 GIS 与遥感（RS）领域的开发工作，具备较深的理论功底与实战经验。在本书中，负责了第一部分理论内容的中文编译与审校，并主笔编写了第二部分关于工程实践与标准辨析的原创内容。
      
    ]
  ]

  // 3. 底部条形码与分类标签
  #set align(bottom + right)
  #block(inset: 2cm)[
    #stack(
      dir: ltr,
      spacing: 15pt,
      // stack(
      //   spacing: 4pt,
      //   // 如果没图，这一行可以注释掉
      //   rect(width: 3.5cm, height: 1.5cm, fill: white, stroke: 0.5pt + black)[
      //      #set align(center + horizon)
      //      #text(size: 7pt, fill: gray)[BARCODE ZONE]
      //   ],
      //   text(size: 8pt, font: "Courier")[ISBN 978-7-121-00000-0]
      // ),
      rect(width: 3.5cm, height: 2cm, fill: rgb("#1c81e0"), radius: 2pt)[
        #set align(center + horizon)
        #text(fill: white, weight: "bold", size: 9pt)[
          上架指导 \
          地理信息系统 / 制图
        ]
      ]
    )
  ]
]
