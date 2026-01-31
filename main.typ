#import "template.typ": *

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

// 5. 正文 - 第二部分
#part_divider("第二部分：应用实践")
//#include "chapters/part2/ch01.typ"
// ... 后续 include

// 6. 封底
//#include "back.typ"
