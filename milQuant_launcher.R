# milQuant_launcher.R

ask_confirmation <- function(msg) {
  # Cannot use askYesNo, cannot use readLine, both won't work in 
  # non-interactive mode as forced by Rscript in bat/sh. 
  message(paste(msg, "[y/n] + Enter: "))
  response <- scan("stdin", character(), n = 1, quiet = TRUE)
  result <- tolower(trimws(response)) %in% c("y", "yes")
  if (length(result) == 0) {
    return(FALSE)
  } else {
    return(result)
  }
}

# remotes and (obviously) milQuant have to be installed first. 
if (!requireNamespace("remotes", quietly = TRUE) || !requireNamespace("milQuant", quietly = TRUE)) {
  message("Hi!")
  message("The R-packages 'remotes' and 'milQuant' are required, but not installed.")
  message("This will take a while (maybe even a few minutes), and you need an internet connection.")
  message("There will be lots of messages in this window.")
  message("That is normal.")

  run_installation <- ask_confirmation("Do you want to start the installation now?")
  if (!run_installation) {
    message("Quitting. Try again later.")
    quit(save = "no", status = 0)
  }

  if (!requireNamespace("remotes")) {
    install.packages("remotes")
  }
  if (!requireNamespace("milQuant")) {
    message("milQuant not found, installing...")
    remotes::install_github(
      "lsteinmann/milQuant", 
      ref = remotes::github_release(),
      upgrade = "never", 
      dependencies = TRUE
    )
  }
  message("Phew... now have fun & kolay gelsin.")
}

new_milQuant_version_available <- function() {
  installed_version <- getNamespaceVersion('milQuant')
  repo <- 'lsteinmann/milQuant'
  gh <- try(
    suppressWarnings(
      jsonlite::read_json(paste0('https://api.github.com/repos/',
                          repo, '/releases/latest'))
      ), 
    silent = TRUE
  )
  if (!inherits(gh, "try-error")) {
    new_version <- gsub('v', '', gh$tag_name)
    installed_version <- as.character(installed_version)
    if (installed_version != new_version) {
      msg <- paste0(
        'You are using milQuant v', installed_version, '.\n', 
        'A new version of milQuant is available on GitHub, ',
        'release notes: ', gh$html_url, '\n'
      )
      milQuant::milQ_message(msg) |> message()
      return(TRUE)
    } 
  }
  return(FALSE)
}

ask_and_update <- function() {
  run_update <- ask_confirmation("Do you want to update milQuant now?")

  if (isTRUE(run_update)) {
    milQuant::milQ_message("Updating...") |> message()
    remotes::install_github(
      "lsteinmann/milQuant", 
      ref = remotes::github_release(),
      upgrade = "never", 
      dependencies = TRUE
    )
  } else {
    milQuant::milQ_message("Skipping update...") |> message()
  }
}


if (new_milQuant_version_available()) ask_and_update()

suppressMessages(library(milQuant))
milQuant::milQ_message("Launching milQuant in your browser...") |> message()

options("shiny.launch.browser" = TRUE)
run_milQuant_app()
