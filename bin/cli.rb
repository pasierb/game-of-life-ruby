require_relative '../game_of_life';


fixture_path = ARGV[0]
mutations = (ARGV[1] || 1000).to_i
interval = (ARGV[2] || 0.2).to_f

raise ArgumentError.new("provide fixture file") unless fixture_path

Runner = Class.new { include GameOfLife }
game = Runner.new

temp = game.string_stage_parse(File.read(fixture_path))
mutations.times do |i|

  puts `clear`
  puts <<-EOS
fixture:    #{fixture_path}
generation: #{i}/#{mutations}
  EOS

  temp.each do |row|
    arr = row.map do |cell|
      !!cell ? "\u2588" : "_"
    end.to_a

    puts arr.join("|")
  end

  sleep interval

  temp = game.simulate(temp)

end

