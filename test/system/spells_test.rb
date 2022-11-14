require "application_system_test_case"

class SpellsTest < ApplicationSystemTestCase
  setup do
    @spell = spells(:one)
  end

  test "visiting the index" do
    visit spells_url
    assert_selector "h1", text: "Spells"
  end

  test "should create spell" do
    visit spells_url
    click_on "New spell"

    fill_in "Description", with: @spell.description
    fill_in "Name", with: @spell.name
    click_on "Create Spell"

    assert_text "Spell was successfully created"
    click_on "Back"
  end

  test "should update Spell" do
    visit spell_url(@spell)
    click_on "Edit this spell", match: :first

    fill_in "Description", with: @spell.description
    fill_in "Name", with: @spell.name
    click_on "Update Spell"

    assert_text "Spell was successfully updated"
    click_on "Back"
  end

  test "should destroy Spell" do
    visit spell_url(@spell)
    click_on "Destroy this spell", match: :first

    assert_text "Spell was successfully destroyed"
  end
end
