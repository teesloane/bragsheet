require "application_system_test_case"

class WinsTest < ApplicationSystemTestCase
  setup do
    @win = wins(:one)
  end

  test "visiting the index" do
    visit wins_url
    assert_selector "h1", text: "Wins"
  end

  test "should create win" do
    visit wins_url
    click_on "New win"

    fill_in "Achievement date", with: @win.achievement_date
    fill_in "Description", with: @win.description
    fill_in "Impact", with: @win.impact
    fill_in "Private notes", with: @win.private_notes
    fill_in "Title", with: @win.title
    fill_in "User", with: @win.user_id
    click_on "Create Win"

    assert_text "Win was successfully created"
    click_on "Back"
  end

  test "should update Win" do
    visit win_url(@win)
    click_on "Edit this win", match: :first

    fill_in "Achievement date", with: @win.achievement_date
    fill_in "Description", with: @win.description
    fill_in "Impact", with: @win.impact
    fill_in "Private notes", with: @win.private_notes
    fill_in "Title", with: @win.title
    fill_in "User", with: @win.user_id
    click_on "Update Win"

    assert_text "Win was successfully updated"
    click_on "Back"
  end

  test "should destroy Win" do
    visit win_url(@win)
    click_on "Destroy this win", match: :first

    assert_text "Win was successfully destroyed"
  end
end
