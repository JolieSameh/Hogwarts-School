require "application_system_test_case"

class WizardsTest < ApplicationSystemTestCase
  setup do
    @wizard = wizards(:one)
  end

  test "visiting the index" do
    visit wizards_url
    assert_selector "h1", text: "Wizards"
  end

  test "should create wizard" do
    visit wizards_url
    click_on "New wizard"

    fill_in "Bio", with: @wizard.bio
    fill_in "Birthday", with: @wizard.birthday
    fill_in "Email", with: @wizard.email
    fill_in "House", with: @wizard.house
    fill_in "Name", with: @wizard.name
    fill_in "Password", with: @wizard.password
    check "Relatives" if @wizard.relatives
    click_on "Create Wizard"

    assert_text "Wizard was successfully created"
    click_on "Back"
  end

  test "should update Wizard" do
    visit wizard_url(@wizard)
    click_on "Edit this wizard", match: :first

    fill_in "Bio", with: @wizard.bio
    fill_in "Birthday", with: @wizard.birthday
    fill_in "Email", with: @wizard.email
    fill_in "House", with: @wizard.house
    fill_in "Name", with: @wizard.name
    fill_in "Password", with: @wizard.password
    check "Relatives" if @wizard.relatives
    click_on "Update Wizard"

    assert_text "Wizard was successfully updated"
    click_on "Back"
  end

  test "should destroy Wizard" do
    visit wizard_url(@wizard)
    click_on "Destroy this wizard", match: :first

    assert_text "Wizard was successfully destroyed"
  end
end
