package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
)

func init() {
	// Create log file
	// If the file doesn't exist, create it or append to the file
	file, err := os.OpenFile("linkFilesLog.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0666)
	if err != nil {
		log.Fatal(err)
	}
	log.SetOutput(file)
}

func main() {
	apps := make(map[string][]string)

	// Comment out any lines of dirs you don't want to link
	/* apps["qtile"] = []string{"config.py", "autostart.sh"} */
	/* apps["picom"] = []string{"picom_custom.conf"} */
	/* apps["nitrogen"] = []string{"nitrogen.cfg"}
	 * apps["powerline-shell"] = []string{"config.json"}
	 * apps["powerline-shell/themes"] = []string{"basic.py"}
	 * apps["rofi"] = []string{"config", "rofi.rasi"} */
	/* apps["../.config"] = []string{"betterlockscreenrc"} */

	for d, f := range apps {
		path := filepath.Join("/home/jdv/.config", d)
		if _, err := os.Stat(path); err != nil {
			if os.IsNotExist(err) {
				// File or path does not exist
				fmt.Println("Making dir: ", path)
				err := os.MkdirAll(path, 0777)
				if err != nil {
					log.Fatalln(err)
				}
				for i := range f {
					fileOld := filepath.Join("/home/jdv/github.com/jdvober/dotfiles/.config", d, f[i])
					fileNew := filepath.Join("/home/jdv/.config", d, f[i])

					err := os.Link(fileOld, fileNew)
					if err != nil {
						fmt.Printf("An error occured while linking %s\n", fileOld)
						log.Fatalln(err)
						break
					}
					fmt.Printf("Created link from %s >> %s\n", fileOld, fileNew)
				}
			} else {
				// Handle other errors (possibly permission errors)
				log.Println(err)
			}
		} else {
			// Path already exists

			// If the file is in .config with no subdirectory
			if d == "../.config" {
				for i := range f {
					fileOld := filepath.Join("/home/jdv/github.com/jdvober/dotfiles", d, f[i])
					fileNew := filepath.Join("/home/jdv/", d, f[i])

					err := os.Link(fileOld, fileNew)
					if err != nil {
						fmt.Printf("An error occured while linking %s\n", fileOld)
						log.Fatalln(err)
						break
					}
					fmt.Printf("Creating link from %s >> %s\n", fileOld, fileNew)
				}
			} else {
				fmt.Printf("%s already exists!", path)
			}
			break
		}

	}
}
