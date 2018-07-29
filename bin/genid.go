package main

import (
    "crypto/rand"
    "encoding/base64"
    "os"
    "strconv"
    "fmt"
)

func main() {
    input, _ := strconv.Atoi(os.Args[1])
    b := make([]byte, input)
    _, err := rand.Read(b)
    if err == nil {
        str := base64.URLEncoding.EncodeToString(b)
        fmt.Print(str[:len(str)-1])
    } else {
        fmt.Print(-1)
    }
}
