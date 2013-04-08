module GroupScheduleHelper

  def schedule_for_schedule_cell(day, double_class_number, global_schedule)
    global_schedule.find_all{ |schedule| schedule.day_of_week == day and schedule.double_class_number == double_class_number }
  end

  def get_count_rows(day_schedule)
    if day_schedule.count != 0
      count = 2
      day_schedule.each do |schedule|
        if schedule.numerator_denominator == 3
          count = 1
        end
      end
      count
    else
      day_schedule.count
    end
  end

  def get_count_columns(day_schedule)
    if day_schedule.count != 0
      count = 2
      day_schedule.each do |schedule|
        if schedule.subgroup == 3
          count = 1
        end
      end
      count
    else
      day_schedule.count
    end
  end

  def get_count_rows_for_column(column, day_schedule)
    rows = day_schedule.find_all{ |schedule| schedule.subgroup == column }
    if rows.count != 0
      if rows.first.numerator_denominator == 3
        1
      else
        2
      end
    else
      2
    end
  end

  def get_count_columns_for_row(row, day_schedule)
    columns = day_schedule.find_all{ |schedule| schedule.numerator_denominator == row }
    if columns.count != 0
      if columns.first.subgroup == 3
        1
      else
        2
      end
    else
      2
    end
  end

  def get_rows_for_column(column, row, day_schedule)
    rows = day_schedule.find_all{ |schedule| schedule.subgroup == column and (schedule.numerator_denominator == row or schedule.numerator_denominator == 3) }
    if rows.count != 0
      rows.first
    else
      '-'
    end
  end

  def get_columns_for_row(column, row, day_schedule)
    columns = day_schedule.find_all{ |schedule| schedule.numerator_denominator == row and (schedule.subgroup == column or schedule.subgroup == 3) }
    if columns.count != 0
      columns.first
    else
      '-'
    end
  end

  def get_rows_at_column(column, day_schedule)
    rows = day_schedule.find_all{ |schedule| schedule.subgroup == column }
    case rows.count
      when 0
        rows = ['-', '-']

      when 1
        if rows.first.numerator_denominator != 3
          rows << '-'
        end
    end

    rows
  end

  def get_columns_at_row(row, day_schedule)
    columns = day_schedule.find_all{ |schedule| schedule.numerator_denominator == row }

    case columns.count
      when 0
        columns = ['-', '-']

      when 1
        if columns.first.numerator_denominator != 3
          columns << '-'
        end
    end

    columns
  end


end
