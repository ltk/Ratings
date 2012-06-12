# Load our entry class
require './image'
require './battle'

# Setup the empty array to hold our entries... in this case Images
@images = []

# Create some images and store them in the array
(0..10).each do |image|
  @images[image] = Image.new
end

# Sort them by unweighted score
@images.sort! { |a,b| b.score <=> a.score }

puts "\nUNWEIGHTED SCORES"

# Print them out one by one
@images.each_with_index do |image, index|
  puts "Image #{image.id}: UW Score: #{image.score.round(3)}, W Score: #{image.weighted_score.round(3)} (Battles: #{image.battles}, Win %: #{(image.win_percentage * 100).round(2)}, SoS: #{image.avg_score_of_wins.round(3)} )"
end

# Sort them by weighted score
@images.sort! { |a,b| b.weighted_score <=> a.weighted_score }

puts "\nWEIGHTED SCORES"

# Print them out one by one
@images.each_with_index do |image, index|
  puts "Image #{image.id}: UW Score: #{image.score.round(3)}, W Score: #{image.weighted_score.round(3)} (Battles: #{image.battles}, Win %: #{(image.win_percentage * 100).round(2)}, SoS: #{image.avg_score_of_wins.round(3)} )"
end

10.times do
  @image1 = @images[rand(@images.size-1)]
  @image2 = @images.reject { |i| i.id == @image1.id }[rand(@images.size-1)]
  Battle.new(@image1, @image2)
end

# Sort them by weighted score
@images.sort! { |a,b| b.weighted_score <=> a.weighted_score }

puts "\nNEW WEIGHTED SCORES"

# Print them out one by one
@images.each do |image|
  puts "Image #{image.id}: UW Score: #{image.score.round(3)}, W Score: #{image.weighted_score.round(3)} (Battles: #{image.battles}, Win %: #{(image.win_percentage * 100).round(2)}, SoS: #{image.avg_score_of_wins.round(3)} )"
end

