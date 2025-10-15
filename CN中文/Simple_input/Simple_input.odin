
package main
//声明 Package

import "base:runtime"
import "core:bufio"
import "core:fmt"
import "core:io"
import "core:os"
import "core:strings"
//声明 引用(import)的其他代码库/包

STDIN_READER: bufio.Reader
//全局变量 Global Variable

main :: proc() {
// main 方法，所有可执行程序从这里开始

    fmt.print("Enter a line: ")
    //fmt 应该是 format的简写 fmt包都是和 文字（字符串 / String）输入/输出 相关的代码
    //fmt.print() 调用 print 方法 在屏幕上打印 双引号内字符串 Enter a line: 

    bufio.reader_init(&STDIN_READER, os.stream_from_handle(os.stdin))
    /*
        初始化 
        变量名为 STDIN_READER
        变量类型是 bufio.Reader
        的全局变量(即所有位置的代码都可访问)
    */

    fmt.printf(
        "你输入是: %s 吗?\n",  // 方法参数（paramemter / argument）1 ： 告诉 printf() 方法 打印 你输入是: %s 吗?\n
        ask_for_string_input() // parameter 2 ： 跳转去 ask_for_string_input()方法 并执行 ask_for_string_input() 这个方法，执行完毕后将返回的值(Value) 作为 String 打印出来
    )
    // 带Return的方法可以直接作为变量使用 Method Call Expression
    // 实际代码执行顺序 line 31 开始
    /*
        line 31
        line 32
        line 33 -> 调用 ask_for_string_input()
        line 54 ~ line 65
        line 66 -> return 语句返回
        line 33
        line 34
    */
    ask_for_confirmation()

}
//程序结束


ask_for_string_input :: proc () -> string
{
    fmt.printfln("请输入任意 字符串(String) 后按 回车键(Enter)")

    line, err := bufio.reader_read_string(&STDIN_READER,'\n')

    if err != io.Error.None && err != io.Error.EOF {
        fmt.eprintfln("read error: %v", err)
        panic("Error Illegal String")
    }

    line = strings.trim_left(line, "\r\n")
    line = strings.trim_right(line, "\r\n")

    return line
    //这里的 return 语句就是把
}


ask_for_confirmation :: proc ()
{
    line, err := bufio.reader_read_string(&STDIN_READER,'\n')

    if err != io.Error.None && err != io.Error.EOF {
        fmt.eprintfln("read error: %v", err)
        panic("Error Illegal String")
    }

    line = strings.trim_left(line, "\r\n")
    line = strings.trim_right(line, "\r\n")

    if (
        !strings.contains(line,"不") && 
            (
                strings.contains(line,"对") || 
                strings.contains(line,"是") ||
                strings.to_upper(line,runtime.heap_allocator()) == "YES"
            )
        ) // 复合条件判断语句 ： 当 strings 中不含有"不"字 且 含有 "对"字 或者 含有 "是"字 时，打印出 "很高兴 我对了！" ； 否则 打印出 "嗷！不可能！"
    {
        fmt.print("很高兴 我对了！")
    }else{
        fmt.print("嗷！不可能！")
    }
}