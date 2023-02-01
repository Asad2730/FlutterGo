package main
import (
	"api/routes"
	"api/config"
	"github.com/gin-gonic/gin"
)

func main(){
   
	r:= gin.Default()
    config.Connect()
    routes.UserRoute(r)
	r.Run(":8080" ) //0.0.0.0

}