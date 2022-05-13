package main

import (
	//"fmt"
	"ToDoList/api"
	"ToDoList/handlers"
	"log"
	"net/http"
	//"github.com/gorilla/mux"
)

func main() {

	fs := http.FileServer(http.Dir("./static"))
	http.Handle("/", fs)

	//router := mux.NewRouter()

	http.HandleFunc("/form", handlers.FormHandler)
	http.HandleFunc("/hello", handlers.HelloHandler)
	http.HandleFunc("/login", handlers.LoginHandler)
	//http.HandleFunc("/", handlers.RootHandler)

	api.StartApi()

	log.Println("Listening on :3000...")
	err := http.ListenAndServe(":3000", nil)
	if err != nil {
		log.Fatal(err)
	}
}
