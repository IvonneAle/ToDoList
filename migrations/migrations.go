package migrations

import (
	"ToDoList/helpers"
	"ToDoList/interfaces"
)

func createAccounts() {
	db := helpers.ConnectDB()

	users := [2]interfaces.User{
		{Id: 123, Username: "Manuel", Email: "manuel@manuel.com"},
		{Id: 234, Username: "Jose", Email: "jose@jose.com"},
	}

	for i := 0; i < len(users); i++ {
		// Correct one way
		generatedPassword := helpers.HashAndSalt([]byte(users[i].Username))
		user := interfaces.User{Id: users[i].Id, Username: users[i].Username, Email: users[i].Email, Password: generatedPassword}
		db.Create(&user)
	}
}

func Migrate() {
	User := &interfaces.User{}
	db := helpers.ConnectDB()
	db.AutoMigrate(&User)
	createAccounts()
}
