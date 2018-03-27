package main

import (
  "fmt"

  "github.com/spf13/cobra"
)

func serveCommand() *cobra.Command {
  return &cobra.Command{
    Use:     "serve [ config file ]",
    Short:   "Connect to the storage and begin serving requests.",
    Long:    ``,
    Example: "dex serve config.yaml",
    Run: func(cmd *cobra.Command, args []string) {
      fmt.Println("Hello World");
    },
  }
}
