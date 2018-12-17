class Student
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test( test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end

  def self.find_student(student_name)
    self.all.find {|student| student.name == student_name}
  end

  def student_grades
    BoatingTest.all.find_all {|test| test.student.name == self.name}
  end

  def grade_percentage
    (((student_grades.find_all {|test| test.test_status == "passed"}.length.to_f) / student_grades.length) * 100).round(2)
  end

end
