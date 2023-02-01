 package controller

import (
	
	"api/config"
	"api/models"
	"github.com/gin-gonic/gin"
)



 func GetUsers(c *gin.Context){
	
	users:= []models.User{}
	config.DB.Find(&users)
	c.JSON(200, users)
 }

 func CreateUser(c * gin.Context){
     
	var user models.User
	c.BindJSON(&user)
    config.DB.Create(&user)
    c.JSON(200, &user)
 }


 func DeleteUser(c * gin.Context){
     
	var user models.User
    config.DB.Where("id = ?",c.Param("id")).Delete(&user)
    c.JSON(200, &user)
 }

 func UpdateUser(c * gin.Context){
    
	var user models.User
	 c.BindJSON(&user)
	config.DB.Where("id = ?",c.Param("id")).Updates(&user)

    c.JSON(200, &user)
 }

 func SingleUser(c * gin.Context){
     
	var user models.User
    config.DB.Where("id = ?",c.Param("id")).First(&user)
    c.JSON(200, &user)
 }
