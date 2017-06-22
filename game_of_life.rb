module GameOfLife

  def simulate(stage)
    stage.map.with_index do |row, row_index|
      row.map.with_index do |column, column_index|
        neighbours_count = neighbours(stage, row_index, column_index)

        is_flourishing(!!column, neighbours_count)
      end
    end
  end

  def is_flourishing(state, neighbours_count)
    (!state && neighbours_count == 3) || (!!state && (2..3) === neighbours_count) || nil
  end

  def neighbours(stage, row, column)
    [
      (stage[row - 1] && stage[row - 1][column - 1]),
      (stage[row - 1] && stage[row - 1][column]),
      (stage[row - 1] && stage[row - 1][column + 1]),
      (stage[row][column - 1]),
      (stage[row][column + 1]),
      (stage[row + 1] && stage[row + 1][column - 1]),
      (stage[row + 1] && stage[row + 1][column]),
      (stage[row + 1] && stage[row + 1][column + 1])
    ].compact.size
  end

  def string_stage_parse(world)
    stage = []

    world.each_line do |line|
      row = []

      line.chomp.each_char {|char| row.push(char == '.' ? nil : true) }

      stage.push(row)
    end

    stage
  end

end
