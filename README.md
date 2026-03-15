a project that generates a [zed](https://zed.dev) theme based on your current wal theme.

---
backstory: I was in the process of changing my linux theme and I wanted to change my theme in zed to match, so I go to this [project I used in the past](https://github.com/dwoodv2/pywal-theme-zed) and I found out it's been deleted. Thankfully I had a theme that used this in the past so I asked chatgpt to make a thing based on the theme.json, the thing didn't work, so I bug fixed the thing and here we are.

does it work on mac?  
idk

does it work on windows?  
idk, probably not due to the code itself being hardcoded to use UNIX filepaths

## usage
```
./walzed
```
after a `just build` or `just build release`.  
or running
```
crystal run walzed.cr
```
should just work.
