library(hexSticker)

sticker(here::here("man/figures/gvt_build.png"), package="yieldr",
        s_width=.58, s_x=1, s_y=1.25,
        p_size=8, p_x = 1.02, p_y = .5,
        h_fill="#e7dcbf", h_color="#408000",
        p_color = "grey40",
        filename = here::here("man/figures/hex_sticker.png"))

sticker(
        package = "yieldr",                     # package name to display on sticker
        p_size = 10,                          # size of package name
        p_y = 1.5,                            # y of package name
        p_color = "#C9B128",                  # color of package name
        subplot = here::here("man/figures/gvt_build.png"),          # sticker feature
        s_x = 1,                          # x of feature
        s_y = .8,                             # y of feature
        s_width = .45,                        # width of feature - maintains aspect ratio
        h_size = 2,                           # border
        h_color = "#C9B128",                  # color of border
        h_fill = "#e7dcbf",                     # color of background
        url = "github.com/dylanjm/yieldr",   # url at the bottom
        u_color = "grey50",                    # color of url at the bottom
        u_size = 1.5,                         # size of url at the bottom
        filename = here::here("man/figures/yieldr.png")                 # location to save the image
)
