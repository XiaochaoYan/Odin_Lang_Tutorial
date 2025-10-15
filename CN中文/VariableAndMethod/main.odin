package main
//声明 Package


import "core:fmt"
//声明 引用(import)的其他代码库/包

main :: proc() {

    fmt.printfln("What is 1 + 1 ?")
    one_plus_one : = plus(1,1)
    fmt.printfln("%d",one_plus_one)

    fmt.printfln("What is 2 x 2 ?")
    fmt.printfln("%d",cross(2,2))

    fmt.printfln("What is 1 + (2 x 2) ?")
    fmt.printfln("%d",plus(1,cross(2,2)))
    //这条代码等于
    // result_2x2 := cross(2,2)
    // result_1plus4 := plus(1,4)
    // fmt.printfln("%d",result_1plus4)
    // 尝试选中这段文字 然后按下 Ctrl + / (如果在使用VSCode)
}


plus :: proc (int_a : i32, int_b : i32) -> i32 {   

    to_Return : i32

    to_Return = int_a + int_b

    return to_Return
}

cross :: proc (int_a : i32, int_b : i32) -> i32 {

    to_Return := int_a * int_b

    return to_Return

}
