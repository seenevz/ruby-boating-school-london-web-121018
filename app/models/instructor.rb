class Instructor
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def find_student_test(student)
    BoatingTest.all.select {|test| test.student == student}
  end

  def pass_student(student, test_name)
      find_student_test(student) ?  (find_student_test(student).select {|test| test.test_status != "passed" })[0].test_status = "passed" : BoatingTest.new(student, test_name, "passed", self)
  end

  def fail_student(student, test_name)
      find_student_test(student) ?  (find_student_test(student).select {|test| test.test_status != "failed" })[0].test_status = "failed" : BoatingTest.new(student, test_name, "failed", self)
  end

end
