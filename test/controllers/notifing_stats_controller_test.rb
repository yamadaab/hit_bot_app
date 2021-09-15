require "test_helper"

class NotifingStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notifing_stat = notifing_stats(:one)
  end

  test "should get index" do
    get notifing_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_notifing_stat_url
    assert_response :success
  end

  test "should create notifing_stat" do
    assert_difference('NotifingStat.count') do
      post notifing_stats_url, params: { notifing_stat: { kind: @notifing_stat.kind, player_id: @notifing_stat.player_id, previous_stat: @notifing_stat.previous_stat, target: @notifing_stat.target, user_id: @notifing_stat.user_id } }
    end

    assert_redirected_to notifing_stat_url(NotifingStat.last)
  end

  test "should show notifing_stat" do
    get notifing_stat_url(@notifing_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_notifing_stat_url(@notifing_stat)
    assert_response :success
  end

  test "should update notifing_stat" do
    patch notifing_stat_url(@notifing_stat), params: { notifing_stat: { kind: @notifing_stat.kind, player_id: @notifing_stat.player_id, previous_stat: @notifing_stat.previous_stat, target: @notifing_stat.target, user_id: @notifing_stat.user_id } }
    assert_redirected_to notifing_stat_url(@notifing_stat)
  end

  test "should destroy notifing_stat" do
    assert_difference('NotifingStat.count', -1) do
      delete notifing_stat_url(@notifing_stat)
    end

    assert_redirected_to notifing_stats_url
  end
end
