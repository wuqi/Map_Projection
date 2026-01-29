#import "template.typ": *

#show: project.with(
  title: "地图投影理论与实践",
  author: "Carlos A. Furuti",
  translator: "wuqi"
)


// 1. 封面
#include "cover.typ"

// 2. 目录：必须先跳转到下一张纸的正面
#pagebreak(to: "odd") 
#set page(numbering: "i")
#counter(page).update(1) // 现在的 i 就是物理意义上的新一页
#outline(indent: auto, depth: 3)

// 3. 译序：同理，强制右手开页
#pagebreak(to: "odd")
#set page(numbering: "1")
#counter(page).update(1) // 译序作为正文第 1 页
#include "chapters/preface.typ"

// 4. 第一部分
#part_divider("第一部分：理论基础")
#set heading(numbering: "1.1")
#include "chapters/part1/ch01.typ"
#include "chapters/part1/ch02.typ"
#include "chapters/part1/ch03.typ"


// 第二部分：应用实践
#part_divider("第二部分：应用实践")
#for i in range(1, 11) {
  let ch_num = if i < 10 { "0" + str(i) } else { str(i) }
  //include "chapters/part2/ch" + ch_num + ".typ"
}

