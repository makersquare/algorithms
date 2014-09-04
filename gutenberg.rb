require_relative 'lib/simple_predictor'
require_relative 'lib/complex_predictor'

def run!(predictor_klass, opts={})
  puts "+----------------------------------------------------+"
  puts "| #{predictor_klass}#{" " * (51 - predictor_klass.to_s.size)}|"
  puts "+----------------------------------------------------+"
  puts "Loading books..."
  start_time = Time.now
  predictor = predictor_klass.new()
  puts "Loading books took #{Time.now - start_time} seconds."


  puts "Training..."
  start_time = Time.now
  predictor.train!
  puts "Training took #{Time.now - start_time} seconds."

  puts "Predicting..."
  start_time = Time.now
  accuracy = predictor.predict_test_set(opts)
  puts "Predictions took #{Time.now - start_time} seconds."
  puts "Accuracy: #{accuracy}"
end

# run!(SimplePredictor)
run!(ComplexPredictor, debug: true)

