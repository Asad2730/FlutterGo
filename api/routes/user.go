package routes

import (
	"github.com/gin-gonic/gin"
	"api/controller"
)

func UserRoute(r *gin.Engine){
    
	r.GET("/", controller.UserController)

}