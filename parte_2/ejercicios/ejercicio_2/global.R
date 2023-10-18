if (as.logical(Sys.getenv("BOX_CACHE_REMOVE", FALSE))) {
	box::purge_cache()
	message("Removiendo cache de box...")
}

box::use(
	shiny[...],
	bslib[bs_theme, ],
	utils = modules/utils,
)