module FillsHelper

  def get_css_background_value(fill)
    css_color = ''

    if fill.colors.count > 1
      colors = []

      fill.colors.each do |color|
        colors << "##{color.color} #{color.stop}%"
      end

      css_colors = colors.join(', ')
      css_color = 'linear-gradient(90deg, ' + css_colors + ')'
    elsif fill.colors.count == 1
      css_color = '#' + fill.colors.first.color
    end

    css_color
  end

end
