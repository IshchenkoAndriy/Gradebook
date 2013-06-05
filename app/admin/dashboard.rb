ActiveAdmin.register_page "Dashboard" do

  page_action :send_sms, :method => :get do
    Student.absent(DateTime.now).each do |student|
      student.parents.each do |parent|
        unless parent.phone.nil?
          #system("echo '#{I18n.t('active_admin.absent_managment.absent_student_message')}' | sudo gnokii --sendsms #{parent.phone}")
          system('gnokii --identify')
        end
      end
    end

    redirect_to :back, notice: I18n.t('active_admin.absent_managment.successful_sended_sms')
  end

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel '%s (%s)' % [I18n.t('active_admin.absent_managment.absent_students'), DateTime.now.to_date] do
          ul do
            Student.absent(DateTime.now).each do |student|
              li student.full_name
            end
          end
        end
      end

      column do
      panel '%s (%s)' % [I18n.t('active_admin.absent_managment.sending_list'), DateTime.now.to_date] do
        ul do
          Student.absent(DateTime.now).each do |student|
            student.parents.each do |parent|
              unless parent.phone.nil?
                li '%s - %s: %s' % [parent.full_name, I18n.t('active_admin.absent_managment.phone'), parent.phone]
              end
            end
          end
        end

        span link_to I18n.t('active_admin.absent_managment.send_sms_button'), admin_dashboard_send_sms_path
        end
      end
    end
  end # content
end
