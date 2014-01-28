package = "luarng"
version = "scm-1"

source = {
	url = "git://github.com/dark7god/rng.git",
	branch = "master",
}

description = {
	summary = "Fast Mersenne Twister random number generator",
	detailed = [[
		Fast Mersenne Twister random number generator
	]],
	homepage = "https://github.com/dark7god/rng",
	license = "MIT/X11"
}

dependencies = {
	"lua >= 5.1"
}

build = {
	type = "builtin",
	modules = {
		rng = "rng.lua",
		rngcore = {
			sources = {
				"rngcore.c", "SFMT.c",
			},
		}
	}
}
