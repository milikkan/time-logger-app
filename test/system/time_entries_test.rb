require "application_system_test_case"

class TimeEntriesTest < ApplicationSystemTestCase
  setup do
    @time_entry = time_entries(:one)
  end

  test "visiting the index" do
    visit time_entries_url
    assert_selector "h1", text: "Time Entries"
  end

  test "creating a Time entry" do
    visit time_entries_url
    click_on "New Time Entry"

    fill_in "Comment", with: @time_entry.comment
    fill_in "End", with: @time_entry.end
    fill_in "Start", with: @time_entry.start
    click_on "Create Time entry"

    assert_text "Time entry was successfully created"
    click_on "Back"
  end

  test "updating a Time entry" do
    visit time_entries_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @time_entry.comment
    fill_in "End", with: @time_entry.end
    fill_in "Start", with: @time_entry.start
    click_on "Update Time entry"

    assert_text "Time entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Time entry" do
    visit time_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time entry was successfully destroyed"
  end
end
