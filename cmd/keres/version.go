package main

import (
  "fmt"
  "runtime"

  "github.com/arcade/keres/version"
  "github.com/spf13/cobra"
)

func versionCommand() *cobra.Command {
  return &cobra.Command{
    Use:   "version",
    Short: "Print the version and exit",
    Run: func(cmd *cobra.Command, args []string) {
      fmt.Printf(`keres Version: %s
Go Version: %s
Go OS/ARCH: %s %s
`, version.Version, runtime.Version(), runtime.GOOS, runtime.GOARCH)
    },
  }
}
