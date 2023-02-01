package config

import (
	"api/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
  )

  
  var DB *gorm.DB

  func Connect(){
	dsn:= "host=localhost user=postgres password=123 dbname=postgres port=5432 sslmode=disable"
	db,err:=gorm.Open(postgres.Open(dsn),&gorm.Config{})

	if err != nil{
		panic(err)
	}
   
   db.AutoMigrate(&models.User{})	
   DB = db

  }

