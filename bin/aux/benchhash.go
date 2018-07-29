package main

import (
    "golang.org/x/crypto/bcrypt"
    "os"
    "strconv"
    "time"
)

func main() {
    input, _ := strconv.Atoi(os.Args[1]);
    start := time.Now()
    bcrypt.GenerateFromPassword([]byte("password"), input)
    print(time.Now().Sub(start) / time.Millisecond)
}
