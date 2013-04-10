module GroupScheduleHelper

  def general_css_classes
    [:word_wrap]
  end

  def full_size_cell_css_classes
    general_css_classes + [:full_width, :full_height, :left_border, :top_border, :centered_cell]
  end

  def half_width_cell_css_classes
    general_css_classes + [:full_height, :centered_cell]
  end

  def half_width_left_align_cell_css_classes
    [:half_width, :full_height, :left_border, :top_border, :left_align_cell]
  end

  def half_height_cell_css_class
    [:half_height, :full_width, :top_border, :left_border, :centered_cell]
  end

  def quarter_size_cell_css_classes
    general_css_classes + [:half_height, :half_width]
  end

  def quarter_size_left_align_cell_css_classes
    quarter_size_cell_css_classes + [:top_border, :left_border, :left_align_cell]
  end

  def quarter_size_top_align_cell_css_classes
    quarter_size_cell_css_classes + [:top_align_cell]
  end

  def get_font_css_class(text)
    case text.length
      when 0..20
        return [:normal_font]

      when 21..36
        return [:smaller_font_12]

      when 37..40
        return [:smaller_font_11]
      else
        return [:smaller_font_10]
    end
  end

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

end
