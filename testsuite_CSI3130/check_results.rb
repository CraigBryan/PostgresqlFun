# CSI3130 Project Testing script

expected_folder = "./expected/"
actual_folder = "./actual/"

#To add a test, add to this hash
tests = {
  "Expected to pass if script is working" => ["#{actual_folder}expectedPass.csv", "#{expected_folder}expectedPass.csv"],
  "Expected to fail if script is working" => ["#{actual_folder}expectedFail.csv", "#{expected_folder}expectedFail.csv"]
}

test_results = {}

tests.each do |test_name, files| 

  result = "Passed"

  actual_lines = open(files[0]).readlines
  expected_lines = open(files[1]).readlines

  #Actual entry testing
  actual_lines.each_index do |index| 
    if expected_lines[index] != actual_lines[index]
      result = "Failed"
      break
    end 
  end

  test_results[test_name] = result
end

#result output
test_results.each do |test_name, result|
  puts "#{test_name}: #{result}"
end