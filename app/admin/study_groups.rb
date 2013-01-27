ActiveAdmin.register StudyGroup do
  belongs_to :semester
  
  filter :group
  filter :teacher
  
  index do
    column :group
    column :teacher
    default_actions
  end
end
