require "application_system_test_case"

class NotifingStatsTest < ApplicationSystemTestCase
  setup do
    @notifing_stat = notifing_stats(:one)
  end

  test "visiting the index" do
    visit notifing_stats_url
    assert_selector "h1", text: "Notifing Stats"
  end

  test "creating a Notifing stat" do
    visit notifing_stats_url
    click_on "New Notifing Stat"

    fill_in "Kind", with: @notifing_stat.kind
    fill_in "Player", with: @notifing_stat.player_id
    fill_in "Previous stat", with: @notifing_stat.previous_stat
    fill_in "Target", with: @notifing_stat.target
    fill_in "User", with: @notifing_stat.user_id
    click_on "Create Notifing stat"

    assert_text "Notifing stat was successfully created"
    click_on "Back"
  end

  test "updating a Notifing stat" do
    visit notifing_stats_url
    click_on "Edit", match: :first

    fill_in "Kind", with: @notifing_stat.kind
    fill_in "Player", with: @notifing_stat.player_id
    fill_in "Previous stat", with: @notifing_stat.previous_stat
    fill_in "Target", with: @notifing_stat.target
    fill_in "User", with: @notifing_stat.user_id
    click_on "Update Notifing stat"

    assert_text "Notifing stat was successfully updated"
    click_on "Back"
  end

  test "destroying a Notifing stat" do
    visit notifing_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notifing stat was successfully destroyed"
  end
end
