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
	r.Run("0.0.0.0:8080" ) 

}