#import "template.typ": *

#let part_divider(title) = {
  // 关键：为这一页单独设置 header 为 none
  set page(header: none) 
  
  pagebreak(to: "odd", weak: true)
  
  show heading: it => {
    set align(center + horizon)
    set text(font: ("LXGW Neo XiHei Plus", "SimHei"),size: 2.5em, weight: "bold")
    block[
      #it.body
      #v(0.5em)
      #line(length: 100%)
    ]
  }

  heading(level: 1, numbering: none, outlined: true)[#title]
  
  pagebreak(weak: true)
  // 离开函数后，全局的 page 样式会自动恢复
}

#show outline.entry.where(level: 1): it => {
  if it.element.numbering == none {
    strong(it) // 加粗显示“部分”
  } else {
    it // 其他正常的 1.1 标题保持原样
  }
}


#show: project.with(title: "地图投影理论与实践", author: "Carlos A. Furuti")

// 1. 封面 (不计页码)
#set page(numbering: none)
#include "cover.typ"

// 2. 目录 (罗马数字)
#pagebreak(to: "odd")
#set page(numbering: "i")
#counter(page).update(1)
#outline(indent: auto, depth: 3)

// 3. 译序 (切换为阿拉伯数字 1)
#pagebreak(to: "odd")
#set page(numbering: "1")
#counter(page).update(1)
#include "chapters/preface.typ"

// 4. 正文 - 第一部分
#part_divider("第一部分：理论基础")
#set heading(numbering: "1.1")

#include "chapters/part1/ch01.typ"
#include "chapters/part1/ch02.typ"
#include "chapters/part1/ch03.typ"
#include "chapters/part1/ch04.typ"
#include "chapters/part1/ch05.typ"
#include "chapters/part1/ch06.typ"
#include "chapters/part1/ch07.typ"
#include "chapters/part1/ch08.typ"
#include "chapters/part1/ch09.typ"

// 5. 正文 - 第二部分
#part_divider("第二部分：应用实践")
#set heading(numbering: "1.1")

// ... 后续 include
#include "chapters/part2/ch01.typ"

// 6. 封底
#include "back.typ"
