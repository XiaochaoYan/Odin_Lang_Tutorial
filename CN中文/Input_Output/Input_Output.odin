
package main

import "core:crypto/siphash"
import "base:runtime"

import "core:bufio"
import "core:fmt"
import "core:io"
import "core:mem"
import "core:os"
import "core:strings"
import "core:strconv"
import "core:unicode/utf8"


STDIN_READER: bufio.Reader

//全局变量 Global Variable

User :: struct
{
    name : string,
    user_ID : int,
}

user_DataBase := make([dynamic]User, 0)

User_toString :: proc(user1:User) -> string{
    return fmt.tprintf("%s %i", user1.name, user1.user_ID) 
}
//User 的数据结构（Struct）的定义 和 利用这个数据结构的相关方法

main :: proc() {
// main 方法，所有可执行程序从这里开始

    bufio.reader_init(&STDIN_READER, os.stream_from_handle(os.stdin))

    for {

        menu_selection := main_menu()

        if menu_selection == 1 {
            curr_user := ask_for_new_user()
            append(&user_DataBase,curr_user)
            fmt.printfln("\nUser added:%s",User_toString(curr_user))
        }

        if menu_selection == 2 {
            fmt.println("\nAll current user are below:")
            for i in 0..<len(user_DataBase)
            {
                fmt.printfln("%s",User_toString(user_DataBase[i]))
            }

        }

        if menu_selection == 3 {
            break
            //Exit the loop
        }

    }

    fmt.printfln("程序正常结束")

}
//程序结束


ask_for_new_user :: proc () -> User
{   
    user_to_return :=  User {
    }

    fmt.printfln("请按 \n用户A 001\n的格式输入新用户的用户名")

    line_input, err_1 := bufio.reader_read_string(&STDIN_READER, '\n')

    if err_1 != io.Error.None && err_1 != io.Error.EOF {
        fmt.eprintfln("read error: %v", err_1)
        panic("Error : Illegal character")
    }

    line_input = strings.trim_right(line_input, "\r\n")
    line_input = strings.trim_left(line_input, "\r\n")
  

    string_parts := strings.split(line_input, " ")

    user_ID, ok := strconv.parse_uint(string_parts[1])
    if ok 
    {   
        user_to_return.name = string_parts[0]
        user_to_return.user_ID = cast(int)user_ID;
    }else
    {
        panic("Error : llegal User Data")
    }

    return user_to_return

}


main_menu :: proc  () ->int
{
    fmt.printfln("演示用极简数据库")
    fmt.printfln("主菜单 输入对应数字后 按下回车确认")
    fmt.printfln("1. 新建用户")
    fmt.printfln("2. 查看所有用户")
    fmt.printfln("3. 退出程序")

    final_input : int
    //变量声明 但是并不赋值

    for {

        validated_string : string;

        {
            string_input , err := bufio.reader_read_string(&STDIN_READER,'\n',runtime.heap_allocator())
            validated_string = strings.trim_space(string_input)

            if err != io.Error.None && err != io.Error.EOF {
                fmt.eprintfln("read error: %v", err)
                return 0
            }
        }// End of Scope 1

        {

            int_input, err := strconv.parse_uint(validated_string)

            if err && int_input <= 3 && int_input>= 1 {
                final_input = cast(int)int_input
                break
            }else{
                fmt.println("检测到不合理输入，请重新输入")
            }//检测到合理输入：退出循环

        }// End of Scope 2

    }//End of FOR

    //fmt.printf("\nYou pressed: %d\n",final_input)

    return final_input
}