

// 双斜线为 注释/Comment 的意思，这里所有绿色的文字只是绿色代码 不会被作为程序执行

package main
// 所有的可执行 Odin语言 需要声明自己属于一个 包裹package 内，此处就是声明 这个HelloWorld.odin 属于 main 包。

import "core:fmt"
// 此处是 import/声明/引用/导入 "core:fmt" 包，告诉程序将来我需要用到"core:fmt" 包内的内容。

main :: proc() {
// main 方法，所有可执行程序从这里开始

    fmt.println("Hello World!")
    // fmt 包下的 println 方法，在 cmd命令行 打印出 Hello World!
    //  双引号 "" 内的橙红色文字 代表这里的文字不是普通代码 而是 String字符串

}
//程序结束