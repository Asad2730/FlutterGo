package models

import ("gorm.io/gorm")

type User struct {	
   gorm.Model
   Id int `json:"id" gorm:"primaryKey;autoIncrement:trueq"`
   Name string `json:"name"`
   Email  string `json:"email"`
   Password string `json:"password"`
}