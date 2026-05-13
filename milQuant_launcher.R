# milQuant_launcher.R

# Has to be installed first. Forced. I am assuming that you want this 
# if you run the launcher.
if (!requireNamespace("milQuant")) {
  message("milQuant not found, installing...")
  remotes::install_github(
    "lsteinmann/milQuant", 
    ref = remotes::github_release(),
    upgrade = "never", 
    dependencies = TRUE
  )
}

new_milQuant_version_available <- function() {
  installed_version <- getNamespaceVersion('milQuant')
  repo <- 'lsteinmann/milQuant'
  gh <- try(suppressWarnings(
    jsonlite::read_json(paste0('https://api.github.com/repos/',
                               repo, '/releases/latest'))
    ),
            silent = TRUE)
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
  run_update <- tryCatch(
    utils::askYesNo("Do you want to update milQuant now?"),
    error = function(e) NA
  )
  # should this run in while until askYesNo doesnt fail? what if people mistype?

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

run_milQuant_app()
