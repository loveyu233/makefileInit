package main

import (
	_ "embed"
	"fmt"
	"os"
)

//go:embed Makefile
var makeFile []byte

func main() {
	dir, err := os.Getwd()
	if err != nil {
		fmt.Println(err)
	}
	create, err := os.Create(dir + "/Makefile")
	defer create.Close()
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println("Makefile创建成功。")
	create.Write(makeFile)
	fmt.Println("Makefile写入成功。")
}
