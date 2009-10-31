module ColorsHelper

  def graph_colors
    [ '#a839b2', '#ff0071', '#acd030', '#58aa00', '#00aa78', '#0074ae' ]
  end
  
  def color_for_index(index)
    graph_colors[(index % graph_colors.size)]
  end

end
