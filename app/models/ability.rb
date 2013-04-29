class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
    can :read, Article
    
    if user.has_capability? 'write_articles'
      can :create, Article
      can :update, Article do |article|
        article.try(:user) == user
      end
    end
      
    if user.has_capability? 'manage_articles'
      can :manage, Article
    end

    if user.teacher_id
      puts "Allow premissions teacher id: #{user.teacher_id} with mail #{user.email}"
      can :read, Semester
      can :read, DoubleClass, :teacher_id => user.teacher_id
      can :manage, Lesson, :double_class => { :teacher_id => user.teacher_id }
      can :manage, LessonMark, :lesson => { :double_class => { :teacher_id => user.teacher_id } }
      can :manage, Presence, :lesson => { :double_class => { :teacher_id => user.teacher_id } }
      can :manage, AdditionalMark, :double_class => { :teacher_id => user.teacher_id }
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
