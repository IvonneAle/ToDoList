package interfaces

import (
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Username string
	Email    string
	Password string
}

type ResponseUser struct {
	ID       uint
	Username string
	Email    string
}

type Validation struct {
	Value string
	Valid string
}