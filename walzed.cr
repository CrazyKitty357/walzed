require "json"

home = ENV["HOME"]

wal_path = File.expand_path("#{home}/.cache/wal/colors.json")
out_path = File.expand_path("#{home}/.config/zed/themes/pywal.json")

data = JSON.parse(File.read(wal_path))

special = data["special"].as_h
colors  = data["colors"].as_h

bg = special["background"].as_s
fg = special["foreground"].as_s

c0  = colors["color0"].as_s
c1  = colors["color1"].as_s
c2  = colors["color2"].as_s
c3  = colors["color3"].as_s
c4  = colors["color4"].as_s
c5  = colors["color5"].as_s
c6  = colors["color6"].as_s
c7  = colors["color7"].as_s
c8  = colors["color8"].as_s
c9  = colors["color9"].as_s
c10 = colors["color10"].as_s
c11 = colors["color11"].as_s
c12 = colors["color12"].as_s
c13 = colors["color13"].as_s
c14 = colors["color14"].as_s
c15 = colors["color15"].as_s

def alpha(hex : String, a : String)
  hex + a
end

theme = {
  "$schema" => "https://zed.dev/schema/themes/v0.1.0.json",
  "name" => "pywal",
  "author" => "pywal",
  "themes" => [
    {
      "name" => "pywal",
      "appearance" => "dark",
      "style" => {
        "background" => alpha(bg, "90"),
        "editor.background" => alpha(bg, "90"),
        "editor.foreground" => fg,
        "text" => fg,
        "text.muted" => alpha(fg, "70"),
        "text.ignored" => alpha(fg, "40"),
        "text.placeholder" => alpha(fg, "50"),
        "ignored" => alpha(fg, "30"),

        "border" => bg,

        "panel.background" => alpha(bg, "90"),
        "title_bar.background" => alpha(bg, "90"),
        "status_bar.background" => alpha(bg, "90"),

        "scrollbar.thumb.background" => c1,

        "editor.gutter.background" => alpha(bg, "90"),

        "terminal.background" => alpha(bg, "10"),
        "terminal.foreground" => fg,

        "terminal.ansi.black" => c0,
        "terminal.ansi.red" => c1,
        "terminal.ansi.green" => c2,
        "terminal.ansi.yellow" => c3,
        "terminal.ansi.blue" => c4,
        "terminal.ansi.magenta" => c5,
        "terminal.ansi.cyan" => c6,
        "terminal.ansi.white" => c7,

        "terminal.ansi.bright_black" => c8,
        "terminal.ansi.bright_red" => c9,
        "terminal.ansi.bright_green" => c10,
        "terminal.ansi.bright_yellow" => c11,
        "terminal.ansi.bright_blue" => c12,
        "terminal.ansi.bright_magenta" => c13,
        "terminal.ansi.bright_cyan" => c14,
        "terminal.ansi.bright_white" => c15,

        "modified" => c1,

        "syntax" => {
          "keyword"  => {"color" => c4},
          "string"   => {"color" => c1},
          "number"   => {"color" => c5},
          "function" => {"color" => c6},
          "comment"  => {"color" => c8},
          "variable" => {"color" => c2},
          "operator" => {"color" => c4},
          "constant" => {"color" => c2},
          "boolean"  => {"color" => c2},
          "attribute"=> {"color" => c1},
        },

        "players" => [
          {
            "cursor" => c1,
            "background" => bg,
            "selection" => alpha(c1, "30"),
          }
        ]
      }
    }
  ]
}

Dir.mkdir_p(File.dirname(out_path))

json_string = JSON.build(2) do |json|
	theme.to_json(json)
end

File.write(out_path, json_string)

puts "wrote #{out_path}"
puts "enjoy your new theme :)"
