package handlers

import (
	"fmt"
	//"log"
	"encoding/json"
	"io/ioutil"
	"net/http"

	"ToDoList/helpers"
	"ToDoList/users"
	//"github.com/gorilla/mux"
)

type Login struct {
	Username string
	Password string
}

type ErrResponse struct {
	Message string
}

type Register struct {
	Username string
	Email    string
	Password string
}

func HelloHandler(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/hello" {
		http.Error(w, "404 not found.", http.StatusNotFound)
		return
	}

	if r.Method != "GET" {
		http.Error(w, "Method is not supported.", http.StatusNotFound)
		return
	}

	fmt.Fprintf(w, "Hello!")
}

func FormHandler(w http.ResponseWriter, r *http.Request) {
	if err := r.ParseForm(); err != nil {
		fmt.Fprintf(w, "ParseForm() err: %v", err)
		return
	}
	// fmt.Fprintf(w, "POST request successful")
	// name := r.FormValue("name")
	// address := r.FormValue("address")

	// fmt.Fprintf(w, "Name = %s\n", name)s
	// fmt.Fprintf(w, "Address = %s\n", address)

	http.Redirect(w, r, "/login.html", 303)
	return
}

func LoginHandler(w http.ResponseWriter, r *http.Request) {
	if err := r.ParseForm(); err != nil {
		fmt.Fprintf(w, "ParseForm() err: %v", err)
		return
	}

	user := r.FormValue("username")
	password := r.FormValue("password")
	//fmt.Fprintf(w, user, password)
	login := users.Login(user, password)

	if login["message"] == "all is fine" {
		//resp := login
		//json.NewEncoder(w).Encode(resp)
		// http.Redirect(w, r, "/index2.html", http.StatusSeeOther)
		http.Redirect(w, r, "/index2.html", 303)
		return
	} else {
		//resp := ErrResponse{Message: "Wrong username or password"}
		//json.NewEncoder(w).Encode(resp)
		http.Redirect(w, r, "/login.html", 303)
		return
	}

}

func RegisterHandler(w http.ResponseWriter, r *http.Request) {
	// Read body
	body, err := ioutil.ReadAll(r.Body)
	helpers.HandleErr(err)
	// Handle registration
	var formattedBody Register
	err = json.Unmarshal(body, &formattedBody)
	helpers.HandleErr(err)
	register := users.Register(formattedBody.Username, formattedBody.Email, formattedBody.Password)
	// Prepare response
	if register["message"] == "all is fine" {
		resp := register
		json.NewEncoder(w).Encode(resp)
		// Handle error in else
	} else {
		resp := ErrResponse{Message: "Wrong username or password"}
		json.NewEncoder(w).Encode(resp)
	}
}

func RootHandler(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.Error(w, "404 not found.", http.StatusNotFound)
		return
	} else {
		http.Redirect(w, r, "/login.html", 303)
		return
	}
}
