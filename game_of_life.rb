module GameOfLife

  def simulate(stage)
    stage.map.with_index do |row, row_index|
      row.map.with_index do |column, column_index|
        is_flourishing(!!column, neighbours(stage, row_index, column_index))
      end
    end
  end

  def is_flourishing(state, neighbours)
    (!state && neighbours == 3) || (!!state && (2..3) === neighbours)
  end

  def neighbours(stage, row, column)
    [
      (row > 0 && column > 0 && stage[row - 1] && stage[row - 1][column - 1]),
      (row > 0 && stage[row - 1] && stage[row - 1][column]),
      (row > 0 && stage[row - 1] && stage[row - 1][column + 1]),
      (column > 0 && stage[row][column - 1]),
      (stage[row][column + 1]),
      (column > 0 && stage[row + 1] && stage[row + 1][column - 1]),
      (stage[row + 1] && stage[row + 1][column]),
      (stage[row + 1] && stage[row + 1][column + 1])
    ].reject(&:!).size
  end

  def string_stage_parse(world, empty_char = ".")
    world.each_line.map do |line|
      line.chomp.each_char.map {|char| char != empty_char }
    end
  end

end
