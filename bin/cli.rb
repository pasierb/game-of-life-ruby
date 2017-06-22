require_relative '../game_of_life';

mutations = 1000
world = <<-EOS
..............
..............
...O..........
...O..........
...O..........
..............
EOS

if ARGV[0]
  world = File.read(ARGV[0])
end

puts world

Runner = Class.new { include GameOfLife }
game = Runner.new
temp = game.string_stage_parse(world)

mutations.times do |i|
  puts `clear`
  puts "generation: #{i}/#{mutations}\n\n"

  temp.each do |row|
    arr = row.map do |cell|
      !!cell ? "X" : "_"
    end

    puts arr.join("|")
  end

  sleep 0.5

  temp = game.simulate(temp)
end

