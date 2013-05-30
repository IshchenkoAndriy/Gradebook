class Api::V1::AbsentStudentsController < ApplicationController
  respond_to :json, :xml

  def index
    begin
      date = Date.strptime(params[:date], '%d.%m.%Y')

      students = Student.joins(:presences => :lesson).where(
        :presences => {
          :was_present => false,
          :lesson => {
              :date => date
          }
        }
      )

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
