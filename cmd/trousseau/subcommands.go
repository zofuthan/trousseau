package main

import (
	"github.com/codegangsta/cli"
	"github.com/oleiade/trousseau"
)

func EncryptionShowCommand() cli.Command {
	return cli.Command{
		Name:        "show",
		Usage:       "Show encryption setup of your data store",
		Description: "",
		Action: func(c *cli.Context) {
			trousseau.EncryptionShowAction()
		},
	}
}

func EncryptionUpdateCommand() cli.Command {
	return cli.Command{
		Name:        "update",
		Usage:       "Update encryption setup of your data store",
		Description: "",
	}
}
