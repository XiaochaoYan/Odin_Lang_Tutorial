
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