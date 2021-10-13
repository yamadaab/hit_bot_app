class NotifingStatMailer < ApplicationMailer
  def report_updated_stat(notifing_stat, yesterday_result, player, target, kind)
    @yesterday_result = yesterday_result
    @player = player
    @target = target
    @kind = kind
    email = User.find(notifing_stat.user_id).email
    mail(to: email, subject: 'ご登録の選手の記録が更新されました！！')
  end
end
