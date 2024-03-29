require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :user_id => 1,
      :title => "MyString",
      :text => "MyText"
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => articles_path, :method => "post" do
      assert_select "input#article_user_id", :name => "article[user_id]"
      assert_select "input#article_title", :name => "article[title]"
      assert_select "textarea#article_text", :name => "article[text]"
    end
  end
end
