package routes

import (
	"github.com/gin-gonic/gin"
	"api/controller"
)

func UserRoute(r *gin.Engine){
    
	r.GET("/getUsers/", controller.GetUsers)
	r.GET("/login/:email/:password", controller.LoginUser)
	r.GET("/singleUser/:id", controller.SingleUser)
    r.POST("/createUser/",controller.CreateUser)
	r.PUT("/updateUser/:id", controller.UpdateUser)
	r.DELETE("/deleteUser/:id", controller.DeleteUser)
}