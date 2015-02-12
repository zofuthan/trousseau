package main

import "github.com/codegangsta/cli"

func EncryptionShowCommand() cli.Command {
	return cli.Command{
		Name:        "show",
		Usage:       "Show encryption setup of your data store",
		Description: "",
	}
}

func EncryptionUpdateCommand() cli.Command {
	return cli.Command{
		Name:        "update",
		Usage:       "Update encryption setup of your data store",
		Description: "",
	}
}
