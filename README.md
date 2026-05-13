# milQuant Launcher

The milQuant Launcher starts the [milQuant](https://github.com/lsteinmann/milQuant) Shiny dashboard — a tool for quantitative analysis of data from [Field Desktop](https://github.com/dainst/idai-field) projects. milQuant will only work reliable with the milet-Configuration. The launcher checks for updates automatically and opens the app in your browser.

---

## Requirements

You need **R** and **Field Desktop** installed on your computer. That is the only requirement.

- Download R for Windows: https://cran.r-project.org/bin/windows/base/
- Download R for macOS: https://cran.r-project.org/bin/macosx/
- Download R for Linux: https://cran.r-project.org/bin/linux/
- Get Field Desktop: https://github.com/dainst/idai-field

You do not need RStudio or any other software.

---

## First-time setup

The first time you run the launcher, it will detect that milQuant is not installed and ask whether you want to install it now. If you confirm, it will install milQuant and all required packages automatically. This may take several minutes and requires an internet connection. You only need to do this once.

---

## How to start milQuant

**Windows:** Double-click `milQuant.bat`

**macOS:** Double-click `milQuant.command`
> The first time, macOS may block the file. Right-click it, choose **Open**, and confirm.

**Linux:** Run `milQuant.sh` in a terminal, or make it executable first:
```
chmod +x milQuant.sh
./milQuant.sh
```

The launcher will open milQuant in your default browser. When you are done, simply close the browser tab — the app will shut down on its own.

---

## Updates

Each time you start the launcher, it checks whether a new version of milQuant is available. If one is found, it will ask whether you want to update. You can choose to update or skip — the app will start either way.

---

## Troubleshooting

**The launcher closes immediately with an error message**
Read the error message before it disappears — it usually tells you what went wrong. On Windows, the window stays open after an error so you have time to read it.

**milQuant cannot connect to Field Desktop**
Make sure Field Desktop is running on your computer or that your computer is on the same local network as another running Field Desktop client. You will need the clients's IP address and the synchronization password.

**A package fails to install**
Make sure you have an internet connection and try again. If the problem persists, [open an issue](https://github.com/lsteinmann/milQuant-launcher/issues).

---

## About

milQuant was developed for the [Miletus Excavation Project](https://www.miletgrabung.uni-hamburg.de/). Questions and bug reports are welcome via the [issue tracker](https://github.com/lsteinmann/milQuant/issues). However, milQuant and this launcher is my hobby project, not my job. Please be patient. 
