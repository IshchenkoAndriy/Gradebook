class Api::V1::DevelopersController < ApplicationController
  SAMPLES ||= YAML::load(File.open('./app/views/api/v1/developers/samples.yml'))
  
  def index
    @version = 'v1'
    @topics = [
      {
        :name => 'basic',
        :has_partial => true
      },
      {
        :name => 'architecture',
        :has_partial => true
      },
      {
        :name => 'semesters',
        :has_partial => false,
        :topics => SAMPLES[:semester]
      },
      {
        :name => 'groups',
        :has_partial => false,
        :topics => SAMPLES[:group]
      },
      {
        :name => 'students',
        :has_partial => false,
        :topics => SAMPLES[:student]
      },
      {
        :name => 'subjects',
        :has_partial => false,
        :topics => SAMPLES[:subject]
      }
    ]
  end
end
