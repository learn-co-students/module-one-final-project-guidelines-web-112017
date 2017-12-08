require 'colorize'

class Drawing

  def initialize
    make_drawing
  end

  def make_drawing
    ln_arr = []

    ln_arr << "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    ln_arr << "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
    ln_arr << "YYYYYYYYYYYYYwwwwYYYYYYYYYYYYYYY"
    ln_arr << "YYYYYYYYYYYwwwwwwwwwYYYYYYYYYYYY"
    ln_arr << "YYYYYYYYYYwwwwwwwwwwwYYYYYYYYYYY"
    ln_arr << "YYYYYYYYYwwwwwwwwwwwWwYYYYYYYYYY"
    ln_arr << "YYYYYYYYmmmmmmmmmwwwwwwYYYYYYYYY"
    ln_arr << "YYYYYYYmmmmmmmmmmmwWwwwWYYYYYYYY"
    ln_arr << "YYYYYYwmmmmmmmmmmmwwwwwWYYYYYYYY"
    ln_arr << "YYYYYYwmmmmmmmmmmmwwwwwwWYYYYYYY"
    ln_arr << "YYYYYwwmmmmmmmmmmmwwwwwwwYYYYYYY"
    ln_arr << "YYYYYwwmmmmmmmmmmmwwwwwwWYYYYYYY"
    ln_arr << "YYYYYwwwwWmmmWwWmmmwwwWwwwwYYYYY"
    ln_arr << "YYYYwwWMMMmmMMMMmmmwwWwwwwwYYYYY"
    ln_arr << "YYYwwwWMBmmMmMBmmmmWwwwwwwWYYYYY"
    ln_arr << "YYYwwwWmmmmMmmmmmmmwwwwwwWWYYYYY"
    ln_arr << "YYYwwwWmmmmMmmmmmmMwwwwwWWWYYYYY"
    ln_arr << "YYYYwwWmmmmMmmmmmmMwwwwWWWYYYYYY"
    ln_arr << "YYYYYWmmmmmMMmmmmmmWWWWWWYYYYYYY"
    ln_arr << "YYYYYYmmmmMMMmmmMmMWWWYYYYYYYYYY"
    ln_arr << "YYYYYYmmmmmmmmmmmmMMMMYYYYYYYYYY"
    ln_arr << "YYYYYYmmmMMMMMmmMmMMMMYYYYYYYYYY"
    ln_arr << "YYYYYYYmmmmmmmmmmmMMMWWYYYYYYYYY"
    ln_arr << "YYYYYYYmmmmmmmmmmMMMWWWYYYYYYYYY"
    ln_arr << "YYYYYYYYmmmmmmmmMMMWWWWYYYYYYYYY"
    ln_arr << "YYYYYYYYYmmmmmMMMWWWWbBBBBYYYYYY"
    ln_arr << "YYYYYYYYYYMMMMMMWWWWbBBBBBYYYYYY"
    ln_arr << "YYYYYYYYYYWMMMMWWWWWbBBBBBBYYYYY"
    ln_arr << "YYYYYYYYYYWwwWWWWWWbBBBBBBBYYYYY"
    ln_arr << "YYYYYYYYYBWwwwwWWWbBBBBBBBBBYYYY"
    ln_arr << "YYYYYYYbbbWWwwwwwbbBBBBBBBBBBYYY"
    ln_arr << "YYYYYYbbBBWWWwwwwbBBBBBBBBBBBYYY"

    ln_arr.each {|ln| draw_line(ln.split(""))}
    puts ""
    puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts ""
    puts "        WELCOME TO PRESIDENTIAL THUNDERDOME, VOL. 1"
    puts "               EAGLES OF SCREAMING FREEDOM"
    puts ""
    puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
    puts ""
  end

  def draw_line(pixels)
    pix_line = ""
    pixels.each do |pixel|
      pix_line = pix_line + "  ".colorize(:background => find_color(pixel))
    end
    puts pix_line
  end

  def find_color(letter)
    case letter
    when "R"
      :red
    when "r"
      :light_red
    when "B"
      :blue
    when "b"
      :light_blue
    when "C"
      :cyan
    when "c"
      :light_cyan
    when "Y"
      :yellow
    when "y"
      :light_yellow
    when "G"
      :green
    when "g"
      :light_green
    when "K"
      :black
    when "k"
      :light_black
    when "W"
      :white
    when "w"
      :light_white
    when "M"
      :magenta
    when "m"
      :light_magenta
    else
      :white
    end
  end
end
