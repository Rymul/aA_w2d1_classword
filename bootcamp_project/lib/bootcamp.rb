class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = Array.new
    @students = Array.new
    @grades = Hash.new {|h, k| h[k] = []}
  end

    def name
      @name
    end

    def slogan
      @slogan
    end

    def student_capacity
      @student_capacity
    end

    def teachers
      @teachers
    end

    def students
      @students
    end 

    def hire(str)
      teachers << str
    end

    def enroll(stu)
      if students.length < student_capacity
        students << stu
        return true
      else
        return false
      end
    end

    def enrolled?(stu_str)
      students.include?(stu_str)
        
    end

    def student_to_teacher_ratio
      num_stu = students.length
      num_t = teachers.length
      num_stu / num_t
    end


    def add_grade(stu, n)
      # students.each do |student|
      if students.include?(stu)
        @grades[stu] << n
        return true
      else
        return false
      end
  
    end

    def num_grades(str)
      values = []
      @grades.each_value do |v|
        if @grades.has_key?(str)
          values = v
        end
      end
      values.count
    end

    def average_grade(str)
      values = []
      @grades.each_value do |v|
        if @grades.has_key?(str)
          values = v
        end
      end
      if values.length < 1
        return nil
      end
      values.sum / values.count
    end
end







