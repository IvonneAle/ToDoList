package helpers

import (
	"ToDoList/interfaces"
	"os"
	"regexp"

	//"github.com/gorilla/schema"

	"golang.org/x/crypto/bcrypt"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/schema"
)

func HandleErr(err error) {
	if err != nil {
		panic(err.Error())
	}
}

func HashAndSalt(pass []byte) string {
	hashed, err := bcrypt.GenerateFromPassword(pass, bcrypt.MinCost)
	HandleErr(err)

	return string(hashed)
}

func ConnectDB() *gorm.DB {
	pass := os.Getenv("PostgresPassword")
	dsn := "user=postgres password=" + pass + " dbname=to_do_list_unique sslmode=disable"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{
			TablePrefix:   "to_do_list.", // schema name
			SingularTable: false,
		}})
	HandleErr(err)
	return db
}

func Validation(values []interfaces.Validation) bool {
	username := regexp.MustCompile("^([A-Za-z0-9]{5,})+$")
	email := regexp.MustCompile("^[A-Za-z0-9]+[@]+[A-Za-z0-9]+[.]+[A-Za-z]+$")

	for i := 0; i < len(values); i++ {
		switch values[i].Valid {
		case "username":
			if !username.MatchString(values[i].Value) {
				return false
			}
		case "email":
			if !email.MatchString(values[i].Value) {
				return false
			}
		case "password":
			if len(values[i].Value) < 5 {
				return false
			}
		}
	}
	return true
}
