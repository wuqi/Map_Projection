

#let project(
  title: "",
  author: "",
  translator: "",
  body
) = {
  set document(title: title, author: author)

  set page(
    paper: "a4",
    margin: (inside: 3cm, outside: 2cm, y: 3cm),
    header: context {
      let page_num = counter(page).get().first()
      if page_num > 0 and page.numbering != none {
        set text(9pt, font: ("LXGW Neo XiHei Plus", "SimSun"))
        let headings = query(heading.where(level: 1).before(here()))
        if calc.even(page_num) {
          align(left, title)
        } else {
          if headings.len() > 0 {
            align(right, headings.last().body)
          }
        }
        v(0.5em)
        line(length: 100%, stroke: 0.5pt + gray)
      }
    },
    footer: context {
      let page_num = counter(page).get().first()
      if page.numbering != none {
        set text(9pt, font: "LXGW Neo XiHei Plus")
        if calc.even(page_num) { align(left, counter(page).display()) }
        else { align(right, counter(page).display()) }
      }
    }
  )

  set text(
    font: ("LXGW Neo ZhiSong Plus", "SimSun"), 
    size: 10.5pt,
    lang: "zh",
    region: "cn",
    fallback: true
  )

  set par(
    first-line-indent: 2em,
    justify: true,
    leading: 1.0em,
    spacing: 1.2em    
  )

  // --- 关键修正：标题样式 ---
  
  show heading.where(level: 1): it => {
    //pagebreak(weak: true, to: "odd")
    v(2em)
    set align(center)
    set text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 20pt)
    if it.numbering != none {
      text(font: "SimHei")[第 #counter(heading).display() 章]
      h(0.5em)
    }
    it.body
    v(2em)
  }

  // 重点：二级标题必须保持为“流式”或者不带强制换行块
  show heading.where(level: 2): it => {
    // 使用 set text 而不是包装 it
    set text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 14pt)
    // 使用 v(.., weak: true) 确保它能被 float 探测到
    v(1.5em, weak: true)
    it
    v(1em, weak: true)
  }

    // --- 三级标题：小四号 (12pt)，左对齐，适当间距 ---
  show heading.where(level: 3): it => {
    set text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 12pt)
    // 使用 set block 替代手动 v()，更好地支持 0.14 的布局引擎
    set block(above: 1.2em, below: 0.8em, sticky: true)
    it
  }

  // --- 四级标题：正文大小 (10.5pt)，加粗，段落感强 ---
  show heading.where(level: 4): it => {
    set text(font: ("LXGW Neo XiHei Plus", "SimHei"), size: 10.5pt, weight: "bold")
    set block(above: 1em, below: 0.6em, sticky: true)
    it
  }

  // 在 project 函数的 set text 之后添加
  show strong: set text(weight: 700)
  
  // 针对没有粗体位的中文，强制开启合成粗体 (0.14 推荐做法)
  show strong: it => {
    let font-list = ("LXGW Neo XiHei Plus", "SimHei") // 强调时切换到黑体类字体
    set text(font: font-list, weight: "bold")
    // 如果还是不够粗，可以用 0.14 的 stroke 微调（注意 stroke 宽度要极小）
    // set text(stroke: 0.02em) 
    it
  }

  set math.equation(numbering: "(1)")

  body
}

#let part_divider(title) = {
  pagebreak(to: "odd")
  set page(header: none, footer: none, numbering: none)
  align(center + horizon)[
    #set text(font: "SimHei", size: 32pt, weight: "bold")
    #title
    #v(1em)
    #line(length: 50%, stroke: 2pt)
  ]
  pagebreak(to: "odd")
}

#let preface_style(body) = {
  set text(font: ("LXGW Neo XiHei Plus", "FangSong"), size: 11pt)
  body
}


