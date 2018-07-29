package main

import (
    "golang.org/x/crypto/bcrypt"
    "os"
    "io/ioutil"
    "fmt"
)

func main() {
    input, _ := ioutil.ReadAll(os.Stdin)
    hash, _ := bcrypt.GenerateFromPassword([]byte(input), 12)
    fmt.Print(string(hash))
}
