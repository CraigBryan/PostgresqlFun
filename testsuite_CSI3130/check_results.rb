# CSI3130 Project Testing script

expected_folder = "./expected/"
actual_folder = "./actual/"

#To add a test, add to this hash
tests = {
  "Expected to pass if script is working" => ["#{actual_folder}expectedPass.csv", "#{expected_folder}expectedPass.csv"],
  "Expected to fail if script is working" => ["#{actual_folder}expectedFail.csv", "#{expected_folder}expectedFail.csv"],
  "Testcase 1" => ["#{actual_folder}tc1.csv", "#{expected_folder}tc1.csv"],
  "Testcase 2" => ["#{actual_folder}tc2.csv", "#{expected_folder}tc2.csv"],
  "Testcase 3" => ["#{actual_folder}tc3.csv", "#{expected_folder}tc3.csv"],
  "Testcase 4" => ["#{actual_folder}tc4.csv", "#{expected_folder}tc4.csv"],
  "Testcase 5" => ["#{actual_folder}tc5.csv", "#{expected_folder}tc5.csv"],
  "Testcase 6" => ["#{actual_folder}tc6.csv", "#{expected_folder}tc6.csv"],
  "Testcase 7" => ["#{actual_folder}tc7.csv", "#{expected_folder}tc7.csv"]
}

test_results = {}

tests.each do |test_name, files| 

  result = "Passed"

  actual_lines = open(files[0]).readlines
  expected_lines = open(files[1]).readlines

  if actual_lines.length != expected_lines.length
    result = "Failed"
  else
    #Actual entry testing
    actual_lines.each_index do |index| 
      if expected_lines[index] != actual_lines[index]
        result = "Failed"
        break
      end 
    end
  end

  test_results[test_name] = result
end

#result output
test_results.each do |test_name, result|
  puts "#{test_name}: #{result}"
end