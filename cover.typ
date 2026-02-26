#import "@preview/fauxreilly:0.1.1": orly
// 1. O'Reilly 风格封面
#orly(
    font: ("LXGW Neo XiHei Plus", "SimSun"),
    publisher-font: ("LXGW Neo XiHei Plus", "SimSun"),
    color: rgb("#1c81e0"),
    title: "地图投影理论与实践",
    top-text: "Theory and Practice of Map Projections",
    subtitle: "从基础到实践的全面指南",
    pic: move(
        dy: 1cm, // 将图片向下移动 2 厘米，您可以根据预览效果调整这个数值
        image("img/cover.jpeg", width: 100%, fit: "contain")
    ),
    signature: "Carlos A. Furuti 著 / wuqi 译"
)