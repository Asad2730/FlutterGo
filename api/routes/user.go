package routes

import (
	"github.com/gin-gonic/gin"
	"api/controller"
)

func UserRoute(r *gin.Engine){
    
	r.GET("/", controller.GetUsers)
	r.GET("/:id", controller.SingleUser)
    r.POST("/",controller.CreateUser)
	r.PUT("/:id", controller.UpdateUser)
	r.DELETE("/:id", controller.DeleteUser)
}