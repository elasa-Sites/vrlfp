package main

import (
    "golang.org/x/crypto/bcrypt"
    "os"
    "fmt"
)

func main() {
    fmt.Print(bcrypt.CompareHashAndPassword([]byte(os.Args[1]), []byte(os.Args[2])) == nil)
}
