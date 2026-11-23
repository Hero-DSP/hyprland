-- Full documentation:
--    - https://wiki.hypr.land/Configuring/Basics/Variables/#general
--    - https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
--
-- These are Vibranium defaults. Use Vibranium Setttings to change.

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	decoration = {
		active_opacity = 0.92,
		inactive_opacity = 0.85,
		dim_inactive = true,
		rounding = 0,

		blur = {
			enabled = true,
			size = 10,
			passes = 3,
		},

		shadow = {
			enabled = true,
		},
	},
})
