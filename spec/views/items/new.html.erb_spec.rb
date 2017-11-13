require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :name => "MyString",
      :status => "MyString",
      :workshop => nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_name[name=?]", "item[name]"

      assert_select "input#item_status[name=?]", "item[status]"

      assert_select "input#item_workshop_id[name=?]", "item[workshop_id]"
    end
  end
end
