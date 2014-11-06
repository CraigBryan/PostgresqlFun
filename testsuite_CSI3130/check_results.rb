tests = {fakeTest => ["fakeFile.csv", "fakeExpectedFile.csv"]}

test.each do |testName, files| {
  actualFile = open(files[0])
  expectedFile = open(files[1])

  actualFile.
}