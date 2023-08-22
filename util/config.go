package util

import (
	"log"

	"github.com/spf13/viper"
)

type Config struct {
	Host string `mapstructure:"HOST"`
	Port string `mapstructure:"PORT"`
}

func LoadConfig(path string) Config {
	var config Config

	viper.SetConfigName("app")
	viper.SetConfigType("env")
	viper.AddConfigPath(path)
	viper.AutomaticEnv()

	err := viper.ReadInConfig()
	if err != nil {
		log.Fatal("Cannot load config file")
	}

	err = viper.Unmarshal(&config)
	if err != nil {
		log.Fatal("Cannot read config file")
	}

	return config
}
