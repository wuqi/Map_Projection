// 这里的 state 用于精准控制页眉内容
#let cur-heading = state("cur-heading", none)

#let project(
  title: "",
  author: "",
  body
) = {
  // 基础设置
  set document(title: title, author: author)
  set text(font: ("LXGW Neo ZhiSong Plus", "SimSun"), size: 10.5pt, lang: "zh")
  set par(first-line-indent: 2em, justify: true, leading: 1.0em, spacing: 1.2em)
  // 设置无序列表 (Unordered List) 向内缩进 3em
  set list(indent: 1em)

// 设置有序列表 (Ordered List) 向内缩进 3em
  set enum(indent: 1em)

  // 页面设置
  set page(
    paper: "a4",
    margin: (inside: 3cm, outside: 2cm, y: 3cm),
    header: context {
      let page_num = counter(page).get().first()
      // 只有在页码编号开启时（i 或 1）才显示页眉
      if page.numbering != none {
        set text(9pt, font: "LXGW Neo XiHei Plus")
        if calc.even(page_num) {
          align(left, title)
        } else {
          // 获取当前状态记录的标题
          let h-body = cur-heading.get()
          if h-body != none { align(right, h-body) }
        }
        v(0.5em)
        line(length: 100%, stroke: 0.5pt + gray)
      }
    },
    footer: context {
      if page.numbering != none {
        set text(9pt, font: "LXGW Neo XiHei Plus")
        let pos = if calc.even(counter(page).get().first()) { left } else { right }
        align(pos, counter(page).display())
      }
    }
  )

  // 标题样式规则
  show heading: it => {
    // 每次出现一级标题，更新全局状态供页眉使用
    if it.level == 1 { cur-heading.update(it.body) }
    
    // 统一标题字体
    set text(font: ("LXGW Neo XiHei Plus", "SimHei"))
    
    if it.level == 1 {
      pagebreak(to: "odd", weak: true)
      v(2em)
      set align(center)
      set text(size: 20pt)
      block(width: 100%)[
        #if it.numbering != none {
          [第 #counter(heading).display() 章 ]
        }
        #it.body
      ]
      v(2em)
    } else if it.level == 2 {
      set text(size: 14pt)
      set block(above: 1.5em, below: 1em, sticky: true)
      it
    } else if it.level == 3 {
      set text(size: 12pt)
      set block(above: 1.2em, below: 0.8em, sticky: true)
      it
    } else {
      set text(size: 10.5pt, weight: "bold")
      set block(above: 1em, below: 0.6em, sticky: true)
      it
    }
  }

  // 强调与图表字体
  show strong: set text(font: ("LXGW Neo XiHei Plus", "SimHei"), weight: "bold")
  show figure: set text(size: 9pt, font: ("LXGW WenKai Mono", "KaiTi"))

  body
}

// 分割页函数
#let part_divider(title) = {
  pagebreak(to: "odd")
  set page(header: none, footer: none, numbering: none)
  // 清空页眉状态，防止分割页后第一页抓到旧标题
  cur-heading.update(none)
  align(center + horizon)[
    #set text(font: "SimHei", size: 32pt, weight: "bold")
    #title
    #v(1em)
    #line(length: 50%, stroke: 2pt)
  ]
  pagebreak(to: "odd")
}
