require_relative '../game_of_life';

raise ArgumentError.new("provide fixture file") unless ARGV[0]

mutations = (ARGV[1] || 1000).to_i
interval = (ARGV[2] || 0.2).to_f

Runner = Class.new { include GameOfLife }
game = Runner.new

temp = game.string_stage_parse(File.read(ARGV[0]))
mutations.times do |i|

  puts `clear`
  puts <<-EOS
fixture:    #{ARGV[0]}
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

