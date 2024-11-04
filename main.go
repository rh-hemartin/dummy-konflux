package main

import (
	"fmt"
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	fmt.Println("serving at http://localhost:8080")
	if err := http.ListenAndServe("localhost:8080", mux); err != nil {
		panic(err)
	}
}
