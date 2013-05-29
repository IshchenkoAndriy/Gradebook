class Api::V1::AbsentStudentsController < ApplicationController
  respond_to :json, :xml

  def index
    begin
      date = Date.strptime(params[:date], '%d.%m.%Y')

      if date.month < 6
        semester = Semester.where(year: date.year).first
      else
        semester = Semester.where(year: date.year).last
      end

      students = Student.joins(:study_groups).where(:study_groups => {:semester_id => semester.id})

      absent_data = Array.new
      students.each do |student|
        absent_data << {
            :student => student.full_name,
            :parents => student.parents.map(&:to_hash)
        }
      end
      respond_with(absent_data)
    rescue Exception => e
      respond_with e.message
    end
  end
end
