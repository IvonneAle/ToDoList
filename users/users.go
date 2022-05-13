package users

import (
	"ToDoList/helpers"
	"ToDoList/interfaces"
	"errors"
	"time"

	"github.com/dgrijalva/jwt-go"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

func Login(username string, pass string) map[string]interface{} {
	//Add validation
	valid := helpers.Validation(
		[]interfaces.Validation{
			{Value: username, Valid: "username"},
			{Value: pass, Valid: "password"},
		})
	if valid {
		db := helpers.ConnectDB()
		user := &interfaces.User{}
		//Connect to DB
		dbRresult := db.Where("username = ? ", username).First(&user)
		if errors.Is(dbRresult.Error, gorm.ErrRecordNotFound) {
			return map[string]interface{}{"message": "User not found"}
		}
		//Validate password
		passErr := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(pass))
		if passErr == bcrypt.ErrMismatchedHashAndPassword && passErr != nil {
			return map[string]interface{}{"message": "Wrong password"}
		}

		var response = prepareResponse(user)

		return response
	} else {
		return map[string]interface{}{"message": "not valid values"}
	}

}

func prepareToken(user *interfaces.User) string {
	tokenContent := jwt.MapClaims{
		"user_id": user.ID,
		"expiry":  time.Now().Add(time.Minute * 60).Unix(),
	}
	jwtToken := jwt.NewWithClaims(jwt.GetSigningMethod("HS256"), tokenContent)
	token, err := jwtToken.SignedString([]byte("TokenPassword"))
	helpers.HandleErr(err)

	return token
}

func prepareResponse(user *interfaces.User) map[string]interface{} {
	responseUser := &interfaces.ResponseUser{
		ID:       user.ID,
		Username: user.Username,
		Email:    user.Email,
	}

	var token = prepareToken(user)
	var response = map[string]interface{}{"message": "all is fine"}
	response["jwt"] = token
	response["data"] = responseUser

	return response
}

func Register(username string, email string, pass string) map[string]interface{} {
	// Add validation to registration
	valid := helpers.Validation(
		[]interfaces.Validation{
			{Value: username, Valid: "username"},
			{Value: email, Valid: "email"},
			{Value: pass, Valid: "password"},
		})
	if valid {
		db := helpers.ConnectDB()
		generatedPassword := helpers.HashAndSalt([]byte(pass))
		user := &interfaces.User{Username: username, Email: email, Password: generatedPassword}
		db.Create(&user)
		//defer db.Close()

		var response = prepareResponse(user)

		return response

	} else {
		return map[string]interface{}{"message": "not valid values"}
	}
}
