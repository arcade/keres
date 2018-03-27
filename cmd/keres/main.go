package main

import (
  "fmt"
  "os"

  "github.com/spf13/cobra"
)

func rootCommand() *cobra.Command {
  rootCmd := &cobra.Command{
    Use: "keres",
    Run: func (cmd *cobra.Command, args []string) {
      cmd.Help()
      os.Exit(2)
    },
  }
  rootCmd.AddCommand(serveCommand())
  rootCmd.AddCommand(versionCommand())
  return rootCmd
}

func main() {
  if err := rootCommand().Execute(); err != nil {
    fmt.Fprintln(os.Stderr, err.Error())
    os.Exit(2)
  }
}
